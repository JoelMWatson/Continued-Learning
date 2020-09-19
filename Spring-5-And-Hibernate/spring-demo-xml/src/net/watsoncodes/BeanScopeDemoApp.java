package net.watsoncodes;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class BeanScopeDemoApp {

	public static void main(String[] args) {

		// load spring config file
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("beanScope-applicationContext.xml");
		
		// get bean from spring container
		Coach coach = context.getBean("myCoach", Coach.class);
		Coach coach2 = context.getBean("myCoach", Coach.class);	
		
		// check if they are actually the same bean
		boolean same = coach == coach2;
		
		// print result and mem location
		System.out.println("Same Object: " + same);
		System.out.println("Coach mem: " + coach);
		System.out.println("Coach2 mem: " + coach2);
		
		// close context
		context.close();
		
	}

}
