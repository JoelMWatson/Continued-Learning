package net.watsoncodes;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
// @ComponentScan("net.watsoncodes") // comment out to only use beans exposed here
@PropertySource("classpath:sports.properties")
public class SportConfig {

	// Define bean for SadFortuneService
	@Bean
	public FortuneService sadFortuneService() {
		return new SadFortuneService();
	}

	// define bean for our swimCoach and Inject dependency
	@Bean
	public Coach swimCoach() {
		return new SwimCoach(sadFortuneService());

	}
}
