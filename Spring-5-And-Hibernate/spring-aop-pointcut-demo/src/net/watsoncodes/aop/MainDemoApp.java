package net.watsoncodes.aop;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.watsoncodes.aop.dao.AccountDAO;
import net.watsoncodes.aop.dao.MembershipDAO;

public class MainDemoApp {

	public static void main(String[] args) {

		// read config java class
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(DemoConfig.class);

		// get the bean from spring
		AccountDAO accountDAO = context.getBean("accountDAO", AccountDAO.class);
		MembershipDAO membershipDAO = context.getBean("membershipDAO", MembershipDAO.class);

		// call the method
		accountDAO.addAccount(new Account(), true);
		accountDAO.hamAndCheese();

		// use accountdao getter/setter methods
		accountDAO.setName("foobar");
		accountDAO.setServiceCode("silver");
		accountDAO.getName();
		accountDAO.getServiceCode();

		membershipDAO.addAccount();
		membershipDAO.coffeeAndBacon();

		// close context
		context.close();

	}
}
