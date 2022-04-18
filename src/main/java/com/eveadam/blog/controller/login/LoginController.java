package com.eveadam.blog.controller.login;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.authentication.AuthenticationManager;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.eveadam.blog.dto.UserDTO;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller
public class LoginController {
	
	//private final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	/*
	@Autowired
    private ReviewService reviewService;
	@Autowired
    private UserService userService;
	*/
	@RequestMapping(value = "/kakaoLogin", method= RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> kakaoLogin(UserDTO user) {
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
    	HttpServletRequest request = attr.getRequest();
    	HttpServletResponse response = attr.getResponse();
    	
		log.info("TEST");
		log.info(user.getId());
		log.info(user.getEmail());
		log.info(user.getNickname());
		
		
//		try {
//			userService.updateUserJoin(user);			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		HttpSession session= request.getSession(false);
		session.setAttribute("user", user);
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("loginSuccess", "True");
		
		return map;
	}
	
	@RequestMapping(value = "/sessionInval", method = RequestMethod.GET)
	public String home3(Locale locale, Model model) {
		
		return "sessionInval";
	}

   
}
