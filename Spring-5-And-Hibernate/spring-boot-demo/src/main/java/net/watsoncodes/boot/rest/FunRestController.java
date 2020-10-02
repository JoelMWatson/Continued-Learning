package net.watsoncodes.boot.rest;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FunRestController {

	// inject properties for coach.name and team.name
	@Value("${coach.name}")
	private String coach;

	@Value("${team.name}")
	private String team;

	@GetMapping("/teaminfo")
	public String getTeamInfo() {
		return "Coach: " + coach + " Team: " + team;
	}

	@GetMapping("/")
	public String sayHello() {
		return "Hello World! Time on the server us " + LocalDateTime.now();
	}

	@GetMapping("/workout")
	public String getDailyWorkout() {
		return "Walk a hard 5k!";
	}

	@GetMapping("/fortune")
	public String getDailyFortune() {
		return "You're so lucky!";
	}
}
