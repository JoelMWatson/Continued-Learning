package net.watsoncodes;

import java.util.Random;

import org.springframework.stereotype.Component;

@Component
public class RandomFortuneService implements FortuneService {

	private String[] data = { "There is a ham", "Where is my ham", "I want some ham" };

	private Random random = new Random();

	@Override
	public String getFortune() {

		int index = random.nextInt(data.length);
		String fortune = data[index];

		return fortune;
	}

}
