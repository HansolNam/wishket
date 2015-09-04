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
	 * �α��� ȭ��
	 */
	@RequestMapping(value = "/accounts/login", method = RequestMethod.GET)
	public String MainController_login(HttpServletRequest request) {
		logger.info("login Page");

		//accountDao.create("�̸���", "���̵�", "�н�����", "Ŭ��");
		
		//List<AccountInfo> test = accountDao.select("���̵�");
		
		//logger.info(test.toString());
		
		return "/accounts/login";
	}
	/**
	 * ȸ������ ȭ��
	 */
	@RequestMapping(value = "/accounts/signup", method = RequestMethod.GET)
	public String MainController_signup(HttpServletRequest request) {
		logger.info("signup Page");
		
		return "/accounts/signup";
	}
}
