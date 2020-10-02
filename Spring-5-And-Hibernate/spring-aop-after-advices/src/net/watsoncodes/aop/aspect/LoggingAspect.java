package net.watsoncodes.aop.aspect;

import java.util.List;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
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

	@After("execution(* net.watsoncodes.aop.dao.AccountDAO.findAccounts(..))")
	public void afterFinallyAccountsAdvice(JoinPoint joinPoint) {

		// print method we are advising
		String method = joinPoint.getSignature().toShortString();
		System.out.println("\n=====>>> Executing @After(finaly) on method: " + method);

	}

	@AfterThrowing(pointcut = "execution(* net.watsoncodes.aop.dao.AccountDAO.findAccounts(..))", throwing = "exception")
	public void afterThrowingFindAccountsAdvice(JoinPoint joinPoint, Throwable exception) {

		// print method we are advising
		String method = joinPoint.getSignature().toShortString();
		System.out.println("\n=====>>> Executing @AfterThrowing on method: " + method);

		// log the exception
		System.out.println("\n=====>>> Exception: " + exception);
	}

	// add a new advice for after returning on findAccounts method
	@AfterReturning(pointcut = "execution(* net.watsoncodes.aop.dao.AccountDAO.findAccounts(..))", returning = "result")
	public void afterReturningFindAccountsAdvice(JoinPoint joinPoint, List<Account> result) {

		// print method
		String method = joinPoint.getSignature().toShortString();
		System.out.println("\n=====>>> Executing @AfterReturning on method: " + method);

		// print results of method call
		System.out.println("\n=====>>> Results: " + result);

		// Here we can post process the data (modify it in some way)

		// Convert account names to all uppercase;
		converAccountNamestoUpperCase(result);
		System.out.println("\n=====>>> Uppercase results: " + result);

	}

	private void converAccountNamestoUpperCase(List<Account> result) {
		for (Account acc : result) {
			acc.setName(acc.getName().toUpperCase());
		}

	}

	@Before("net.watsoncodes.aop.aspect.MyPointcuts.notGetOrSet()")
	public void beforeAddAccountAdvice(JoinPoint joinPoint) {
		System.out.println("\n========>> Executing @Before advice on addAccount");

		// get method signature
		MethodSignature methodSig = (MethodSignature) joinPoint.getSignature();

		// display method signature
		System.out.println("Method Signature: " + methodSig);

		// get method arguments
		Object[] args = joinPoint.getArgs();

		// display method arguments
		for (Object temp : args) {
			System.out.println(temp);

			if (temp instanceof Account) {
				// downcast and print account specific data
				Account account = (Account) temp;

				System.out.println("Account name: " + account.getName());
				System.out.println("Account level: " + account.getLevel());
			}
		}
	}
}
