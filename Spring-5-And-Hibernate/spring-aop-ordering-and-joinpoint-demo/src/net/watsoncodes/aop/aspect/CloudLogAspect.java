package net.watsoncodes.aop.aspect;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Aspect
@Component
@Order(3)
public class CloudLogAspect {
	@Before("net.watsoncodes.aop.aspect.MyPointcuts.notGetOrSet()")
	public void logToCloud() {
		System.out.println("\n========>> Loggint to Cloud");
	}
}
