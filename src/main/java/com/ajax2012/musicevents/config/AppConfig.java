package com.ajax2012.musicevents.config;

import java.beans.PropertyVetoException;

import javax.sql.DataSource;

import org.jboss.logging.Logger;
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
@ComponentScan(basePackages="com.ajax2012.musicevents")
@PropertySource("classpath:persistence-mysql.properties")
public class AppConfig {

	// hold SQL properties
	@Autowired
	private Environment env;
	
	// logger for diagnostics
	private Logger logger = Logger.getLogger(getClass().getName());
	
	// define bean for view resolver
	@Bean
	public ViewResolver viewResolver() {

		InternalResourceViewResolver viewResover = 
				new InternalResourceViewResolver();

		viewResover.setPrefix("/WEB-INF/view/");
		viewResover.setSuffix(".jsp");

		return viewResover;
	}
	
	// bean for security datasource
	@Bean
	public DataSource dataSource() {
		
		// connection pool
		ComboPooledDataSource dataSource =
				new ComboPooledDataSource();
		
		// jdbc driver class
		try {
			dataSource.setDriverClass(env.getProperty("jdbc.driver"));
		} catch (PropertyVetoException exc) {
			throw new RuntimeException(exc);
		}
		
		// log connection properties
		logger.info(">>> jdbc.url=" + env.getProperty("jdbc.url"));
		logger.info(">>> jdbc.user=" + env.getProperty("jdbc.user"));
		
		// set database connection properties
		dataSource.setJdbcUrl(env.getProperty("jdbc.url"));
		dataSource.setUser(env.getProperty("jdbc.user"));
		dataSource.setPassword(env.getProperty("jdbc.password"));
		
		// set connecton pool properties
		dataSource.setInitialPoolSize(
				getIntProperty("connection.pool.initialPoolSize"));
		dataSource.setMinPoolSize(
				getIntProperty("connection.pool.minPoolSize"));
		dataSource.setMaxPoolSize(
				getIntProperty("connection.pool.maxPoolSize"));
		dataSource.setMaxIdleTime(
				getIntProperty("connection.pool.maxIdleTime"));
		
		return dataSource;
	}
	
	private int getIntProperty(String propertyName) {
		
		String propertyValue = env.getProperty(propertyName);
		int intPropertyValue = Integer.parseInt(propertyValue);
		
		return intPropertyValue;
	}	
}
