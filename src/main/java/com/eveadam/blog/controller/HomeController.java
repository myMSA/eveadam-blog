package com.eveadam.blog.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "home";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		
		return "login.login";
	}
	
	@RequestMapping(value = "/what", method = RequestMethod.GET)
	public String what(Locale locale, Model model) {
		
		return "what";
	}
	
	@RequestMapping(value = "/p/index.do", method = RequestMethod.GET)
	public String main() {
		
		return "index_std";
	}
}
