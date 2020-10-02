package net.watsoncodes.aop;

import java.util.logging.Logger;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.watsoncodes.aop.service.TrafficFortuneService;

public class MainDemoApp {

	private static Logger myLogger = Logger.getLogger(MainDemoApp.class.getName());

	public static void main(String[] args) {

		// read config java class
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(DemoConfig.class);

		// get the bean from spring
		TrafficFortuneService fortuneService = context.getBean("trafficFortuneService", TrafficFortuneService.class);

		myLogger.info("Calling Fortune");

		// call fortune service
		boolean exception = true;
		String data = fortuneService.getFortune(exception);

		myLogger.info("Fortune is: " + data);

		myLogger.info("Finished");

		// close context
		context.close();

	}
}
