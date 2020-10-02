package net.watsoncodes.aop;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.watsoncodes.aop.service.TrafficFortuneService;

public class MainDemoApp {

	// currently set up to use my logger instead of system.out.println
	// from WithLoggerDemo.java (same stream as Spring)
	public static void main(String[] args) {

		// read config java class
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(DemoConfig.class);

		// get the bean from spring
		TrafficFortuneService fortuneService = context.getBean("trafficFortuneService", TrafficFortuneService.class);

		System.out.println("Calling Fortune");

		// call fortune service
		String data = fortuneService.getFortune();

		System.out.println("Fortune is: " + data);

		System.out.println("Finished");

		// close context
		context.close();

	}
}
