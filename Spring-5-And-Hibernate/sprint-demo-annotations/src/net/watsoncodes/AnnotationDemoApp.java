package net.watsoncodes;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AnnotationDemoApp {

	public static void main(String[] args) {

		// Read Spring config
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");

		// Get bean from spring
		Coach coach = context.getBean("tennisCoach", Coach.class);

		Coach coach2 = context.getBean("swimCoach", Coach.class);

		// call methods on bean
		System.out.println(coach.getDailyWorkout());
		System.out.println(coach.getDailyFortune());

		System.out.println(coach2.getDailyWorkout());
		System.out.println(coach2.getDailyFortune());

		// close the context
		context.close();
	}

}
