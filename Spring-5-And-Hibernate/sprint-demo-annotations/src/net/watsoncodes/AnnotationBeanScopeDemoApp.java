package net.watsoncodes;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AnnotationBeanScopeDemoApp {

	public static void main(String[] args) {

		// load spring config
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");

		// get bean from spring
		Coach coach = context.getBean("tennisCoach", Coach.class);
		Coach coach2 = context.getBean("tennisCoach", Coach.class);

		boolean result = coach == coach2;

		System.out.println("Same: " + result);
		System.out.println("Coach: " + coach);
		System.out.println("Coach2: " + coach2);

		// close bean
		context.close();
	}

}
