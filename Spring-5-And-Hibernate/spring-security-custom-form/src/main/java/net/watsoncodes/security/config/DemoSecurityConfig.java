package net.watsoncodes.security.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;

@Configuration
@EnableWebSecurity
public class DemoSecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		// add users for in mem auth
		UserBuilder users = User.withDefaultPasswordEncoder(); // deprication ok because we are only doing a demo in
																// memory

		auth.inMemoryAuthentication().withUser(users.username("John").password("test123").roles("EMPLOYEE"))
				.withUser(users.username("Jeff").password("test123").roles("MANAGER"))
				.withUser(users.username("Jill").password("test123").roles("ADMIN"));
	}

	// setting custom form rather than the default
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().anyRequest().authenticated().and().formLogin().loginPage("/showMyLoginPage") // our-page
				.loginProcessingUrl("/authenticateTheUser") // page by spring
				.permitAll() // permit all to see login page
				.and().logout().permitAll();
	}

}
