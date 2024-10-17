package com.blackbox.config;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class TokenValidatorInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		if (authentication == null || !authentication.isAuthenticated() || authentication.getPrincipal() == null) {
			// Redirect to login if session is not valid
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}

		String username = null, token = null;
		String patternString = "username=([\\w]+), token=([a-fA-F0-9-]+)";
		Pattern pattern = Pattern.compile(patternString);
		Matcher matcher = pattern.matcher(authentication.getName());

		if (matcher.find()) {
			username = matcher.group(1);
			token = matcher.group(2);
		} else {
			System.out.println("Token not found in the input string.");
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}

		String tokenValidateUrl = "token validation url here ?user=" + username;
		RestTemplate restTemplate = new RestTemplate();
		String matchToken = restTemplate.getForObject(tokenValidateUrl, String.class);

		if (matchToken.equals(token)) {
			return true;
		} else {
			System.out.println("Token validation failed");
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
	}
}
