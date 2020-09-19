package net.watsoncodes;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class BeanLifeCycleDemoApp {

	public static void main(String[] args) {

		// load spring config file
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("beanLifeCycle-applicationContext.xml");
		
		// get bean from spring container
		Coach coach = context.getBean("myCoach", Coach.class);
	
		
		// print result and mem location
		System.out.println(coach.getDailyWorkout());
		
		// close context
		context.close();
		
	}

}
