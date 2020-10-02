package net.watsoncodes.aop.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import net.watsoncodes.aop.Account;

@Aspect
@Component
@Order(1) // sets the order
public class LoggingAspect {

	// use this logger instead of myLogger.info to keep on same stream as
	// spring
	private Logger myLogger = Logger.getLogger(getClass().getName());

	@Around("execution(* net.watsoncodes.aop.service.*.getFortune(..))")
	public Object aroundGetFortune(ProceedingJoinPoint joinPoint) throws Throwable {

		// print method we are advising
		String method = joinPoint.getSignature().toShortString();
		myLogger.info("\n=====>>> Executing @Around on method: " + method);

		// start timestamp
		long begin = System.currentTimeMillis();

		// run method
		Object result = null;

		try {
			result = joinPoint.proceed();
		} catch (Exception e) {
			myLogger.warning(e.getMessage());

			result = "Major Accident...good thing you can fly!!";

		}

		// end timestamp
		long end = System.currentTimeMillis();

		// get duration
		long duration = end - begin;

		myLogger.info("\n=====>>> Method run duration: " + (duration / 1000) + " seconds");

		return result;
	}

	@After("execution(* net.watsoncodes.aop.dao.AccountDAO.findAccounts(..))")
	public void afterFinallyAccountsAdvice(JoinPoint joinPoint) {

		// print method we are advising
		String method = joinPoint.getSignature().toShortString();
		myLogger.info("\n=====>>> Executing @After(finaly) on method: " + method);

	}

	@AfterThrowing(pointcut = "execution(* net.watsoncodes.aop.dao.AccountDAO.findAccounts(..))", throwing = "exception")
	public void afterThrowingFindAccountsAdvice(JoinPoint joinPoint, Throwable exception) {

		// print method we are advising
		String method = joinPoint.getSignature().toShortString();
		myLogger.info("\n=====>>> Executing @AfterThrowing on method: " + method);

		// log the exception
		myLogger.info("\n=====>>> Exception: " + exception);
	}

	// add a new advice for after returning on findAccounts method
	@AfterReturning(pointcut = "execution(* net.watsoncodes.aop.dao.AccountDAO.findAccounts(..))", returning = "result")
	public void afterReturningFindAccountsAdvice(JoinPoint joinPoint, List<Account> result) {

		// print method
		String method = joinPoint.getSignature().toShortString();
		myLogger.info("\n=====>>> Executing @AfterReturning on method: " + method);

		// print results of method call
		myLogger.info("\n=====>>> Results: " + result);

		// Here we can post process the data (modify it in some way)

		// Convert account names to all uppercase;
		converAccountNamestoUpperCase(result);
		myLogger.info("\n=====>>> Uppercase results: " + result);

	}

	private void converAccountNamestoUpperCase(List<Account> result) {
		for (Account acc : result) {
			acc.setName(acc.getName().toUpperCase());
		}

	}

	@Before("net.watsoncodes.aop.aspect.MyPointcuts.notGetOrSet()")
	public void beforeAddAccountAdvice(JoinPoint joinPoint) {
		myLogger.info("\n========>> Executing @Before advice on addAccount");

		// get method signature
		MethodSignature methodSig = (MethodSignature) joinPoint.getSignature();

		// display method signature
		myLogger.info("Method Signature: " + methodSig);

		// get method arguments
		Object[] args = joinPoint.getArgs();

		// display method arguments
		for (Object temp : args) {
			myLogger.info(temp.toString());

			if (temp instanceof Account) {
				// downcast and print account specific data
				Account account = (Account) temp;

				myLogger.info("Account name: " + account.getName());
				myLogger.info("Account level: " + account.getLevel());
			}
		}
	}
}
