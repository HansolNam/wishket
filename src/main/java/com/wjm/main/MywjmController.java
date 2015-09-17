package com.wjm.main;

import java.util.List;

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
import com.wjm.models.AccountInfo;
import com.wjm.models.ProjectInfo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MywjmController {
	
	private static final Logger logger = LoggerFactory.getLogger(MywjmController.class);
	   
	@Autowired
	private AccountDao accountDao;

	@Autowired
	private ProjectDao projectDao;
	/**
	 * Ȩȭ��
	 */
	@RequestMapping(value = "/mywjm/client", method = RequestMethod.GET)
	public ModelAndView MywjmController_mywjm_client(HttpServletRequest request, ModelAndView mv) {
		logger.info("mywjm client Page");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		
		List<ProjectInfo> projectlist;
		
		if(account != null)
			projectlist = projectDao.select(account.getPk());
		else
			projectlist = null;
		
		mv.addObject("projectlist",projectlist);
		
		return mv;
	}

	/**
	 * ������Ʈ ȭ��
	 */
	@RequestMapping(value = "/mywjm/partners", method = RequestMethod.GET)
	public String MywjmController_mywjm_partners(HttpServletRequest request) {
		logger.info("mywjm partners Page");
		
		return "/mywjm/partners";
	}
	
}
