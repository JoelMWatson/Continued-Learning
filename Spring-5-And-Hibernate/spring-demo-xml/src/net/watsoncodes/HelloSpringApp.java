package net.watsoncodes;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloSpringApp {

	public static void main(String[] args) { 
		
		// load the spring config file
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		
		// get bean from spring container
		Coach coach = context.getBean("myCoach", Coach.class);
		CricketCoach cricket = context.getBean("cricketCoach", CricketCoach.class);
		
		// call methods on bean
		System.out.println(coach.getDailyWorkout());
		System.out.println(coach.getDailyFortune());
		System.out.println(cricket.getDailyWorkout());
		System.out.println(cricket.getDailyFortune());
		System.out.println(cricket.getTeam());
		System.out.println(cricket.getEmail());
		
		// close context
		context.close();

	}

}
