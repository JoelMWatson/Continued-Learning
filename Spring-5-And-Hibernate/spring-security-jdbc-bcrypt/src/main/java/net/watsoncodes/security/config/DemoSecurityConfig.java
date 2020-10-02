package net.watsoncodes.security.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class DemoSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private DataSource securityDataSource;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		// use jdbc authentication
		auth.jdbcAuthentication().dataSource(securityDataSource);
	}

	// setting custom form rather than the default
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
				.antMatchers("/").hasRole("EMPLOYEE")
				.antMatchers("/leaders/**").hasRole("MANAGER")
				.antMatchers("/systems/**").hasRole("ADMIN")
				.and().formLogin()
				.loginPage("/showMyLoginPage") // our custom login page
				.loginProcessingUrl("/authenticateTheUser") // page by spring
				.permitAll() // permit all to see login page
				.and().logout()
				.permitAll() // permit all to access logout page
				.and().exceptionHandling()
				.accessDeniedPage("/access-denied"); // our custom access denied page

	}

}
