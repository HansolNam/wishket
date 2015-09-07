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
public class MywjmController {
	
	private static final Logger logger = LoggerFactory.getLogger(MywjmController.class);
	   
	@Autowired
	private AccountDao accountDao;
	
	/**
	 * 홈화면
	 */
	@RequestMapping(value = "/mywjm/client", method = RequestMethod.GET)
	public String MywjmController_mywjm_client(HttpServletRequest request) {
		logger.info("mywjm client Page");
		
		return "/mywjm/client";
	}

	/**
	 * 프로젝트 화면
	 */
	@RequestMapping(value = "/mywjm/partners", method = RequestMethod.GET)
	public String MywjmController_mywjm_partners(HttpServletRequest request) {
		logger.info("mywjm partners Page");
		
		return "/mywjm/partners";
	}
	
}
