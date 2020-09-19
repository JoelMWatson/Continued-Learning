package net.watsoncodes;

public class MyApp {

	public static void main(String[] args) {
		FortuneService fortune = new HappyFortuneService();
		Coach coach = new TrackCoach(fortune);

		System.out.println(coach.getDailyWorkout());
		System.out.println(coach.getDailyFortune());
	}

}
