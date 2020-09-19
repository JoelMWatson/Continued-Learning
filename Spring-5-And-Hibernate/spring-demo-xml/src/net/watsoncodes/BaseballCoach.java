package net.watsoncodes;

public class BaseballCoach implements Coach {
	
	private FortuneService fortune;
	
	public BaseballCoach(FortuneService fortune) {
		this.fortune = fortune;
	}

	@Override
	public String getDailyWorkout() {
		return "Spend 30 minutes on batting practice";
	}

	@Override
	public String getDailyFortune() {
		
		return fortune.getFortune();
	}
}
