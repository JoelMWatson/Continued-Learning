package net.watsoncodes.aop.aspect;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {

//	@Before("execution(public void addAccount())") // for any class
//	@Before("execution(public void net.watsoncodes.aop.dao.AccountDAO.addAccount())") // just for specific class
//	@Before("execution(public void add*())") // any class/ any function starting with add
//	@Before("execution(* add*())") // same as above but any modifier or return type
//	@Before("execution(* add*(net.watsoncodes.aop.Account))") // needs param of specific type
//	@Before("execution(* add*(net.watsoncodes.aop.Account, ..))") // same as above followed by any number of params
//	@Before("execution(* add*(..))") // any number of params
	@Before("execution(* net.watsoncodes.aop.dao.*.*(..))") // any method in any class in the given package
	public void beforeAddAccountAdvice() {
		System.out.println("\n========>> Executing @Before advice on addAccount");
	}
}
