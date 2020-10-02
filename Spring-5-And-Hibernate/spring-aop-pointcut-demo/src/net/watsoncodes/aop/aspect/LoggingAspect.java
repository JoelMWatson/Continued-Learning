package net.watsoncodes.aop.aspect;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {

	// create pointcut for all methods in package
	@Pointcut("execution(* net.watsoncodes.aop.dao.*.*(..))")
	private void forDaoPackage() {};

	// create pointcut for getter methods
	@Pointcut("execution(* net.watsoncodes.aop.dao.*.get*(..))")
	private void getGetters() {};

	// create pointcut for setter methods
	@Pointcut("execution(* net.watsoncodes.aop.dao.*.set*(..))")
	private void getSetters() {};

	// create pointcut to combine above 3 and include package but exclude getters
	// and setters
	@Pointcut("forDaoPackage() && !(getGetters() || getSetters())")
	private void notGetOrSet() {};

	@Before("notGetOrSet()")
	public void beforeAddAccountAdvice() {
		System.out.println("\n========>> Executing @Before advice on addAccount");
	}

	@Before("notGetOrSet()")
	public void performApiAnalytics() {
		System.out.println("\n========>> Performing Analytics");

	}
}
