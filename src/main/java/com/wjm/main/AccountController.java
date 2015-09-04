package com.wjm.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wjm.dao.AccountDao;
import com.wjm.models.AccountInfo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AccountController {
	
	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	   
	@Autowired
	private AccountDao accountDao;

	/**
	 * 로그인 화면
	 */
	@RequestMapping(value = "/accounts/login", method = RequestMethod.GET)
	public String MainController_login(HttpServletRequest request) {
		logger.info("login Page");

		//accountDao.create("이메일", "아이디", "패스워드", "클라");
		
		//List<AccountInfo> test = accountDao.select("아이디");
		
		//logger.info(test.toString());
		
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
