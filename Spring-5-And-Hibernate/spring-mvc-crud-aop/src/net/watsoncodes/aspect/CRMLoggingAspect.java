package net.watsoncodes.aspect;

import java.util.logging.Logger;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class CRMLoggingAspect {

	// setup logger
	Logger logger = Logger.getLogger(getClass().getName());

	// Declare Pointcuts
	@Pointcut("execution(* net.watsoncodes.controller.*.*(..))")
	private void forControllerPackage() {}

	@Pointcut("execution(* net.watsoncodes.service.*.*(..))")
	private void forServicePackage() {}

	@Pointcut("execution(* net.watsoncodes.dao.*.*(..))")
	private void forDaoPackage() {}

	@Pointcut("forControllerPackage() || forServicePackage() || forDaoPackage()")
	private void forAppFlow() {}

	@Before("forAppFlow()")
	public void before(JoinPoint joinPoint) {
		String method = joinPoint.getSignature().toShortString();
		logger.info("---------------@Before: " + method);

		Object[] args = joinPoint.getArgs();

		for (Object arg : args) {
			logger.info("Arg: " + arg);
		}
	}

	@AfterReturning(pointcut = "forAppFlow()", returning = "result")
	public void afterReturning(JoinPoint joinPoint, Object result) {
		String method = joinPoint.getSignature().toShortString();
		logger.info("---------------@AfterReturning: " + method);
		logger.info("---------------@Result is: " + result);
	}
}
