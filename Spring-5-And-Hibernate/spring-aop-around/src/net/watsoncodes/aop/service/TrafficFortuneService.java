package net.watsoncodes.aop.service;

import java.util.concurrent.TimeUnit;

import org.springframework.stereotype.Component;

@Component
public class TrafficFortuneService {

	public String getFortune() {

		// Simulate a delay
		try {
			TimeUnit.SECONDS.sleep(5);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return "Good Luck";
	}
}
