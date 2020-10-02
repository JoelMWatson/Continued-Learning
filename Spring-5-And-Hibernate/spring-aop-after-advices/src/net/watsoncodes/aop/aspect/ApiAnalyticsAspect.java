package net.watsoncodes.aop.aspect;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Aspect
@Component
@Order(2)
public class ApiAnalyticsAspect {
	@Before("net.watsoncodes.aop.aspect.MyPointcuts.notGetOrSet()")
	public void performApiAnalytics() {
		System.out.println("\n========>> Performing Analytics");
	}
}
