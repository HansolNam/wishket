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
	 * 홈화면
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String MainController_index(HttpServletRequest request) {
		logger.info("index Page");
		
		return "index";
	}

	/**
	 * 프로젝트 화면
	 */
	@RequestMapping(value = "/project", method = RequestMethod.GET)
	public String MainController_project(HttpServletRequest request) {
		logger.info("project Page");
		
		return "project";
	}
	
	/**
	 * 파트너스 화면
	 */
	@RequestMapping(value = "/partners", method = RequestMethod.GET)
	public String MainController_partners(HttpServletRequest request) {
		logger.info("partners Page");
		
		return "partners";
	}

	/**
	 * 서비스 소개 화면
	 */
	@RequestMapping(value = "/service-intro", method = RequestMethod.GET)
	public String MainController_serviceintro(HttpServletRequest request) {
		logger.info("service-intro Page");
		
		return "service-intro";
	}

	/**
	 * 클라이언트 이용방법 화면
	 */
	@RequestMapping(value = "/client-use", method = RequestMethod.GET)
	public String MainController_clientuse(HttpServletRequest request) {
		logger.info("client-use Page");
		
		return "client-use";
	}

	/**
	 * 파트너스 이용방법 화면
	 */
	@RequestMapping(value = "/partners-use", method = RequestMethod.GET)
	public String MainController_partnersuse(HttpServletRequest request) {
		logger.info("partners-use Page");
		
		return "partners-use";
	}

	/**
	 * 이용요금 화면
	 */
	@RequestMapping(value = "/service-fee", method = RequestMethod.GET)
	public String MainController_servicefee(HttpServletRequest request) {
		logger.info("service-fee Page");
		
		return "service-fee";
	}

	/**
	 * 자주 묻는 질문 화면
	 */
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String MainController_faq(HttpServletRequest request) {
		logger.info("faq Page");
		
		return "faq";
	}
	/**
	 * 로그인 화면
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String MainController_login(HttpServletRequest request) {
		logger.info("login Page");
		
		return "login";
	}
	/**
	 * 회원가입 화면
	 */
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String MainController_signup(HttpServletRequest request) {
		logger.info("signup Page");
		
		return "signup";
	}
}
