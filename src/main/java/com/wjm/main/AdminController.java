package com.wjm.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wjm.dao.AccountDao;
import com.wjm.dao.AccountInformationDao;
import com.wjm.dao.ApplicantDao;
import com.wjm.dao.AuthenticationDao;
import com.wjm.dao.ProjectDao;
import com.wjm.models.AccountInfo;
import com.wjm.models.AccountInformationInfo;
import com.wjm.models.ProjectInfo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(MywjmController.class);
	   
	@Autowired
	private AccountDao accountDao;

	@Autowired
	private ProjectDao projectDao;

	@Autowired
	private ApplicantDao applicantDao;
	
	@Autowired
	private AccountInformationDao accountInformationDao;
	@Autowired
	private AuthenticationDao authenticationDao;
	/**
	 * 관리자 페이지
	 */
	@RequestMapping(value = "/admin/home", method = RequestMethod.GET)
	public ModelAndView AdminController_home(HttpServletRequest request, ModelAndView mv) {
		logger.info("/admin/home Page");
		
		List<ProjectInfo> projectlist = projectDao.selectStatusAdmin("검수중");
		mv.addObject("submitted",projectlist);
		
		List<AccountInfo> authenticationlist = accountInformationDao.selecIdentity_authenticationt("검수중");
		mv.addObject("authenticationlist",authenticationlist);
		
		mv.setViewName("/admin/home");
		return mv;
	}
	/**
	 * 프로젝트 미리보기
	 */
	@RequestMapping(value = "/admin/project/preview/{name}/{pk}", method = RequestMethod.GET)
	public ModelAndView ProjectController_preview_name_pk(HttpServletRequest request,
			@PathVariable("pk") int pk, 
			@PathVariable("name") String name, 
			ModelAndView mv) {
		logger.info("project preview Page");
		
		logger.info("name = "+name);
		logger.info("pk = "+pk);

		ProjectInfo project = projectDao.select(pk, name);
		if(project == null)
			mv.setViewName("/error");
		
		AccountInformationInfo this_accountinfo = accountInformationDao.select(project.getAccount_pk());
		AccountInfo this_account = accountDao.select(project.getPk());
		
		logger.info("description : "+project.getDescription());
			mv.addObject("project",project);
			mv.addObject("this_accountinfo",this_accountinfo);
			mv.addObject("this_account",this_account);
			mv.setViewName("/admin/project/preview");
		
		
		return mv;
	}
	
	/**
	 * 프로젝트 검수 성공
	 */
	@RequestMapping(value = "/admin/project/{name}/{pk}/exam/success", method = RequestMethod.GET)
	public ModelAndView AdminController_exam_success(HttpServletRequest request,
			@PathVariable("pk") int pk, 
			@PathVariable("name") String name, 
			ModelAndView mv) {
		logger.info("/admin/project/{name}/{pk}/exam/success Page");
		
		logger.info("name = "+name);
		logger.info("pk = "+pk);

		ProjectInfo project = projectDao.select(pk, name);
		if(project == null)
			mv.setViewName("/error");
		
		//알림
		
		projectDao.updateStatus(pk,"지원자모집중");
		
		mv.setViewName("redirect:/admin/home");
		
		return mv;
	}
	

	/**
	 * 프로젝트 검수 실패
	 */
	@RequestMapping(value = "/admin/project/{name}/{pk}/exam/fail", method = RequestMethod.GET)
	public ModelAndView AdminController_exam_fail(HttpServletRequest request,
			@PathVariable("pk") int pk, 
			@PathVariable("name") String name, 
			ModelAndView mv) {
		logger.info("/admin/project/{name}/{pk}/exam/fail Page");
		
		logger.info("name = "+name);
		logger.info("pk = "+pk);

		ProjectInfo project = projectDao.select(pk, name);
		if(project == null)
			mv.setViewName("/error");
		
		//알림
		
		projectDao.updateStatus(pk,"등록실패");
		
		mv.setViewName("redirect:/admin/home");
		
		return mv;
	}
	/**
	 * 계정 정보 페이지
	 */
	@RequestMapping(value = "/admin/accounts/profile", method = RequestMethod.GET)
	public ModelAndView AdminController_accounts_profile(HttpServletRequest request, ModelAndView mv) {
		logger.info("/admin/accounts/profile Page");
		
		
		
		mv.setViewName("/admin/accounts/profile");
		return mv;
	}
	
	/**
	 * 신원 정보 페이지
	 */
	@RequestMapping(value = "/admin/accounts/verify_identity/{pk}", method = RequestMethod.GET)
	public ModelAndView AdminController_accounts_verify_identity(HttpServletRequest request
			, ModelAndView mv,
			@PathVariable("pk") int pk ) {
		logger.info("/admin/accounts/verify_identity Page");
		
		AccountInfo account = accountInformationDao.selecIdentity_authenticationt(pk, "검수중");
		
		if(account != null)
		{
			account.setAccountinfo(accountInformationDao.select(account.getPk()));
			account.setAuthenticationinfo(authenticationDao.select(account.getPk()));
			mv.addObject("this_account",account);
			mv.setViewName("/admin/accounts/verify_identity");
		}
		else
			mv.setViewName("redirect:/admin/home");
		return mv;
	}

	/**
	 * 신원 검수 성공
	 */
	@RequestMapping(value = "/admin/verify_identity/success/{pk}", method = RequestMethod.GET)
	public ModelAndView AdminController_verify_identity_success(HttpServletRequest request,
			@PathVariable("pk") int pk,  
			ModelAndView mv) {
		logger.info("/admin/verify_identity/success/{pk} Page");
		//알림
		AccountInfo account = accountInformationDao.selecIdentity_authenticationt(pk, "검수중");
		
		if(account != null)
		{
			logger.info("account 존재! id = "+account.getId());
			accountInformationDao.updateIdentity_authentication(account.getPk(), "인증완료");
		}
		mv.setViewName("redirect:/admin/home");
		return mv;
	}
	

	/**
	 * 신원인증 검수 실패
	 */
	@RequestMapping(value = "/admin/verify_identity/fail/{pk}", method = RequestMethod.GET)
	public ModelAndView AdminController_verify_identity_fail(HttpServletRequest request,
			@PathVariable("pk") int pk, 
			ModelAndView mv) {
		logger.info("/admin/verify_identity/fail/{pk} Page");
		//알림
		AccountInfo account = accountInformationDao.selecIdentity_authenticationt(pk, "검수중");
		
		if(account != null)
		{
			logger.info("account 존재! id = "+account.getId());
			accountInformationDao.updateIdentity_authentication(account.getPk(), "인증실패");
		}
		
		mv.setViewName("redirect:/admin/home");
		return mv;
	}
	/**
	 * 신원 정보 페이지
	 */
	@RequestMapping(value = "/admin/accounts/bank_account", method = RequestMethod.GET)
	public ModelAndView AdminController_accounts_bank_account(HttpServletRequest request, ModelAndView mv) {
		logger.info("/admin/accounts/bank_account Page");
		
		mv.setViewName("/admin/accounts/bank_account");
		return mv;
	}
}
