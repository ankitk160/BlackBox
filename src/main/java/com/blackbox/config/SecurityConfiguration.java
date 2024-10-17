package com.blackbox.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Bean
	public CustomAuthenticationProvider customAuthenticationProvider() {
		return new CustomAuthenticationProvider();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(customAuthenticationProvider());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
				.antMatchers("/index", "/hardMsisdn", "/addSwitching", "/editSwitching", "/viewLink", "/addLink",
						"/editLink")
				.hasRole("ADMIN").antMatchers("/index-user").hasRole("USER").antMatchers("/index-user2")
				.hasRole("USER2")

				// Explicitly restrict USER2 from accessing ADMIN and USER routes
				.antMatchers("/index", "/index-user", "/viewCampaign", "/editCampaign", "/addCampaign", "/viewOffer",
						"/addOffer", "/editOffer", "/viewAgency", "/offerDetails", "/platformXReport")
				.not().hasRole("USER2") // Deny USER2 access

				// Allow access to static resources and register page without authentication
				.antMatchers("/", "/resources/**", "/register", "/registerUser", "/error500", "/error404").permitAll()

				// Any other page should be authenticated
				.antMatchers("/**").authenticated()

				.and().formLogin().loginPage("/login").defaultSuccessUrl("/login-success").failureUrl("/login-failure")
				.loginProcessingUrl("/loginUser").permitAll()

				.and().logout().logoutUrl("/logout").logoutSuccessUrl("/logoutUser").permitAll()

				.and().exceptionHandling().accessDeniedPage("/access-denied");

		// Session management and CSRF configuration
		http.csrf().disable();
		http.sessionManagement().sessionFixation().migrateSession().invalidSessionUrl("/login")
				.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED).maximumSessions(1).expiredUrl("/login")
				.maxSessionsPreventsLogin(false);
	}
}
