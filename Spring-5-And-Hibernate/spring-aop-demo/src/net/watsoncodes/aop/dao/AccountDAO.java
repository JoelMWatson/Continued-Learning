package net.watsoncodes.aop.dao;

import org.springframework.stereotype.Component;

import net.watsoncodes.aop.Account;

@Component
public class AccountDAO {

	public void addAccount(Account account, boolean vip) {
		System.out.println(getClass() + " DOING MY DB WORK ADDING AN ACCOUNT");
	}

	public Boolean hamAndCheese() {
		System.out.println(getClass() + " HAM AND CHEESE");
		return false;
	}
}
