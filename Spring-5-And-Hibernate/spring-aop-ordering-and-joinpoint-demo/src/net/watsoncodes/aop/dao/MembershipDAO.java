package net.watsoncodes.aop.dao;

import org.springframework.stereotype.Component;

@Component
public class MembershipDAO {
	public void addAccount() {
		System.out.println(getClass() + " DOING MY DB WORK ADDING A MEMBERSHIP");
	}

	public String coffeeAndBacon() {
		System.out.println(getClass() + " Coffee and bacon");
		return "";
	}
}
