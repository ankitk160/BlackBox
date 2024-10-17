package com.blackbox.controller;

import java.util.Collection;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.blackbox.model.CustomAuthenticationToken;
import com.blackbox.service.ApiService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class LoginController {
	@Autowired
	private ApiService apiService;

	@RequestMapping(value = "/login")
	public ModelAndView login() {
		return new ModelAndView("login");
	}

	@RequestMapping(value = "/login-success")
	public ModelAndView loginSuccess() {
		ModelAndView index = new ModelAndView("index");
		String indexData = apiService.getIndexPageData();
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> indexDataMap = null;
		try {
			indexDataMap = objectMapper.readValue(indexData, new TypeReference<Map<String, Object>>() {
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		CustomAuthenticationToken token = (CustomAuthenticationToken) authentication.getPrincipal();
		String username = token.getUsername();

		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		boolean isAdmin = authorities.stream().anyMatch(authority -> authority.getAuthority().equals("ROLE_ADMIN"));
		boolean isUser2 = authorities.stream().anyMatch(authority -> authority.getAuthority().equals("ROLE_USER2"));
		index.addObject("username", username);
		index.addObject("indexData", indexDataMap);

		if (isAdmin) {
			return index;
		} else if (isUser2) {
			ModelAndView indexUser = new ModelAndView("index-user2");
			indexUser.addObject("username", username);
			return indexUser;
		} else {
			ModelAndView indexUser = new ModelAndView("index-user");
			indexUser.addObject("username", username);
			return indexUser;
		}
	}

	@RequestMapping(value = "/login-failure")
	public String loginFailure(Model model) {
		model.addAttribute("alertMessage", "Entered username or password is wrong.");
		return "login";
	}
}
