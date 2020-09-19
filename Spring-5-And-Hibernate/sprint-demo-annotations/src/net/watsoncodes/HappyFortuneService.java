package net.watsoncodes;

import org.springframework.stereotype.Component;

@Component
public class HappyFortuneService implements FortuneService {

	@Override
	public String getFortune() {
		return "You lucky ducky!!!";
	}

}
