package net.watsoncodes.aop.aspect;

import org.aspectj.lang.JoinPoint;
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
