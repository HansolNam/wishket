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
import com.wjm.dao.ProjectDao;
import com.wjm.main.function.Validator;
import com.wjm.models.AccountInfo;
import com.wjm.models.ApplicantInfo;
import com.wjm.models.ProjectInfo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ClientController {
	
	private static final Logger logger = LoggerFactory.getLogger(ClientController.class);

	private static final boolean Available = false;
	   
	@Autowired
	private ProjectDao projectDao;
	@Autowired
	private AccountDao accountDao;
	@Autowired
	private AccountInformationDao accountInformationDao;
	@Autowired
	private ApplicantDao applicantDao;
	/**
	 * 취소한 프로젝트
	 */
	@RequestMapping(value = "/client/manage/past/cancelled-project", method = RequestMethod.GET)
	public ModelAndView ClientController_cancelled(HttpServletRequest request, ModelAndView mv) {
		logger.info("취소한 프로젝트 페이지");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));


		List<ProjectInfo> projectlist = projectDao.selectStatus(account.getPk(),"평가대기중");
		if(projectlist!=null) mv.addObject("reviewnum",projectlist.size());

		List<ProjectInfo> projectlist2 = projectDao.selectStatus(account.getPk(),"완료한프로젝트");
		if(projectlist2!=null) mv.addObject("completednum",projectlist2.size());		

		List<ProjectInfo> projectlist3 = projectDao.selectStatus(account.getPk(),"취소한프로젝트");
		
		mv.addObject("projectlist",projectlist3);

		return mv;
	}
	/**
	 * 완료한 프로젝트
	 */
	@RequestMapping(value = "/client/manage/past/completed-contract", method = RequestMethod.GET)
	public ModelAndView ClientController_completed(HttpServletRequest request, ModelAndView mv) {
		logger.info("완료한 프로젝트 페이지");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

		List<ProjectInfo> projectlist = projectDao.selectStatus(account.getPk(),"평가대기중");
		if(projectlist!=null) mv.addObject("reviewnum",projectlist.size());

		List<ProjectInfo> projectlist2 = projectDao.selectStatus(account.getPk(),"완료한프로젝트");
		List<ProjectInfo> projectlist3 = projectDao.selectStatus(account.getPk(),"취소한프로젝트");
		if(projectlist3!=null) mv.addObject("cancellednum",projectlist3.size());

		mv.addObject("projectlist",projectlist2);
		
		return mv;
	}
	/**
	 * 평가 대기중
	 */
	@RequestMapping(value = "/client/manage/past/review-contract", method = RequestMethod.GET)
	public ModelAndView ClientController_review(HttpServletRequest request, ModelAndView mv) {
		logger.info("평가 대기중 페이지");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

		List<ProjectInfo> projectlist = projectDao.selectStatus(account.getPk(),"평가대기중");
		List<ProjectInfo> projectlist2 = projectDao.selectStatus(account.getPk(),"완료한프로젝트");
		if(projectlist2!=null) mv.addObject("completednum",projectlist2.size());
		List<ProjectInfo> projectlist3 = projectDao.selectStatus(account.getPk(),"취소한프로젝트");
		if(projectlist3!=null) mv.addObject("cancellednum",projectlist3.size());

		
		mv.addObject("projectlist",projectlist);
		
		return mv;
	}
	/**
	 * 검수중
	 */
	@RequestMapping(value = "/client/manage/project/submitted", method = RequestMethod.GET)
	public ModelAndView ClientController_submitted(HttpServletRequest request, ModelAndView mv) {
		logger.info("검수중 페이지");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		
		if(account == null) {
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		
		List<ProjectInfo> projectlist = projectDao.selectStatus(account.getPk(),"검수중");
		mv.addObject("projectlist",projectlist);
		
		return mv;
	}
	/**
	 * 임시 저장
	 */
	@RequestMapping(value = "/client/manage/project/saved", method = RequestMethod.GET)
	public ModelAndView ClientController_saved(HttpServletRequest request, ModelAndView mv) {
		logger.info("임시 저장 페이지");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");

		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		List<ProjectInfo> projectlist = projectDao.selectStatus(account.getPk(),"임시저장");
		mv.addObject("projectlist",projectlist);
				
		return mv;
	}
	/**
	 * 등록 실패
	 */
	@RequestMapping(value = "/client/manage/project/rejected", method = RequestMethod.GET)
	public ModelAndView ClientController_rejected(HttpServletRequest request, ModelAndView mv) {
		logger.info("등록 실패 페이지");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");

		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		List<ProjectInfo> projectlist = projectDao.selectStatus(account.getPk(),"등록실패");
		mv.addObject("projectlist",projectlist);
		
		return mv;
	}
	/**
	 * 지원자 모집 중
	 */
	@RequestMapping(value = "/client/manage/recruiting", method = RequestMethod.GET)
	public ModelAndView ClientController_recruiting(HttpServletRequest request, ModelAndView mv) {
		logger.info("지원자 모집 중 페이지");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		
		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		
		List<ProjectInfo> projectlist = projectDao.selectStatus(account.getPk(),"지원자모집중");
		mv.addObject("projectlist",projectlist);
		
		return mv;
	}
	/**
	 * 진행 중인 프로젝트
	 */
	@RequestMapping(value = "/client/manage/contract-in-progress", method = RequestMethod.GET)
	public ModelAndView ClientController_progress(HttpServletRequest request, ModelAndView mv) {
		logger.info("진행 중인 프로젝트 페이지");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");

		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		List<ProjectInfo> projectlist = projectDao.selectStatus(account.getPk(),"진행중");
		mv.addObject("projectlist",projectlist);
		
		return mv;
	}
	

	/**
	 * 프로젝트 지원자 목록
	 */

	@RequestMapping(value = "/client/manage/project/{name}/{pk}/applicant", method = RequestMethod.GET)
	public ModelAndView ProjectController_project_proposalapply(HttpServletRequest request, 
			@PathVariable("pk") int pk, 
			@PathVariable("name") String name, ModelAndView mv) {
		logger.info("project proposal apply get Page");
		
		if(!Validator.hasValue(name))
		{
			mv.setViewName("/project");
			return mv;
		}
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null)
		{
			mv.setViewName("/accounts/login");
			return mv;
		}
				
		ProjectInfo project = projectDao.select_project(pk);
		if(project!=null)
		{
			//지원자 보려는 사람이 프로젝트 소유자인지 확인
			if(account.getPk() != project.getAccount_pk())
			{
				mv.setViewName("/mywjm/client");
				return mv;
			}
			mv.addObject("project",project);
		}
		else
		{
			mv.setViewName("/mywjm/client");
			return mv;
		}
		
		List<ApplicantInfo> applicant = applicantDao.select_project(pk);
		
		if(applicant != null && applicant.isEmpty())
			applicant = null;
		mv.addObject("applicant", applicant);
		
		mv.setViewName("/client/manage/project/applicant");
		
		return mv;
	}
}
