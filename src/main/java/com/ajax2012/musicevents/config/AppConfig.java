package com.ajax2012.musicevents.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.ui.context.ThemeSource;
import org.springframework.ui.context.support.ResourceBundleThemeSource;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.ajax2012.musicevents")
public class AppConfig {

	// define bean for view resolver
	@Bean
	public ViewResolver viewResolver() {

		InternalResourceViewResolver viewResover = 
				new InternalResourceViewResolver();

		viewResover.setPrefix("/WEB-INF/view/");
		viewResover.setSuffix(".jsp");

		return viewResover;
	}
	
	@Bean
	public ThemeSource themeSource() {
		
		ResourceBundleThemeSource source = new ResourceBundleThemeSource();
		source.setBasenamePrefix("bootstrap-");
		return source;
	}
}
