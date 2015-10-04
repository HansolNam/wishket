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
import com.wjm.dao.AccountInformationDao;
import com.wjm.dao.ApplicantDao;
import com.wjm.dao.ProjectDao;
import com.wjm.models.AccountInfo;
import com.wjm.models.ApplicantInfo;
import com.wjm.models.ContractInfo;
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

	@Autowired
	private ApplicantDao applicantDao;
	
	@Autowired
	private AccountInformationDao accountInformationDao;
	/**
	 * 클라이언트 마이페이지
	 */
	@RequestMapping(value = "/mywjm/client", method = RequestMethod.GET)
	public ModelAndView MywjmController_mywjm_client(HttpServletRequest request, ModelAndView mv) {
		logger.info("mywjm client Page");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		
		List<ProjectInfo> projectlist;
		
		if(account != null)
			projectlist = projectDao.select(account.getPk());
		else
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

		mv.addObject("projectlist",projectlist);
		
		return mv;
	}

	/**
	 * 지원자 마이페이지
	 */
	@RequestMapping(value = "/mywjm/partners", method = RequestMethod.GET)
	public ModelAndView MywjmController_mywjm_partners(HttpServletRequest request,
			ModelAndView mv) {
		logger.info("mywjm partners Page");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		
		if(account == null)
		{
			mv.setViewName("/accounts/login");
			return mv;
		}
		else if(!account.getAccount_type().equals("partners"))
		{
			mv.setViewName("/error/404error");
			return mv;
		}
		
		
		
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

		List<ProjectInfo> interest = applicantDao.getInterestProject(account.getPk());
		List<ApplicantInfo> apply = applicantDao.select_applicant(account.getPk(), "지원중");
		List<ContractInfo> contract = null;

		mv.setViewName("/mywjm/partners");
		mv.addObject("interest",interest);
		mv.addObject("apply",apply);
		mv.addObject("contract",contract);
		
		return mv;
	}
	
}
