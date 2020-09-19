package net.watsoncodes;

public class CricketCoach implements Coach {

	private FortuneService fortune;
	private String email;
	private String team;
	
	
	public CricketCoach() {
		System.out.println("CricketCoach Made");
	}

	@Override
	public String getDailyWorkout() {
		// TODO Auto-generated method stub
		return "Practice fast Bowling for 15 minutes";
	}

	@Override
	public String getDailyFortune() {
		// TODO Auto-generated method stub
		return fortune.getFortune();
	}

	public FortuneService getFortune() {
		return fortune;
	}

	public void setFortune(FortuneService fortune) {
		System.out.println("Setting fortune");
		this.fortune = fortune;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		System.out.println("Setting Email");
		this.email = email;
	}

	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		System.out.println("Setting team");
		this.team = team;
	}
	
	

}
