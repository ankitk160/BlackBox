package com.blackbox.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalExceptionHandler {

	@ExceptionHandler(NoHandlerFoundException.class)
	public String handleNotFoundError() {
		return "error404";
	}

	@ExceptionHandler(Exception.class)
	public String handleGeneralError() {
		return "error500";
	}
}
