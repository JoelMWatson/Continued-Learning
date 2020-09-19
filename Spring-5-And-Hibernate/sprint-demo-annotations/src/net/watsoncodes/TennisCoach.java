package net.watsoncodes;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

//@Component("sillySally") // Explicitly gets name "sillySally"
@Component // Implicitly gets name "tennisCoach
@Scope("singleton")
public class TennisCoach implements Coach {

	// Field Injection (uses reflection)
	@Autowired
	@Qualifier("randomFortuneService") // handles the scenario of multiple implementations of the interface
	private FortuneService fortuneService;

//	//Constructor Injection
//	@Autowired
//	public TennisCoach(FortuneService fortuneService) {
//		this.fortuneService = fortuneService;
//	}

	public TennisCoach() {
		System.out.println("In Constructor");
	}

//	// Setter Injection
//	@Autowired
//	public void setFortuneService(FortuneService fortuneService) {
//		this.fortuneService = fortuneService;
//	}

	@Override
	public String getDailyWorkout() {
		return "Practice your backhand foo!";
	}

	@Override
	public String getDailyFortune() {
		//
		return fortuneService.getFortune();
	}

	// Init Method
	@PostConstruct
	public void doStartup() {
		System.out.println("Inside startup");
	}

	// Destroy Method
	@PreDestroy
	public void doCleanup() {
		System.out.println("Inside cleanup");
	}
}
