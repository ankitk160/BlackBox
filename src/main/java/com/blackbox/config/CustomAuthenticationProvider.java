package com.blackbox.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.client.ResourceAccessException;
import org.springframework.web.client.RestTemplate;

import com.blackbox.model.CustomAuthenticationToken;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = authentication.getName();
		String password = authentication.getCredentials().toString();
		String apiUrl = "login check url here ?user=" + username + "&pass=" + password+"&ws=bb";
		RestTemplate restTemplate = new RestTemplate();
		try {
			String response = restTemplate.getForObject(apiUrl, String.class);
			String tokenValue = extractTokenFromResponse(response);
			String userType = extractUserTypeFromResponse(response);
			if (!tokenValue.isEmpty()) {
				CustomAuthenticationToken authenticationToken = new CustomAuthenticationToken();
				authenticationToken.setUsername(username);
				authenticationToken.setToken(tokenValue);

				List<GrantedAuthority> authorities = new ArrayList<>();
				if ("1".equals(userType)) {
					authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
				} else if ("2".equals(userType)) {
					authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
				} else if ("3".equals(userType)) {
					authorities.add(new SimpleGrantedAuthority("ROLE_USER2"));
				}

				SecurityContextHolder.getContext().setAuthentication(
						new UsernamePasswordAuthenticationToken(authenticationToken, null, authorities));
				return SecurityContextHolder.getContext().getAuthentication();
			} else {
				throw new BadCredentialsException("Authentication failed");
			}
		} catch (ResourceAccessException e) {
			throw new AuthenticationServiceException("Connection timeout occurred while authenticating", e);
		}
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

	public String extractTokenFromResponse(String responseBody) {
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			JsonNode jsonNode = objectMapper.readTree(responseBody);
			return jsonNode.get("token").asText();
		} catch (JsonProcessingException e) {
			throw new BadCredentialsException("Failed to extract token from API response");
		}
	}

	public String extractUserTypeFromResponse(String responseBody) {
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			JsonNode jsonNode = objectMapper.readTree(responseBody);
			return jsonNode.get("user_type").asText();
		} catch (JsonProcessingException e) {
			throw new BadCredentialsException("Failed to extract user_type from API response");
		}
	}
}
