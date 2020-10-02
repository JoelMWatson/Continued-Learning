package net.watsoncodes.aop.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import net.watsoncodes.aop.Account;

@Component
public class AccountDAO {

	private String name;
	private String serviceCode;

	public void addAccount(Account account, boolean vip) {
		System.out.println(getClass() + " DOING MY DB WORK ADDING AN ACCOUNT");
	}

	public Boolean hamAndCheese() {
		System.out.println(getClass() + " HAM AND CHEESE");
		return false;
	}

	public List<Account> findAccounts(boolean exception) {

		if (exception) { throw new RuntimeException("BOOOOOOOOOOOOOOMMMMMMMMM"); }

		List<Account> accounts = new ArrayList<>();

		// create sample accounts
		Account acc1 = new Account("John", "Ham");
		Account acc2 = new Account("Jane", "Egg");
		Account acc3 = new Account("Joe", "Cheese");

		// add samples to accounts list
		accounts.add(acc1);
		accounts.add(acc2);
		accounts.add(acc3);

		return accounts;
	}

	public String getName() {
		System.out.println(getClass() + " DOING getName");
		return name;
	}

	public void setName(String name) {
		System.out.println(getClass() + " DOING setName");
		this.name = name;
	}

	public String getServiceCode() {
		System.out.println(getClass() + " DOING getServiceCode");
		return serviceCode;
	}

	public void setServiceCode(String serviceCode) {
		System.out.println(getClass() + " DOING setServiceCode");
		this.serviceCode = serviceCode;
	}

}
