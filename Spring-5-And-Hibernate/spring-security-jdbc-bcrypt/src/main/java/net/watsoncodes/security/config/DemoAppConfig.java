package net.watsoncodes.security.config;

import java.beans.PropertyVetoException;
import java.util.logging.Logger;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "net.watsoncodes.security")
@PropertySource("classpath:persistence-mysql.properties")
public class DemoAppConfig {

	@Autowired
	private Environment env;

	private Logger logger = Logger.getLogger(getClass().getName());

	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();

		viewResolver.setPrefix("WEB-INF/view/");
		viewResolver.setSuffix(".jsp");

		return viewResolver;
	}

	@Bean
	public DataSource securityDataSource() {

		// connection pool
		ComboPooledDataSource securityDataSource = new ComboPooledDataSource();

		// set jdbc driver
		try {
			securityDataSource.setDriverClass(env.getProperty("jdbc.driver"));
		} catch (PropertyVetoException e) {
			throw new RuntimeException(e);
		}

		// log connection props
		logger.info(">>>JDBC URL: " + env.getProperty("jdbc.url"));
		logger.info(">>>JDBC USER: " + env.getProperty("jdbc.user"));

		// set database connection props
		securityDataSource.setJdbcUrl(env.getProperty("jdbc.url"));
		securityDataSource.setUser(env.getProperty("jdbc.user"));
		securityDataSource.setPassword(env.getProperty("jdbc.password"));

		// set connection pool props
		securityDataSource.setInitialPoolSize(getIntProperty("connection.pool.initialPoolSize"));
		securityDataSource.setMinPoolSize(getIntProperty("connection.pool.minPoolSize"));
		securityDataSource.setMaxPoolSize(getIntProperty("connection.pool.maxPoolSize"));
		securityDataSource.setMaxIdleTime(getIntProperty("connection.pool.maxIdleTime"));

		return securityDataSource;
	}

	// helper function to get int properties
	private int getIntProperty(String property) {
		String strVal = env.getProperty(property);
		int intVal = Integer.parseInt(strVal);
		return intVal;
	}
}
