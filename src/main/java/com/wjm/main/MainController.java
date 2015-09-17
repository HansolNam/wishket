package com.wjm.main;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wjm.dao.AccountDao;
import com.wjm.dao.ProjectDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	   
	@Autowired
	private AccountDao accountDao;

	@Autowired
	private ProjectDao projectDao;
	
	/**
	 * Ȩȭ��
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView MainController_index(HttpServletRequest request, ModelAndView mv) {
		logger.info("index Page");
		
		//int projectnum = projectDao.countAll();
		//long projectbudget = projectDao.countAllBudget();
		//int accountnum = accountDao.countAll()
		
		return mv;
	}
	
	/**
	 * footer ȭ��
	 */
	@RequestMapping(value = "/footer", method = RequestMethod.GET)
	public String MainController_footer(HttpServletRequest request) {
		logger.info("footer Page");
		
		return "footer";
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
	 * �̿���
	 */
	@RequestMapping(value = "/terms-of-service", method = RequestMethod.GET)
	public String MainController_termsofservice(HttpServletRequest request) {
		logger.info("terms-of-service Page");
		
		return "terms-of-service";
	}
	/**
	 * ����������ȣ
	 */
	@RequestMapping(value = "/privacy", method = RequestMethod.GET)
	public String MainController_privacy(HttpServletRequest request) {
		logger.info("privacy Page");
		
		return "privacy";
	}

	/**
	 * test
	 */
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String MainController_test(HttpServletRequest request) {
		logger.info("test Page");
		
		return "test";
	}
}
