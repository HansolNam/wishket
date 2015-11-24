package com.wjm.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wjm.dao.AccountDao;
import com.wjm.dao.ProjectDao;
import com.wjm.main.function.Validator;
import com.wjm.models.AccountInfo;
import com.wjm.models.ProjectInfo;

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
	 * index
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView MainController_index(HttpServletRequest request, ModelAndView mv) {
		logger.info("index Page");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");

		if(account != null) {
			if(account.getAccount_type().equals("client"))
			{
				mv.setViewName("redirect:/mywjm/client");
				return mv;
			}
			else if(account.getAccount_type().equals("partners"))
			{
				mv.setViewName("redirect:/mywjm/partners");
				return mv;
			}
			}
		
		int projectnum = projectDao.countAll();
		int projectbudget = projectDao.getAllBudget();
		int partnersnum = accountDao.getPartnersCount("","");
		
		logger.info("등록된 프로젝트 : "+projectnum);
		logger.info("파트너스 계정 수 : "+partnersnum);
		logger.info("프로젝트 등록 금액 : "+projectbudget);
		
		//최근 프로젝트
		List<ProjectInfo> projectlist = projectDao.selectRecentProject(6);
		
		mv.addObject("projectnum", projectnum);
		mv.addObject("projectbudget", projectbudget);
		mv.addObject("partnersnum" , partnersnum);
		mv.addObject("projectlist", projectlist);
		
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
	public ModelAndView MainController_partners(HttpServletRequest request, ModelAndView mv,
			@RequestParam(value = "page", required = false, defaultValue ="1") String page,
			@RequestParam(value = "q", required = false, defaultValue ="") String q,
			@RequestParam(value = "job", required = false, defaultValue ="") String job
			) {
		logger.info("partners Page");
		
		logger.info("page = "+page);
		logger.info("q = "+q);
		logger.info("job = "+job);
		
		if(!Validator.isDigit(page))
		{
			mv.addObject("messages","페이지 번호는 숫자만 가능합니다.");
			return mv;
		}
		
		Integer partnersnum = accountDao.getPartnersCount(q,job);
		
		logger.info("partners 명수 : "+partnersnum);
		List<AccountInfo> partnerslist = accountDao.selectPartners(page,q,job);
		
		mv.addObject("page",Integer.parseInt(page));
		mv.addObject("partnersnum",partnersnum);
		mv.addObject("partnerslist", partnerslist);

		mv.setViewName("/partners");
		return mv;
	}
	/**
	 * 404error
	 */
	@RequestMapping(value = "/error/400error", method = RequestMethod.GET)
	public String MainController_400error(HttpServletRequest request) {
		logger.info("400 error Page");
		
		return "/error/400error";
	}
	/**
	 * 403error
	 */
	@RequestMapping(value = "/error/403error", method = RequestMethod.GET)
	public String MainController_403error(HttpServletRequest request) {
		logger.info("403 error Page");
		
		return "/error/403error";
	}
	/**
	 * 404error
	 */
	@RequestMapping(value = "/error/404error", method = RequestMethod.GET)
	public String MainController_404error(HttpServletRequest request) {
		logger.info("404 error Page");
		
		return "/error/404error";
	}
	/**
	 * 500error
	 */
	@RequestMapping(value = "/error/500error", method = RequestMethod.GET)
	public String MainController_500error(HttpServletRequest request) {
		logger.info("500 error Page");
		
		return "/error/500error";
	}
	/**
	 * 예외 발생
	 */
	@RequestMapping(value = "/error/error", method = RequestMethod.GET)
	public String MainController_error(HttpServletRequest request) {
		logger.info("Exception Page");
		
		return "/error/error";
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
