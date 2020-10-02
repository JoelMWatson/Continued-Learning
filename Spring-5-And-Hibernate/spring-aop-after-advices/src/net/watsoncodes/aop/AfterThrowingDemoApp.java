package net.watsoncodes.aop;

import java.util.List;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.watsoncodes.aop.dao.AccountDAO;

public class AfterThrowingDemoApp {

	public static void main(String[] args) {

		// read config java class
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(DemoConfig.class);

		// get the bean from spring
		AccountDAO accountDAO = context.getBean("accountDAO", AccountDAO.class);

		// call method to find accounts
		List<Account> accounts = null;
		try {
			// add a boolean to simulate exception
			boolean exception = true;
			accounts = accountDAO.findAccounts(exception);
		} catch (Exception e) {
			System.out.println("Main program caught exception " + e);
		}

		// display accounts
		System.out.println("Main program: ");
		System.out.println(accounts);

		// close context
		context.close();

	}
}
