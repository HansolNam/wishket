package com.wjm.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wjm.dao.AccountDao;
import com.wjm.dao.AccountInformationDao;
import com.wjm.dao.ApplicantDao;
import com.wjm.dao.AssessmentDao;
import com.wjm.dao.ContractDao;
import com.wjm.dao.ProjectDao;
import com.wjm.main.function.Validator;
import com.wjm.models.AccountInfo;
import com.wjm.models.ApplicantInfo;
import com.wjm.models.ContractInfo;
import com.wjm.models.ProjectInfo;

import net.sf.json.JSONObject;

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
	@Autowired
	private ContractDao contractDao;
	@Autowired
	private AssessmentDao assessmentDao;
	
	public boolean AccountCheck(AccountInfo account)
	{
		if(account.getAccount_type() == null)
			return false;
		else if(account.getAccount_type().equals("client"))
			return true;
		else
			return false;
		
	}
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
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
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
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

		List<ContractInfo> reviewlist = contractDao.selectReviewClient(account.getPk(),"완료한프로젝트");
		if(reviewlist!=null) mv.addObject("reviewnum",reviewlist.size());

		List<ContractInfo> completedlist = contractDao.selectCompletedClient(account.getPk(),"완료한프로젝트");
		
		List<ProjectInfo> cancellist = projectDao.selectStatus(account.getPk(),"취소한프로젝트");
		if(cancellist!=null) mv.addObject("cancellednum",cancellist.size());

		
		mv.addObject("completedlist",completedlist);
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
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

		List<ContractInfo> reviewlist = contractDao.selectReviewClient(account.getPk(),"완료한프로젝트");
		List<ContractInfo> completedlist = contractDao.selectCompletedClient(account.getPk(),"완료한프로젝트");
		if(completedlist!=null) mv.addObject("completednum",completedlist.size());
		List<ProjectInfo> cancellist = projectDao.selectStatus(account.getPk(),"취소한프로젝트");
		if(cancellist!=null) mv.addObject("cancellednum",cancellist.size());

		
		mv.addObject("reviewlist",reviewlist);
		
		return mv;
	}
	
	/**
	 * 평가 하기 페이지
	 */
	@RequestMapping(value = "/client/manage/review/{project_pk}/{client_pk}/{partners_pk}", method = RequestMethod.GET)
	public ModelAndView ClientController_review_form(HttpServletRequest request, ModelAndView mv,
			@PathVariable("project_pk") int project_pk,
			@PathVariable("client_pk") int client_pk,
			@PathVariable("partners_pk") int partners_pk) {
		logger.info("평가 하기 페이지");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		
		ContractInfo contract = contractDao.select_project_client_partners(project_pk, client_pk, partners_pk);
		if(contract!= null)
		{
			if(contract.getClient_pk() != account.getPk())
			{
				logger.info("다른 사람이 해당 평가에 접근중");
				mv.setViewName("redirect:/error/404error");
				return mv;
			}
		}
		else
		{
			logger.info("해당 계약이 존재하지 않음");
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		
		mv.addObject("contract",contract);
		
		mv.setViewName("client/manage/review");
		
		return mv;
	}

	/**
	 * 평가 하기 처리 페이지
	 */
	@RequestMapping(value = "/client/manage/review/{project_pk}/{client_pk}/{partners_pk}", method = RequestMethod.POST)
	public ModelAndView ClientController_review_form_post(HttpServletRequest request, ModelAndView mv,
			@PathVariable("project_pk") int project_pk,
			@PathVariable("client_pk") int client_pk,
			@PathVariable("partners_pk") int partners_pk,
			@RequestParam("professionalism") String professionalism,
			@RequestParam("satisfaction") String satisfaction,
			@RequestParam("schedule_observance") String schedule_observance,
			@RequestParam("activeness") String activeness,
			@RequestParam("communication") String communication,
			@RequestParam("recommendation") String recommendation) {
		logger.info("평가 하기 처리 페이지");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		
		ContractInfo contract = contractDao.select_project_client_partners(project_pk, client_pk, partners_pk);
		if(contract!= null)
		{
			if(contract.getClient_pk() != account.getPk())
			{
				logger.info("다른 사람이 해당 평가에 접근중");
				mv.setViewName("redirect:/error/404error");
				return mv;
			}
		}
		else
		{
			logger.info("해당 계약이 존재하지 않음");
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		
		if(!Validator.hasValue(professionalism))
		{
			logger.info("전문선 x");
			mv.addObject("messages","전문성을 선택해주세요.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}
		else if(!Validator.isDigit(professionalism))
		{
			logger.info("전문선 x");
			mv.addObject("messages","전문성은 숫자만 입력 가능합니다.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}

		if(!Validator.hasValue(satisfaction))
		{
			logger.info("만족도 x");
			mv.addObject("messages","만족도를 선택해주세요.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}
		else if(!Validator.isDigit(satisfaction))
		{
			logger.info("만족도 x");
			mv.addObject("messages","만족도는 숫자만 입력 가능합니다.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}

		if(!Validator.hasValue(schedule_observance))
		{
			logger.info("일정준수 x");
			mv.addObject("messages","일정준수를 선택해주세요.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}
		else if(!Validator.isDigit(schedule_observance))
		{
			logger.info("일정준수 x");
			mv.addObject("messages","일정준수는 숫자만 입력 가능합니다.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}

		if(!Validator.hasValue(activeness))
		{
			logger.info("적극성 x");
			mv.addObject("messages","적극성을 선택해주세요.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}
		else if(!Validator.isDigit(activeness))
		{
			logger.info("적극성 x");
			mv.addObject("messages","적극성은 숫자만 입력 가능합니다.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}

		if(!Validator.hasValue(communication))
		{
			logger.info("의사소통 x");
			mv.addObject("messages","의사소통을 선택해주세요.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}
		else if(!Validator.isDigit(communication))
		{
			logger.info("의사소통 x");
			mv.addObject("messages","의사소통은 숫자만 입력 가능합니다.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}
		
		if(!Validator.hasValue(communication))
		{
			logger.info("추천한마디 x");
			mv.addObject("messages","추천한마디를 입력해주세요.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}
		else if(!Validator.isValidLength(recommendation, 1, 250))
		{
			logger.info("추천 한마디가 250자 넘음");
			mv.addObject("messages","추천 한 마디는 250 미만입니다.");
			mv.addObject("contract",contract);
			mv.setViewName("client/manage/review");
			return mv;
		}
		
		logger.info("평가생성");
		assessmentDao.create(project_pk, client_pk, partners_pk
				, Integer.parseInt(professionalism), Integer.parseInt(satisfaction), 
						Integer.parseInt(schedule_observance), Integer.parseInt(activeness), 
								Integer.parseInt(communication), recommendation);
				
		mv.setViewName("redirect:/client/manage/past/completed-contract");
		
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
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
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
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		List<ProjectInfo> projectlist = projectDao.selectStatus(account.getPk(),"임시저장");
		mv.addObject("projectlist",projectlist);
		
		if(projectlist!= null)
		{
			for(int i=0;i<projectlist.size();i++)
				logger.info("project budget : "+projectlist.get(i).getBudget());
		}
		
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
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
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
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
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
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

		
		List<ContractInfo> contractlist = contractDao.selectProgressClient(account.getPk(),"진행중");
		mv.addObject("contractlist",contractlist);
		
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
		if(!AccountCheck(account))
		{
			mv.setViewName("redirect:/error/404error");
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
	

	//미팅 신청
	@RequestMapping(value = "/client/manage/project/meeting", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String ProjectController_getCategoryM(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("applicant_pk") int applicant_pk,
			@RequestParam("project_pk") int project_pk) {
		logger.info("/wjm/client/manage/project/meeting AJAX");

		
		logger.info("applicant_pk = "+applicant_pk);
		logger.info("project_pk = "+project_pk);
		JSONObject jObject = new JSONObject();
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null)
		{
			jObject.put("messages", "error");
			logger.info(jObject.toString());
			return jObject.toString();
		}
		if(!AccountCheck(account))
		{
			jObject.put("messages", "error");
			logger.info(jObject.toString());
			return jObject.toString();
		}
		ProjectInfo project = projectDao.select_project(project_pk);

		//프로젝트 소유자와 현재 계정이 다르다면
		if(project == null)
		{
			jObject.put("messages", "error");
			logger.info(jObject.toString());
			return jObject.toString();
		}
		if(account.getPk() != project.getAccount_pk())
		{
			jObject.put("messages", "error");
			logger.info(jObject.toString());
			return jObject.toString();
		}
		
		//해당 지원자가 존재하지 않음
		ApplicantInfo applicant = applicantDao.select(applicant_pk, project_pk);
		if(applicant == null)
		{
			jObject.put("messages", "error");
			logger.info(jObject.toString());
			return jObject.toString();
		}
		
		//최대 미팅 신청 2번
		List<ContractInfo> contractlist = contractDao.select_project_client(project_pk, account.getPk());
		if(contractlist != null)
			if(contractlist.size() >= 2)
			{
				jObject.put("messages", "미팅 신청은 최대 2번까지 가능합니다.");
				logger.info(jObject.toString());
				return jObject.toString();
			}
		
		AccountInfo applicant_account = accountDao.select(applicant_pk);
		//미팅 신청을 완료했습니다.알림
		
		contractDao.createMeeting(project_pk, account.getPk(), applicant_pk, project.getName()
				, account.getId(), applicant_account.getId(),"계약진행중");
		
		
		jObject.put("messages", "success");
		logger.info(jObject.toString());

		return jObject.toString();
	}
	
}
