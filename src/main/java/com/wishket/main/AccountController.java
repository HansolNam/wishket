package com.wishket.main;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wishket.dao.ActivityDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AccountController {
	
	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	   
	@Autowired
	private ActivityDao activityDao;

	/**
	 * 로그인 화면
	 */
	@RequestMapping(value = "/accounts/login", method = RequestMethod.GET)
	public String MainController_login(HttpServletRequest request) {
		logger.info("login Page");
		
		return "/accounts/login";
	}
	/**
	 * 회원가입 화면
	 */
	@RequestMapping(value = "/accounts/signup", method = RequestMethod.GET)
	public String MainController_signup(HttpServletRequest request) {
		logger.info("signup Page");
		
		return "/accounts/signup";
	}
}
