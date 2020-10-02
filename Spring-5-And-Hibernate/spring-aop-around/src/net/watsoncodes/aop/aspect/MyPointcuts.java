package net.watsoncodes.aop.aspect;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class MyPointcuts {
	// create pointcut for all methods in package
	@Pointcut("execution(* net.watsoncodes.aop.dao.*.*(..))")
	public void forDaoPackage() {};

	// create pointcut for getter methods
	@Pointcut("execution(* net.watsoncodes.aop.dao.*.get*(..))")
	public void getGetters() {};

	// create pointcut for setter methods
	@Pointcut("execution(* net.watsoncodes.aop.dao.*.set*(..))")
	public void getSetters() {};

	// create pointcut to combine above 3 and include package but exclude getters
	// and setters
	@Pointcut("forDaoPackage() && !(getGetters() || getSetters())")
	public void notGetOrSet() {};
}
