package net.watsoncodes;

public class TrackCoach implements Coach {

	private FortuneService fortune;
	
	public TrackCoach(FortuneService fortune) {
		this.fortune = fortune;
	}

	@Override
	public String getDailyWorkout() {
		return "Run a hard 5k";
	}

	@Override
	public String getDailyFortune() {
		return fortune.getFortune() + " Just kidding go run laps sucker.";
	}
	
	// add init
	public void initializeMethod() {
		System.out.println("inside init");
	}
	
	// add destroy
	public void destroyMethod() {
		System.out.println("inside destroy");
	}
}
