package com.blackbox.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.concurrent.ConcurrentMapCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan(basePackages = "com.blackbox")
@EnableWebMvc
@EnableCaching
@EnableScheduling
public class MvcConfiguration implements WebMvcConfigurer {

	@Autowired
	private TokenValidatorInterceptor tokenValidatorInterceptor;

	@Bean
	public ViewResolver getViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(tokenValidatorInterceptor).addPathPatterns("/**").excludePathPatterns("/", "/login",
				"/resources/**", "/login-failure", "/register", "/registerUser");
	}

	@Bean
	public ConcurrentMapCacheManager cacheManager() {
		return new ConcurrentMapCacheManager("apiCache");
	}

	@Scheduled(fixedDelay = 600000)
	public void evictCache() {
		String cacheName = "apiCache";
		cacheManager().getCache(cacheName).clear();
	}
}
