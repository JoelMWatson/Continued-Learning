package net.watsoncodes;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class JavaConfigDemoApp {

	public static void main(String[] args) {

		// Read Spring config
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(SportConfig.class);

		// Get bean from spring
		Coach coach = context.getBean("tennisCoach", Coach.class);

		// call methods on bean
		System.out.println(coach.getDailyWorkout());
		System.out.println(coach.getDailyFortune());

		// close the context
		context.close();
	}

}
