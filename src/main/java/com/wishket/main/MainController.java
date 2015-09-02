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
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	   
	@Autowired
	private ActivityDao activityDao;
	/**
	 * Ȩȭ��
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String MainController_index(HttpServletRequest request) {
		logger.info("index Page");
		
		return "index";
	}

	/**
	 * ������Ʈ ȭ��
	 */
	@RequestMapping(value = "/project", method = RequestMethod.GET)
	public String MainController_project(HttpServletRequest request) {
		logger.info("project Page");
		
		return "project";
	}
	
	/**
	 * ��Ʈ�ʽ� ȭ��
	 */
	@RequestMapping(value = "/partners", method = RequestMethod.GET)
	public String MainController_partners(HttpServletRequest request) {
		logger.info("partners Page");
		
		return "partners";
	}

	/**
	 * ���� �Ұ� ȭ��
	 */
	@RequestMapping(value = "/service-intro", method = RequestMethod.GET)
	public String MainController_serviceintro(HttpServletRequest request) {
		logger.info("service-intro Page");
		
		return "service-intro";
	}

	/**
	 * Ŭ���̾�Ʈ �̿��� ȭ��
	 */
	@RequestMapping(value = "/client-use", method = RequestMethod.GET)
	public String MainController_clientuse(HttpServletRequest request) {
		logger.info("client-use Page");
		
		return "client-use";
	}

	/**
	 * ��Ʈ�ʽ� �̿��� ȭ��
	 */
	@RequestMapping(value = "/partners-use", method = RequestMethod.GET)
	public String MainController_partnersuse(HttpServletRequest request) {
		logger.info("partners-use Page");
		
		return "partners-use";
	}

	/**
	 * �̿��� ȭ��
	 */
	@RequestMapping(value = "/service-fee", method = RequestMethod.GET)
	public String MainController_servicefee(HttpServletRequest request) {
		logger.info("service-fee Page");
		
		return "service-fee";
	}

	/**
	 * ���� ���� ���� ȭ��
	 */
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String MainController_faq(HttpServletRequest request) {
		logger.info("faq Page");
		
		return "faq";
	}
	/**
	 * �α��� ȭ��
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String MainController_login(HttpServletRequest request) {
		logger.info("login Page");
		
		return "login";
	}
	/**
	 * ȸ������ ȭ��
	 */
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String MainController_signup(HttpServletRequest request) {
		logger.info("signup Page");
		
		return "signup";
	}
}
