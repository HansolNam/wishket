package com.wjm.main;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URISyntaxException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileUploadException;
import org.apache.http.client.ClientProtocolException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.wjm.dao.AccountDao;
import com.wjm.dao.AccountInformationDao;
import com.wjm.dao.AdditionDao;
import com.wjm.dao.ApplicantDao;
import com.wjm.dao.AuthenticationDao;
import com.wjm.dao.CancellistDao;
import com.wjm.dao.ContractDao;
import com.wjm.dao.NoticeDao;
import com.wjm.dao.NotificationDao;
import com.wjm.dao.ProjectDao;
import com.wjm.main.function.Fileupload;
import com.wjm.main.function.SMS;
import com.wjm.main.function.Time;
import com.wjm.main.function.Validator;
import com.wjm.models.AccountInfo;
import com.wjm.models.AccountInformationInfo;
import com.wjm.models.AdditionInfo;
import com.wjm.models.ApplicantInfo;
import com.wjm.models.CancellistInfo;
import com.wjm.models.ContractInfo;
import com.wjm.models.NoticeInfo;
import com.wjm.models.ProjectInfo;

import net.sf.json.JSONObject;

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
	private CancellistDao cancellistDao;
	@Autowired
	private ApplicantDao applicantDao;
	
	@Autowired
	private AccountInformationDao accountInformationDao;
	@Autowired
	private AuthenticationDao authenticationDao;
	@Autowired
	private ContractDao contractDao;
	@Autowired
	private NoticeDao noticeDao;
	@Autowired
	private NotificationDao notificationDao;
	@Autowired
	private AdditionDao additionDao;

	@Autowired
	private JavaMailSender mailSender;
	//메일 전송
	public String sendMail(String from, String to, String content, String subject) {
		
		logger.info("from = "+from);
		logger.info("to = "+to);
		logger.info("content = "+content);
		logger.info("subject = "+subject);
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setTo(to);
			messageHelper.setText(content, true);
			messageHelper.setFrom(from);
			messageHelper.setSubject(subject);	// 메일제목은 생략이 가능하다
			
			mailSender.send(message);
		} catch(Exception e){
			System.out.println(e);
			return "실패";
		}
		
		return "성공";
	}
	/**
	 * 관리자 페이지
	 */
	@RequestMapping(value = "/admin/home", method = RequestMethod.GET)
	public ModelAndView AdminController_home(HttpServletRequest request, ModelAndView mv) {
		logger.info("/admin/home Page");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		List<ProjectInfo> projectlist = projectDao.selectStatusAdminLimit("검수중", 5);
		mv.addObject("submitted",projectlist);
		
		List<AccountInfo> authenticationlist = accountInformationDao.selecIdentity_authenticationtLimit("검수중",5);
		mv.addObject("authenticationlist",authenticationlist);
		
		List<ContractInfo> contractlist = contractDao.selectStatusAdminLimit("계약진행중", 5);
		mv.addObject("contractlist",contractlist);

		List<ContractInfo> progresslist = contractDao.selectProgressProjectAdminLimit(5);
		mv.addObject("progresslist",progresslist);
		
		List<ContractInfo> waitlist = contractDao.selectReadyProjectAdminLimit(5);
		mv.addObject("waitlist",waitlist);
		
		List<NoticeInfo> noticelist = noticeDao.select_limit_admin(3);
		mv.addObject("noticelist",noticelist);

		mv.setViewName("/admin/home");
		return mv;
	}
	
	////////////////////////////////////////프로젝트 검수//////////////////////////////////////////
	/**
	 * 관리자 검수중 페이지
	 */
	@RequestMapping(value = "/admin/submitted", method = RequestMethod.GET)
	public ModelAndView AdminController_submitted(HttpServletRequest request, ModelAndView mv) {
		logger.info("/admin/submitted Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		List<ProjectInfo> projectlist = projectDao.selectStatusAdmin("검수중");
		mv.addObject("submitted",projectlist);

		mv.setViewName("/admin/submitted");
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

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		logger.info("name = "+name);
		logger.info("pk = "+pk);

		ProjectInfo project = projectDao.select(pk, name);
		if(project == null)
			mv.setViewName("/error/404error");
		
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
	 * @throws IOException 
	 * @throws URISyntaxException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(value = "/admin/project/{name}/{pk}/exam/success", method = RequestMethod.GET)
	public ModelAndView AdminController_exam_success(HttpServletRequest request,
			@PathVariable("pk") int pk, 
			@PathVariable("name") String name, 
			ModelAndView mv) throws ClientProtocolException, URISyntaxException, IOException {
		logger.info("/admin/project/{name}/{pk}/exam/success Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		logger.info("name = "+name);
		logger.info("pk = "+pk);

		ProjectInfo project = projectDao.select(pk, name);
		if(project == null)
			mv.setViewName("/error/404error");
		
		//notification update
		notificationDao.create(project.getAccount_pk(), project.getName()+" 프로젝트가 검수가 완료되어 지원자 모집중입니다.");
		
		 AccountInformationInfo accountinfo = accountInformationDao.select(project.getAccount_pk());
	        String result = "";
	        
	        if(accountinfo.getSubscription() == 1)
	        {
	        	AccountInfo client_account = accountDao.select(project.getAccount_pk());
	        	result = sendMail("admin@wjm.com", client_account.getEmail(), project.getName()+" 프로젝트가 검수가 완료되어 지원자 모집중입니다.", "외주몬 알림 메일입니다");
	        	logger.info("이메일 전송 결과 = "+result);
	        }
	        if(accountinfo.getSms_subscription() == 1)
	        {
	        	String phone = "";
	        	
	        	if(Validator.hasValue(accountinfo.getCellphone_num()))
	        		phone = accountinfo.getCellphone_num().replace("-", "");
	        	
	        	if(Validator.hasValue(phone))
	        	{
	        		SMS.sendSMS(phone, phone,project.getName()+" 프로젝트가 검수가 완료되어 지원자 모집중입니다.", "");
		    		logger.info("SMS 전송");
	        	}
	        }
		
		projectDao.updateStatus(pk,"지원자모집중");
		
		mv.setViewName("redirect:/admin/home");
		
		return mv;
	}
	

	/**
	 * 프로젝트 검수 실패
	 * @throws IOException 
	 * @throws URISyntaxException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(value = "/admin/project/{name}/{pk}/exam/fail", method = RequestMethod.GET)
	public ModelAndView AdminController_exam_fail(HttpServletRequest request,
			@PathVariable("pk") int pk, 
			@PathVariable("name") String name, 
			ModelAndView mv) throws ClientProtocolException, URISyntaxException, IOException {
		logger.info("/admin/project/{name}/{pk}/exam/fail Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		logger.info("name = "+name);
		logger.info("pk = "+pk);

		ProjectInfo project = projectDao.select(pk, name);
		if(project == null)
			mv.setViewName("/error/404error");
		
		//notification update
		notificationDao.create(project.getAccount_pk(), project.getName()+" 프로젝트가 검수에 실패하였습니다. 관리자에게 문의해주세요.");
		
		 AccountInformationInfo accountinfo = accountInformationDao.select(project.getAccount_pk());
	        String result = "";
	        
	        if(accountinfo.getSubscription() == 1)
	        {
	        	AccountInfo cleintaccount = accountDao.select(project.getAccount_pk());
	        	result = sendMail("admin@wjm.com", cleintaccount.getEmail(), project.getName()+" 프로젝트가 검수에 실패하였습니다. 관리자에게 문의해주세요.", "외주몬 알림 메일입니다");
	        	logger.info("이메일 전송 결과 = "+result);
	        }
	        if(accountinfo.getSms_subscription() == 1)
	        {
	        	String phone = "";
	        	
	        	if(Validator.hasValue(accountinfo.getCellphone_num()))
	        		phone = accountinfo.getCellphone_num().replace("-", "");
	        	
	        	if(Validator.hasValue(phone))
	        	{
	        		SMS.sendSMS(phone, phone, project.getName()+" 프로젝트가 검수에 실패하였습니다. 관리자에게 문의해주세요.", "");
		    		logger.info("SMS 전송");
	        	}
	        }
		
		projectDao.updateStatus(pk,"등록실패");
		
		mv.setViewName("redirect:/admin/home");
		
		return mv;
	}
	/**
	 * 프로젝트 수정 페이지
	 */
	@RequestMapping(value = "/admin/project/edit/{project_pk}", method = RequestMethod.GET)
	public ModelAndView AdminController_edit(HttpServletRequest request, ModelAndView mv,
			@PathVariable("project_pk") int project_pk) {
		logger.info("/admin/project/edit/{project_pk} Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		ProjectInfo project = projectDao.select_project(project_pk);
		
		if(project == null)
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		else
		{
			mv.setViewName("/admin/project/edit");
			mv.addObject("project",project);
		}
		
		
		return mv;
	}

	/**
	 * 프로젝트 수정 처리 페이지
	 * @throws ParseException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value = "/admin/project/edit/{project_pk}", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String AdminController_edit_post(HttpServletRequest request,
 			HttpServletResponse response,
			@PathVariable("project_pk") int project_pk, 
			 @RequestParam(value = "category", required = false, defaultValue = "") String category,
			 @RequestParam(value = "sub_category", required = false, defaultValue = "") String sub_category,
			 @RequestParam(value = "is_turnkey", required = false, defaultValue = "") String is_turnkey,
			 @RequestParam(value = "title", required = false, defaultValue = "") String title,
			 @RequestParam(value = "project_term", required = false, defaultValue = "") String project_term,
			 @RequestParam(value = "budget_maximum", required = false, defaultValue = "") String budget_maximum,
			 @RequestParam(value = "planning_status", required = false, defaultValue = "") String planning_status,
			 @RequestParam(value = "description", required = false, defaultValue = "") String description,
			 @RequestParam(value = "skill_required", required = false, defaultValue = "") String skill_required,
			 @RequestParam(value = "deadline", required = false, defaultValue = "") String deadline,
			 @RequestParam(value = "method_pre_interview", required = false, defaultValue = "") String method_pre_interview,
			 @RequestParam(value = "address_sido", required = false, defaultValue = "") String address_sido,
			 @RequestParam(value = "sigungu", required = false, defaultValue = "") String sigungu,
			 @RequestParam(value = "date_expected_kick_off", required = false, defaultValue = "") String date_expected_kick_off,
			 @RequestParam(value = "has_manage_experience", required = false, defaultValue = "") String has_manage_experience,
			 @RequestParam(value = "prefer_partner", required = false, defaultValue = "") String prefer_partner,
			 @RequestParam(value = "submit_purpose", required = false, defaultValue = "") String submit_purpose,
			 @RequestParam(value = "status", required = false, defaultValue = "") String status
			 ) throws NumberFormatException, ParseException {
		logger.info("/admin/project/edit/{project_pk} post page");
		
		JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) {
			jObject.put("messages", "error");
			jObject.put("path", "redirect:/accounts/login");
			return jObject.toString(); }
		else if(!account.getAccount_type().equals("admin"))  { 
			jObject.put("messages", "error");
			jObject.put("path", "redirect:/index");
			return jObject.toString(); }
		
		//title 체크
		if(title.isEmpty())
		{
			logger.info("title!!!!");
			jObject.put("messages", "제목은 필수입니다.");
			return jObject.toString();
		}
		else if(!Validator.isValidLength(title, 1, 30))
		{
			logger.info("title!!!!");
			jObject.put("messages", "프로젝트 제목은 최대 30자입니다.");
			return jObject.toString();
		}
		else
		{
			logger.info("title = "+title);
		}
		
		
		//category 체크
		if(category.isEmpty())
		{
			logger.info("category!!!!");
			jObject.put("messages", "카테고리는 필수입니다.");
			return jObject.toString();
		}
		else if(!category.equals("개발")&&!category.equals("디자인"))
		{
			logger.info("category!!!!");
			jObject.put("messages", "카테고리를 올바르게 선택해주세요.");
			return jObject.toString();
		}
		else
		{
			logger.info("category_val = "+category);
		}

		//sub category 체크
		if(sub_category.isEmpty())
		{
			logger.info("sub_category!!!!");
			jObject.put("messages", "세부 카테고리는 필수입니다.");
			return jObject.toString();
		}
		else if(!Validator.isProjectCategory(category, sub_category))
		{
			logger.info("sub_category!!!!");
			jObject.put("messages", "세부 카테고리를 올바르게 선택해주세요.");
			return jObject.toString();
		}
		else
		{
			logger.info("sub_category_val = "+sub_category);
		}
		
		//is_turnkey 체크
		if(is_turnkey.isEmpty())
		{
			logger.info("is_turnkey!!!!");
			jObject.put("messages", "디자인 혹은 개발도 필요하신지 선택해주세요.");
			return jObject.toString();
		}
		else
		{
			logger.info("is_turnkey_val = "+is_turnkey);
		}
		
		//project_term 체크
		if(project_term.isEmpty())
		{
			logger.info("project_term!!!!");
			jObject.put("messages", "진행 기간은 필수입니다.");
			return jObject.toString();
		}
		else if(!Validator.isDigit(project_term)||!Validator.isValidLength(project_term, 1, 3))
		{
			logger.info("project_term!!!!");
			jObject.put("messages", "프로젝트 진행기간을 올바르게 입력해주세요");
			return jObject.toString();
		}
		else
		{
			logger.info("project_term_val = "+project_term);
		}
		
		//budget_maximum 체크
		if(budget_maximum.isEmpty())
		{
			logger.info("budget_maximum!!!!");
			jObject.put("messages", "예산을 올바르게 입력해주세요");
			return jObject.toString();
		}
		else
		{
			budget_maximum = budget_maximum.replace(",", "");
			
			if(!Validator.isDigit(budget_maximum))
			{
				logger.info("budget_maximum!!!!");
				jObject.put("messages", "숫자만 입력 가능합니다.");
				return jObject.toString();
			}
			else
			{
			logger.info("budget_maximum_val = "+budget_maximum);
			}
		}	
		
		//planning_status 체크
		if(planning_status.isEmpty())
		{
			logger.info("planning_status!!!!");
			jObject.put("messages", "기획상태는 필수입니다.");
			return jObject.toString();
		}
		else if(!Validator.isPlanStatus(planning_status))
		{
			logger.info("planning_status!!!!");
			jObject.put("messages", "프로젝트 기획상태를 올바르게 입력해주세요");
			return jObject.toString();
		}
		else
		{
			logger.info("planning_status_val = "+planning_status);
		}	
		
		//description 체크
		if(description.isEmpty())
		{
			logger.info("description!!!!");
			jObject.put("messages", "프로젝트 내용은 필수입니다.");
			return jObject.toString();
		}
		else if(!Validator.isValidLength(description, 1, 5000))
		{
			logger.info("description!!!!");
			jObject.put("messages", "프로젝트 내용이 너무 깁니다.");
			return jObject.toString();
		}
		else
		{
			description.replace("\n", "<br/>");
			logger.info("description_val = "+description);
		}	
		
		//skill_required 체크(필수 X)
		if(!skill_required.isEmpty())
		{
			if(!Validator.isValidLength(skill_required, 1, 100))
			{
				logger.info("skill_required!!!!");
				jObject.put("messages", "관련 기술이 너무 깁니다.");
				return jObject.toString();
			}
			else
			{
				logger.info("skill_required_val = "+skill_required);
			}	
		}
		
		//deadline 체크
		if(deadline.isEmpty())
		{
			logger.info("deadline!!!!");
			jObject.put("messages", "모집 마감 일자는 필수입니다.");
			return jObject.toString();
		}
		else
		{
			logger.info("deadline_val = "+deadline);
		}
		
		//method_pre_interview 체크
		if(method_pre_interview.isEmpty())
		{
			logger.info("method_pre_interview!!!!");
			jObject.put("messages", "사전 미팅은 필수입니다.");
			return jObject.toString();
		}
		else if(!method_pre_interview.equals("OFFLINE")&&!method_pre_interview.equals("ONLINE"))
		{
			logger.info("method_pre_interview!!!!");
			jObject.put("messages", "사전 미팅을 올바르게 선택해주세요.");
			return jObject.toString();
		}
		else
		{
			logger.info("method_pre_interview_val = "+method_pre_interview);
		}
		
		//시,도 군 체크
		if(address_sido.isEmpty() ||sigungu.isEmpty() )
		{
			logger.info("address_sido||sigungu!!!!");
			jObject.put("messages", "지역은 필수입니다.");
			return jObject.toString();
		}
		else
		{
			logger.info("address_sido_val = "+address_sido);
			logger.info("sigungu_val = "+sigungu);
		}
		
		
		//date_expected_kick_off
		if(date_expected_kick_off.isEmpty() )
		{
			logger.info("date_expected_kick_off!!!!");
			jObject.put("messages", "프로젝트 시작일은 필수입니다.");
			return jObject.toString();
		}
		else
		{
			logger.info("date_expected_kick_off_val = "+date_expected_kick_off);
		}
		
		//has_manage_experience
		if(has_manage_experience.isEmpty())
		{
			logger.info("has_manage_experience!!!!");
			jObject.put("messages", "매니징 경험은 필수입니다.");
			return jObject.toString();
		}
		else
		{
			logger.info("has_manage_experience_val = "+has_manage_experience);
		}
		
		//prefer_partner(필수X)
		if(!prefer_partner.isEmpty())
		{
			if(!prefer_partner.equals("whatever")&&!prefer_partner.equals("corporate_business")
					&&!prefer_partner.equals("individual_business")&&!prefer_partner.equals("team")
					&&!prefer_partner.equals("individual"))
			{
				logger.info("prefer_partner!!!!");
				jObject.put("messages", "선호하는 파트너를 올바르게 선택해주세요.");
				return jObject.toString();
			}
			else
			{
				logger.info("prefer_partner_val = "+prefer_partner);
			}
		}
		
		//submit_purpose(필수 X)
		if(!submit_purpose.isEmpty())
		{
			if(!submit_purpose.equals("request")&&!submit_purpose.equals("inquire"))
			{
				logger.info("submit_purpose!!!!");
				jObject.put("messages", "프로젝트 의뢰 목적를 올바르게 선택해주세요.");
				return jObject.toString();
			}
			else
			{
				logger.info("submit_purpose_val = "+submit_purpose);
			}
		}
		
		if(status.equals("프로젝트 수정"))
		{	
			status = "검수중";
		}
		else
		{
			jObject.put("messages", "error");
			jObject.put("path", "redirect:/wjm/index");
			return jObject.toString();
		}
		
		
		logger.info("수정 가능");
		
		ProjectInfo project = projectDao.select_project(project_pk);
		
		projectDao.Update(project_pk,project.getAccount_pk(),category,sub_category,is_turnkey,title,Integer.parseInt(project_term),
				Integer.parseInt(budget_maximum),planning_status,description,skill_required,Time.dateToTimestamp(deadline),
				method_pre_interview, address_sido, sigungu, Time.dateToTimestamp(date_expected_kick_off), has_manage_experience,
				prefer_partner, submit_purpose, status);
		
		if(status.equals("검수중")){
			
			jObject.put("messages", "success");
			jObject.put("path", "/wjm/admin/project/preview/"+project.getName()+"/"+project_pk);
		}
		
		logger.info(jObject.toString());
		return jObject.toString();
	}
	////////////////////////////////////사용자 계정 정보////////////////////////////////////////
	/**
	 * 관리자 신원인증 페이지
	 */
	@RequestMapping(value = "/admin/identity", method = RequestMethod.GET)
	public ModelAndView AdminController_identity(HttpServletRequest request, ModelAndView mv) {
		logger.info("/admin/identity Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		List<AccountInfo> authenticationlist = accountInformationDao.selecIdentity_authenticationt("검수중");
		mv.addObject("authenticationlist",authenticationlist);
		
		mv.setViewName("/admin/identity");
		return mv;
	}
	/**
	 * 계정 정보 페이지
	 */
	@RequestMapping(value = "/admin/accounts/profile/{pk}", method = RequestMethod.GET)
	public ModelAndView AdminController_accounts_profile(HttpServletRequest request, 
			ModelAndView mv,
			@PathVariable("pk") int pk) {
		logger.info("/admin/accounts/profile Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		AccountInfo this_account = accountDao.select(pk);
		
		if(this_account == null)
		{
			mv.setViewName("redirect:/admin/home");
			return mv;
		}
		
		AccountInformationInfo this_accountinfo = accountInformationDao.select(pk);
		
		mv.addObject("this_account", this_account);
		mv.addObject("this_accountinfo",this_accountinfo);
		
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

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		AccountInfo this_account = accountDao.select(pk);
		
		if(this_account != null)
		{
			this_account.setAccountinfo(accountInformationDao.select(this_account.getPk()));
			this_account.setAuthenticationinfo(authenticationDao.select(this_account.getPk()));
			mv.addObject("this_account",this_account);
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

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		
		//알림
		account = accountInformationDao.selecIdentity_authenticationt(pk, "검수중");
		
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
		

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		//알림
		account = accountInformationDao.selecIdentity_authenticationt(pk, "검수중");
		
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
	@RequestMapping(value = "/admin/accounts/bank_account/{pk}", method = RequestMethod.GET)
	public ModelAndView AdminController_accounts_bank_account(HttpServletRequest request, ModelAndView mv,
			@PathVariable("pk") int pk) {
		logger.info("/admin/accounts/bank_account Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		AccountInfo this_account = accountDao.select(pk);
		
		if(this_account == null)
		{
			mv.setViewName("redirect:/admin/home");
			return mv;
		}
		
		AccountInformationInfo this_accountinfo = accountInformationDao.select(pk);
		
		mv.addObject("this_account", this_account);
		mv.addObject("this_accountinfo",this_accountinfo);
		
		mv.setViewName("/admin/accounts/bank_account");
		return mv;
	}
	
	
	/////////////////////////////////////////////계약/////////////////////////////////////////////
	/**
	 * 결제대기중인 프로젝트 페이지
	 */
	@RequestMapping(value = "/admin/wait", method = RequestMethod.GET)
	public ModelAndView AdminController_wait(HttpServletRequest request, ModelAndView mv) {
		logger.info("/admin/wait Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		//결제대기중인 계약 리스트
		List<ContractInfo> waitlist = contractDao.selectReadyProjectAdmin();
		mv.addObject("waitlist",waitlist);
		
		mv.setViewName("/admin/wait");
		return mv;
	}
	
	/**
	 * 진행중인 프로젝트 페이지
	 */
	@RequestMapping(value = "/admin/progress", method = RequestMethod.GET)
	public ModelAndView AdminController_progress(HttpServletRequest request, ModelAndView mv) {
		logger.info("/admin/progress Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		List<ContractInfo> progresslist = contractDao.selectProgressProjectAdmin();
		mv.addObject("progresslist",progresslist);
		
		mv.setViewName("/admin/progress");
		return mv;
	}
	/**
	 * 관리자 미팅 페이지
	 */
	@RequestMapping(value = "/admin/meeting", method = RequestMethod.GET)
	public ModelAndView AdminController_meeting(HttpServletRequest request, ModelAndView mv) {
		logger.info("/admin/meeting Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		List<ContractInfo> contractlist = contractDao.selectStatusAdmin("계약진행중");
		mv.addObject("contractlist",contractlist);

		mv.setViewName("/admin/meeting");
		return mv;
	}
	/**
	 * 미팅 후 계약 성공
	 */
	@RequestMapping(value = "/admin/contract/success/{project_pk}/{client_pk}/{partners_pk}", method = RequestMethod.GET)
	public ModelAndView AdminController_contract_success(HttpServletRequest request,
			@PathVariable("project_pk") int project_pk, 
			@PathVariable("client_pk") int client_pk, 
			@PathVariable("partners_pk") int partners_pk, 
			ModelAndView mv) {
		logger.info("/admin/contract/success/{project_pk}/{client_pk}/{partners_pk}");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		logger.info("project_pk = "+project_pk);
		logger.info("client_pk = "+client_pk);
		logger.info("partners_pk = "+partners_pk);

		ContractInfo contract = contractDao.select_project_client_partners(project_pk, client_pk, partners_pk);
		
		if(contract == null)
		{
			logger.info("계약이 존재하지 않음! 에러");
			mv.setViewName("redirect:/admin/home");
		}
		else
		{
			logger.info("계약 존재");
			mv.setViewName("/admin/contract/success");
			mv.addObject("contract",contract);
		}
		return mv;
	}
	
	/**
	 * 계약 실패 프로젝트 페이지
	 */
	@RequestMapping(value = "/admin/contract/faillist/", method = RequestMethod.GET)
	public ModelAndView AdminController_contract_fail(HttpServletRequest request,
			ModelAndView mv) {
		logger.info("/admin/contract/faillist/");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		List<CancellistInfo> cancellist = cancellistDao.selectAll();
		
		mv.setViewName("/admin/contract/faillist");
		mv.addObject("cancellist",cancellist);
		
		return mv;
	}
	/**
	 * 미팅 후 계약 실패
	 * @throws IOException 
	 * @throws URISyntaxException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(value = "/admin/contract/fail/{project_pk}/{partners_pk}/{contract_pk}", method = RequestMethod.GET)
	public ModelAndView AdminController_contract_fail(HttpServletRequest request,
			@PathVariable("project_pk") int project_pk, 
			@PathVariable("partners_pk") int partners_pk, 
			@PathVariable("contract_pk") int contract_pk, 
			ModelAndView mv) throws ClientProtocolException, URISyntaxException, IOException {
		logger.info("/admin/contract/fail/{project_pk}/{partners_pk}/{contract_pk}");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		logger.info("project_pk = "+project_pk);
		logger.info("partners_pk = "+partners_pk);
		logger.info("contract_pk = "+contract_pk);
				
		
		//두개인 경우, 프로젝트 > 취소한 프로젝트
		ProjectInfo project = projectDao.select_project(project_pk);
		ContractInfo contract = contractDao.select_project_client_partners(project_pk, project.getAccount_pk(), partners_pk);

		//해당 계약 상태 "취소"로 변경&등록일자 오늘 날짜로 업데이트
		contractDao.updateStatusFail(project_pk, project.getAccount_pk(), partners_pk, "취소");
		
		//해당 파트너스의 지원자 상태 "지원종료"로 변경
		applicantDao.updateStatus(project_pk, partners_pk, "지원종료");
		
		ApplicantInfo applicant = applicantDao.select(partners_pk, project_pk);
		
		//취소한 계약 추가
		cancellistDao.create(project_pk, applicant.getPk(), contract_pk);
		
		//프로젝트의 취소한 계약이 2개 인지 체크
		List<CancellistInfo> cancellist = cancellistDao.select_project(project_pk);
		
		if(cancellist != null)
			if(cancellist.size() == 2)
			{
				//프로젝트의 상태 "취소한프로젝트"으로 변경
				projectDao.updateStatus(project_pk,"취소한프로젝트");
			}
		
		//notification update
		//파트너스
		notificationDao.create(contract.getPartners_pk(),contract.getClient_id()+"님의 "
		+project.getName()+" 계약이 성사되지 못했습니다. 다른 프로젝트에 지원해주세요.");
		//클라이언트
		notificationDao.create(contract.getClient_pk(), contract.getPartners_id()+"님과의 "
				+project.getName()+" 프로젝트 계약이 성사되지 못했습니다. 미팅 신청은 총 2 번 가능합니다.");
		
		//클라이언트
		 AccountInformationInfo accountinfo = accountInformationDao.select(contract.getClient_pk());
	        String result = "";
	        
	        if(accountinfo.getSubscription() == 1)
	        {
	        	AccountInfo client_account = accountDao.select(contract.getClient_pk());
	        	result = sendMail("admin@wjm.com",client_account.getEmail(),contract.getPartners_id()+"님과의"
				+project.getName()+" 프로젝트 계약이 성사되지 못했습니다. 미팅 신청은 총 2 번 가능합니다.", "외주몬 알림 메일입니다.");
		logger.info("클라이언트 메일 : "+result);
	        }

	        if(accountinfo.getSms_subscription() == 1)
	        {
	        	String phone = "";
	        	
	        	if(Validator.hasValue(accountinfo.getCellphone_num()))
	        		phone = accountinfo.getCellphone_num().replace("-", "");
	        	
	        	if(Validator.hasValue(phone))
	        	{
	        		SMS.sendSMS(phone, phone, contract.getPartners_id()+"님과의"
	        				+project.getName()+" 프로젝트 계약이 성사되지 못했습니다. 미팅 신청은 총 2 번 가능합니다.", "");
		    		logger.info("SMS 전송");
	        	}
	        }
	        accountinfo = accountInformationDao.select(contract.getPartners_pk());
	        if(accountinfo.getSubscription() == 1)
	        {
	        	//파트너스
	        	AccountInfo partners_account = accountDao.select(contract.getPartners_pk());

	        	result = sendMail("admin@wjm.com",partners_account.getEmail(),contract.getClient_id()+"님의 "
				+project.getName()+" 계약이 성사되지 못했습니다. 다른 프로젝트에 지원해주세요.", "외주몬 알림 메일입니다.");
	        	logger.info("파트너스 메일 : "+result);
	        }

	        if(accountinfo.getSms_subscription() == 1)
	        {
	        	String phone = "";
	        	
	        	if(Validator.hasValue(accountinfo.getCellphone_num()))
	        		phone = accountinfo.getCellphone_num().replace("-", "");
	        	
	        	if(Validator.hasValue(phone))
	        	{
	        		SMS.sendSMS(phone, phone, contract.getClient_id()+"님의 "
	        				+project.getName()+" 계약이 성사되지 못했습니다. 다른 프로젝트에 지원해주세요.", "");
		    		logger.info("SMS 전송");
	        	}
	        }
		mv.setViewName("/admin/contract/faillist");
		
		return mv;
	}

	/**
	 * 실패 계약 복구
	 */
	@RequestMapping(value = "/admin/contract/revive/{cancellist_pk}/{project_pk}/{applicant_pk}/{contract_pk}", method = RequestMethod.GET)
	public ModelAndView AdminController_contract_fail(HttpServletRequest request,
			@PathVariable("cancellist_pk") int cancellist_pk, 
			@PathVariable("project_pk") int project_pk, 
			@PathVariable("applicant_pk") int applicant_pk, 
			@PathVariable("contract_pk") int contract_pk, 
			ModelAndView mv) {
		logger.info("/admin/contract/revive/{cancellist_pk}/{project_pk}/{applicant_pk}/{contract_pk}");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}

		logger.info("cancellist_pk = "+cancellist_pk);
		logger.info("project_pk = "+project_pk);
		logger.info("applicant_pk = "+applicant_pk);
		logger.info("contract_pk = "+contract_pk);
				
		ProjectInfo project = projectDao.select_project(project_pk);
		ApplicantInfo applicant = applicantDao.select(applicant_pk);
		ContractInfo contract = contractDao.select_project_client_partners(project_pk, project.getAccount_pk(), applicant.getAccount_pk());
		
		//해당 계약 상태 "계약진행중"로 변경&등록일자 오늘 날짜로 업데이트
		contractDao.updateStatusFail(project_pk, project.getAccount_pk(), applicant.getAccount_pk(), "계약진행중");
		
		//해당 파트너스의 지원자 상태 "지원중"로 변경
		applicantDao.updateStatus(project_pk, applicant.getAccount_pk(), "지원중");
		
		//프로젝트의 취소한 계약이 2개 인지 체크
		List<CancellistInfo> cancellist = cancellistDao.select_project(project_pk);
		
		if(cancellist != null)
			if(cancellist.size() == 2)
			{
				//프로젝트의 상태 "지원자모집중"으로 변경
				projectDao.updateStatus(project_pk,"지원자모집중");
			}

		//취소한 계약 삭제
		CancellistInfo cancel = cancellistDao.select(project_pk, applicant.getPk(), contract_pk);
		cancellistDao.delete(cancel.getPk());
		/*
		//notification update
		//파트너스
		notificationDao.create(contract.getPartners_pk(),contract.getClient_id()+"님의 "
		+project.getName()+" 계약이 성사되지 못했습니다. 다른 프로젝트에 지원해주세요.");
		//클라이언트
		notificationDao.create(contract.getClient_pk(), contract.getPartners_id()+"님과의 "
				+project.getName()+" 프로젝트 계약이 성사되지 못했습니다. 미팅 신청은 총 2 번 가능합니다.");
		
		//클라이언트
		String result = sendMail("admin@wjm.com","gksthf1611@gmail.com",contract.getPartners_id()+"님과의"
				+project.getName()+" 프로젝트 계약이 성사되지 못했습니다. 미팅 신청은 총 2 번 가능합니다.", "외주몬 알림 메일입니다.");
		logger.info("클라이언트 메일 : "+result);
		//파트너스
		result = sendMail("admin@wjm.com","gksthf1611@gmail.com",contract.getClient_id()+"님의 "
				+project.getName()+" 계약이 성사되지 못했습니다. 다른 프로젝트에 지원해주세요.", "외주몬 알림 메일입니다.");
		logger.info("파트너스 메일 : "+result);
		*/
		mv.setViewName("redirect:/admin/home");
		
		return mv;
	}

	
	/**
	 * 미팅 후 계약 성공 처리
	 * @throws IOException 
	 * @throws URISyntaxException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(value = "/admin/contract/success/{project_pk}/{client_pk}/{partners_pk}", method = RequestMethod.POST)
	public ModelAndView AdminController_contract_success_post(HttpServletRequest request,
			@PathVariable("project_pk") int project_pk, 
			@PathVariable("client_pk") int client_pk, 
			@PathVariable("partners_pk") int partners_pk, 
			ModelAndView mv,
			 @RequestParam("budget") int budget,
			 @RequestParam("term") int term) throws ClientProtocolException, URISyntaxException, IOException {
		logger.info("/admin/contract/success/{project_pk}/{client_pk}/{partners_pk} post page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		logger.info("project_pk = "+project_pk);
		logger.info("client_pk = "+client_pk);
		logger.info("partners_pk = "+partners_pk);
		logger.info("budget = "+budget);
		logger.info("term = "+term);
		
		ContractInfo contract = contractDao.select_project_client_partners(project_pk, client_pk, partners_pk);
		
		if(contract == null)
		{
			logger.info("계약이 존재하지 않음! 에러");
			mv.setViewName("redirect:/admin/home");
			return mv;
		}
		logger.info("계약 존재");
		
		//해당 계약 상태 "완료"로 변경&등록일자 오늘 날짜로 업데이트
		contractDao.updateStatusSuccess(project_pk, client_pk, partners_pk, budget, term, "완료");
		
		//나머지 계약 상태 "취소"로 변경
		//contractDao.updateRemianContractFail(project_pk);
		
		//해당 파트너스의 지원자 상태 "완료"로 변경
		applicantDao.updateStatus(project_pk, partners_pk, "완료");
		
		//나머지 프로젝트의 지원자 상태가 "지원중"이면 "지원종료"로 변경
		//applicantDao.updateRemianApplicantFail(project_pk);
		
		//프로젝트의 상태 "진행중"으로 변경
		projectDao.updateStatus(project_pk,"결제대기중");
		
		ProjectInfo project = projectDao.select_project(contract.getProject_pk());
		
		//notification update
		//파트너스
		notificationDao.create(contract.getPartners_pk(),contract.getClient_id()+"와의 계약이 성사되었습니다. 클라이언트가 결제를 완료하면 "
				+project.getName()+" 프로젝트가 진행됩니다.");
		//클라이언트
		notificationDao.create(contract.getClient_pk(), contract.getPartners_id()+"와의 계약이 성사되었습니다. 결제 대기중인 프로젝트의 결제를 완료하면 "
				+project.getName()+" 프로젝트가 진행됩니다.");
		
		//클라이언트
		 AccountInformationInfo accountinfo = accountInformationDao.select(contract.getClient_pk());
	        String result = "";
	        
	        if(accountinfo.getSubscription() == 1)
	        {
	        	AccountInfo clientaccount = accountDao.select(contract.getClient_pk());
	        	result = sendMail("admin@wjm.com",clientaccount.getEmail(),contract.getPartners_id()+"와의 계약이 성사되었습니다. 결제 대기중인 프로젝트의 결제를 완료하면 "
				+project.getName()+" 프로젝트가 진행됩니다.", "외주몬 알림 메일입니다.");
	        	logger.info("클라이언트 메일 : "+result);
	        }
	        if(accountinfo.getSms_subscription() == 1)
	        {
	        	String phone = "";
	        	
	        	if(Validator.hasValue(accountinfo.getCellphone_num()))
	        		phone = accountinfo.getCellphone_num().replace("-", "");
	        	
	        	if(Validator.hasValue(phone))
	        	{
	        		SMS.sendSMS(phone, phone, contract.getPartners_id()+"와의 계약이 성사되었습니다. 결제 대기중인 프로젝트의 결제를 완료하면 "
	        				+project.getName()+" 프로젝트가 진행됩니다.", "");
		    		logger.info("SMS 전송");
	        	}
	        }
	        
	        //파트너스
	        accountinfo = accountInformationDao.select(contract.getPartners_pk());

	        if(accountinfo.getSubscription() == 1)
	        {
	        	AccountInfo partnersaccount = accountDao.select(contract.getPartners_pk());

	        	result = sendMail("admin@wjm.com",partnersaccount.getEmail(),contract.getClient_id()+"와의 계약이 성사되었습니다. 클라이언트가 결제를 완료하면 "
				+project.getName()+" 프로젝트가 진행됩니다.", "외주몬 알림 메일입니다.");
	        	logger.info("파트너스 메일 : "+result);
	        }
	        if(accountinfo.getSms_subscription() == 1)
	        {
	        	String phone = "";
	        	
	        	if(Validator.hasValue(accountinfo.getCellphone_num()))
	        		phone = accountinfo.getCellphone_num().replace("-", "");
	        	
	        	if(Validator.hasValue(phone))
	        	{
	        		SMS.sendSMS(phone, phone, contract.getClient_id()+"와의 계약이 성사되었습니다. 클라이언트가 결제를 완료하면 "
	        				+project.getName()+" 프로젝트가 진행됩니다.", "");
		    		logger.info("SMS 전송");
	        	}
	        }
		mv.setViewName("redirect:/admin/home");
		return mv;
	}

	/**
	 * 승인 후 프로젝트 완료 처리
	 * @throws IOException 
	 * @throws URISyntaxException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(value = "/admin/project/complete/success/{project_pk}/{client_pk}/{partners_pk}", method = RequestMethod.GET)
	public ModelAndView AdminController_project__complete_success_post(HttpServletRequest request,
			@PathVariable("project_pk") int project_pk, 
			@PathVariable("client_pk") int client_pk, 
			@PathVariable("partners_pk") int partners_pk, 
			ModelAndView mv) throws ClientProtocolException, URISyntaxException, IOException {
		
		logger.info("/admin/project/complete/success/{project_pk}/{client_pk}/{partners_pk} post page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		logger.info("project_pk = "+project_pk);
		logger.info("client_pk = "+client_pk);
		logger.info("partners_pk = "+partners_pk);
		
		ContractInfo contract = contractDao.select_project_client_partners(project_pk, client_pk, partners_pk);
		
		if(contract == null)
		{
			logger.info("계약이 존재하지 않음! 에러");
			mv.setViewName("redirect:/admin/home");
			return mv;
		}
		logger.info("계약 존재");
		
		/////////////////////////////////////////////대금 지급 루틴!
		
		//프로젝트의 상태 "완료한프로젝트"로 변경
		projectDao.updateStatus(project_pk,"완료한프로젝트");
		
		ProjectInfo project = projectDao.select_project(project_pk);
		
		//notification update
		//파트너스
		notificationDao.create(partners_pk, project.getName()+" 프로젝트의 대금이 지급되었습니다. 클라이언트를 평가해야 프로젝트가 완료됩니다.");
		//클라이언트
		notificationDao.create(client_pk, project.getName()+" 프로젝트의 대금이 지급되었습니다. 파트너스를 평가해야 프로젝트가 완료됩니다.");
		
		//파트너스
		AccountInformationInfo accountinfo = accountInformationDao.select(partners_pk);
        
        if(accountinfo.getSubscription() == 1)
        {
        	AccountInfo partnersaccount = accountDao.select(partners_pk);
        	String mail_result = sendMail("admin@wjm.com", partnersaccount.getEmail(), project.getName()+" 프로젝트의 대금이 지급되었습니다. 클라이언트를 평가해야 프로젝트가 완료됩니다.", "외주몬 알림 메일입니다");
        	logger.info("이메일 전송 결과1 = "+mail_result);
        }
        if(accountinfo.getSms_subscription() == 1)
        {
        	String phone = "";
        	
        	if(Validator.hasValue(accountinfo.getCellphone_num()))
        		phone = accountinfo.getCellphone_num().replace("-", "");
        	
        	if(Validator.hasValue(phone))
        	{
        		SMS.sendSMS(phone, phone, project.getName()+" 프로젝트의 대금이 지급되었습니다. 클라이언트를 평가해야 프로젝트가 완료됩니다.", "");
	    		logger.info("SMS 전송");
        	}
        }

		//클라이언트
        accountinfo = accountInformationDao.select(client_pk);

        if(accountinfo.getSubscription() == 1)
        {
        	AccountInfo clientaccount = accountDao.select(client_pk);

        	String mail_result = sendMail("admin@wjm.com", clientaccount.getEmail(), project.getName()+" 프로젝트의 대금이 지급되었습니다. 파트너스를 평가해야 프로젝트가 완료됩니다.", "외주몬 알림 메일입니다");
        	logger.info("이메일 전송 결과2 = "+mail_result);
        }
        if(accountinfo.getSms_subscription() == 1)
        {
        	String phone = "";
        	
        	if(Validator.hasValue(accountinfo.getCellphone_num()))
        		phone = accountinfo.getCellphone_num().replace("-", "");
        	
        	if(Validator.hasValue(phone))
        	{
        		SMS.sendSMS(phone, phone, 
        				project.getName()+" 프로젝트의 대금이 지급되었습니다. 파트너스를 평가해야 프로젝트가 완료됩니다.", "");
	    		logger.info("SMS 전송");
        	}
        }

		mv.setViewName("redirect:/admin/home");
		return mv;
	}
	
	//////////////////////////////////////////공지사항///////////////////////////////////////////
	/**
	 * 관리자 공지사항 페이지
	 */
	@RequestMapping(value = "/admin/notice", method = RequestMethod.GET)
	public ModelAndView AdminController_notice(HttpServletRequest request, ModelAndView mv) {
		logger.info("/admin/notice Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		List<NoticeInfo> noticelist = noticeDao.selectAll();
		mv.addObject("noticelist",noticelist);

		mv.setViewName("/admin/notice");
		return mv;
	}
	
	/**
	 * 공지사항 등록 페이지
	 */
	@RequestMapping(value = "/admin/notice/add", method = RequestMethod.GET)
	public ModelAndView AdminController_notice_add(HttpServletRequest request, ModelAndView mv) {
		logger.info("/admin/notice/add Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		mv.setViewName("/admin/notice/add");
		return mv;
	}
	
	/**
	 * 공지사항 등록 처리 페이지
	 */
	@RequestMapping(value = "/admin/notice/add", method = RequestMethod.POST)
	public ModelAndView AdminController_notice_edit_post(HttpServletRequest request, 
			ModelAndView mv,
			@RequestParam("editor") String editor,
			@RequestParam("title") String title,
			 @RequestParam(value = "flag", required = false, 
             defaultValue = "off") String flag) {
		
		logger.info("/admin/notice/add post Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		logger.info("title = "+title);
		logger.info("editor : "+editor);
		logger.info("flag : "+flag);
		
		mv.addObject("title",title);
		mv.addObject("editor",editor);
		mv.addObject("flag",flag);
		
		mv.setViewName("/admin/notice/add");
		
		if(!Validator.hasValue(title))
		{
			mv.addObject("messages","제목을 입력하세요.");
			return mv;
		}
		else if(!Validator.isValidLength(title,1,50))
		{
			mv.addObject("messages","제목은 최대 50자입니다.");
			return mv;
		}
		else
		{
			logger.info("제목정상입력");
		}
		
		if(!Validator.hasValue(editor))
		{
			mv.addObject("messages","내용을 입력하세요.");
			return mv;
		}
		else if(!Validator.isValidLength(editor,1,5000))
		{
			mv.addObject("messages","내용은 최대 5000자입니다.");
			return mv;
		}
		else
		{
			logger.info("내용정상입력");
		}
		
		logger.info("디비 생성");
		if(flag.equals("on"))
			noticeDao.create(title, editor, 1);
		else
			noticeDao.create(title, editor, 0);
		
		mv = new ModelAndView();
		mv.setViewName("redirect:/admin/home");
		return mv;
	}
	
	
	/**
	 * 공지사항 보기 페이지
	 */
	@RequestMapping(value = "/admin/notice/preview/{pk}", method = RequestMethod.GET)
	public ModelAndView AdminController_notice_preview(HttpServletRequest request, ModelAndView mv,
			@PathVariable("pk") int pk) {
		logger.info("/admin/notice/preview/{pk} Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		NoticeInfo notice = noticeDao.select(pk);
		
		if(notice == null)
		{
			mv.setViewName("redirect:/admin/home");
			return mv;
		}
		
		mv.addObject("notice",notice);
		
		
		mv.setViewName("/admin/notice/preview");
		return mv;
	}
	/**
	 * 공지사항 수정 페이지
	 */
	@RequestMapping(value = "/admin/notice/edit/{pk}", method = RequestMethod.GET)
	public ModelAndView AdminController_notice_edit(HttpServletRequest request, ModelAndView mv,
			@PathVariable("pk") int pk) {
		logger.info("/admin/notice/preview/{pk} Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		NoticeInfo notice = noticeDao.select(pk);
		
		if(notice == null)
		{
			mv.setViewName("redirect:/admin/home");
			return mv;
		}
		
		mv.addObject("notice",notice);
		
		
		mv.setViewName("/admin/notice/edit");
		return mv;
	}
	/**
	 * 공지사항 등록 처리 페이지
	 */
	@RequestMapping(value = "/admin/notice/edit/{pk}", method = RequestMethod.POST)
	public ModelAndView AdminController_notice_edit_post(HttpServletRequest request, ModelAndView mv,
			@RequestParam("editor") String editor,
			@RequestParam("title") String title,
			@PathVariable("pk") int pk,
			 @RequestParam(value = "flag", required = false, 
             defaultValue = "off") String flag) {
		logger.info("/admin/notice/add post Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		logger.info("pk = "+pk);
		logger.info("title = "+title);
		logger.info("editor : "+editor);
		logger.info("flag : "+flag);
		
		int flag_int = 0;
		if(flag.equals("on"))
			flag_int = 1;
		
		NoticeInfo notice = new NoticeInfo(pk, title, editor, flag_int, null);
		mv.addObject("notice",notice);
		mv.setViewName("/admin/notice/edit");
		
		if(!Validator.hasValue(title))
		{
			mv.addObject("messages","제목을 입력하세요.");
			return mv;
		}
		else if(!Validator.isValidLength(title,1,50))
		{
			mv.addObject("messages","제목은 최대 50자입니다.");
			return mv;
		}
		else
		{
			logger.info("제목정상입력");
		}
		if(!Validator.hasValue(editor))
		{
			mv.addObject("messages","내용을 입력하세요.");
			return mv;
		}
		else if(!Validator.isValidLength(editor,1,5000))
		{
			mv.addObject("messages","내용은 최대 5000자입니다.");
			return mv;
		}
		else
		{
			logger.info("내용정상입력");
		}
		
		logger.info("디비 수정");
		noticeDao.update(pk, title, editor, flag_int);
		
		mv = new ModelAndView();
		mv.setViewName("redirect:/admin/home");
		return mv;
	}
	


	/**
	 * 추가 요청 리스트 화면
	 */

	@RequestMapping(value = "/admin/contract/addition/list", method = RequestMethod.GET)
	public ModelAndView AdminController_addition_list(HttpServletRequest request, 
			ModelAndView mv) {
		logger.info("admin addition list get Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		List<AdditionInfo> additionlist = additionDao.selectStatusAdmin("검수중");
		List<AdditionInfo> progresslist = additionDao.selectStatusAdmin("진행중");
		
		mv.addObject("additionlist", additionlist);
		mv.addObject("progresslist", progresslist);
		mv.setViewName("/admin/contract/addition/list");
		
		return mv;
	}
	

	/**
	 * 추가 요청 진행중인 리스트 화면
	 */

	@RequestMapping(value = "/admin/contract/addition/progress", method = RequestMethod.GET)
	public ModelAndView AdminController_addition_progress(HttpServletRequest request, 
			ModelAndView mv) {
		logger.info("admin addition progress get Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null) { mv.setViewName("redirect:/accounts/login"); return mv;}
		else if(!account.getAccount_type().equals("admin"))  { mv.setViewName("redirect:/index"); return mv;}
		
		List<AdditionInfo> additionlist = additionDao.selectStatusAdmin("검수중");
		List<AdditionInfo> progresslist = additionDao.selectStatusAdmin("진행중");
		
		mv.addObject("additionlist", additionlist);
		mv.addObject("progresslist", progresslist);
		mv.setViewName("/admin/contract/addition/progress");
		
		return mv;
	}
	

	/**
	 * 추가요청 승인
	 * @throws IOException 
	 * @throws URISyntaxException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(value = "/admin/addition/submit/{addition_pk}", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String Admincontroller_addition_submit(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("addition_pk") int addition_pk) throws ClientProtocolException, URISyntaxException, IOException {

		logger.info("/admin/addition/submit/{addition_pk} Post Page");
		logger.info("addition_pk = " + addition_pk);

		JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null)
		{
			jObject.put("messages", "error");
			jObject.put("path", "/wjm/accounts/login");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		} 
		else if(!account.getAccount_type().equals("admin"))
		{
			jObject.put("messages", "error");
			jObject.put("path", "/wjm/index");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		} 
		
		AdditionInfo addition = additionDao.select(addition_pk);
		
		if(addition == null)
		{
			jObject.put("messages", "error");
			jObject.put("path", "/wjm/accounts/login");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		} 
		
		//상태 업데이트
		additionDao.updateStatusAdmin(addition_pk, "결제대기중");
		
		ContractInfo contract = contractDao.select(addition.getContract_pk());

		//클라이언트
		notificationDao.create(contract.getClient_pk(), addition.getTitle()+" 추가요청이 결제대기중입니다. 결제를 완료하면 진행중으로 상태가 변경됩니다.");
		
		AccountInformationInfo accountinfo = accountInformationDao.select(contract.getClient_pk());
        
        if(accountinfo.getSubscription() == 1)
        {
        	AccountInfo clientaccount = accountDao.select(contract.getClient_pk());
        	String result = sendMail("admin@wjm.com",clientaccount.getEmail(),addition.getTitle()+" 추가요청이 결제대기중입니다. 결제를 완료하면 진행중으로 상태가 변경됩니다."
				, "외주몬 알림 메일입니다.");
        	logger.info("클라이언트 메일 : "+result);
        }

        if(accountinfo.getSms_subscription() == 1)
        {
        	String phone = "";
        	
        	if(Validator.hasValue(accountinfo.getCellphone_num()))
        		phone = accountinfo.getCellphone_num().replace("-", "");
        	
        	if(Validator.hasValue(phone))
        	{
        		SMS.sendSMS(phone, phone, 
        				addition.getTitle()+" 추가요청이 결제대기중입니다. 결제를 완료하면 진행중으로 상태가 변경됩니다."
        				, "");
	    		logger.info("SMS 전송");
        	}
        }
		
		jObject.put("messages", "success");
		jObject.put("path", "/wjm/admin/contract/addition/list");
		logger.info(jObject.toString());
		
		return jObject.toString();
	}
	

	/**
	 * 추가요청 취소
	 * @throws IOException 
	 * @throws URISyntaxException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(value = "/admin/addition/cancel/{addition_pk}", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String Admincontroller_addition_cancel(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("addition_pk") int addition_pk) throws ClientProtocolException, URISyntaxException, IOException {

		logger.info("/admin/addition/cancel/{addition_pk} Post Page");
		logger.info("addition_pk = " + addition_pk);

		JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null)
		{
			jObject.put("messages", "error");
			jObject.put("path", "/wjm/accounts/login");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		} 
		else if(!account.getAccount_type().equals("admin"))
		{
			jObject.put("messages", "error");
			jObject.put("path", "/wjm/index");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		} 
		
		AdditionInfo addition = additionDao.select(addition_pk);
		
		if(addition == null)
		{
			jObject.put("messages", "error");
			jObject.put("path", "/wjm/accounts/login");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		} 
		
		//상태 업데이트
		additionDao.updateStatusAdmin(addition_pk, "취소");

		
		ContractInfo contract = contractDao.select(addition.getContract_pk());

		//클라이언트
		notificationDao.create(contract.getClient_pk(), addition.getTitle()+" 추가요청이 취소되었습니다. ");
		AccountInformationInfo accountinfo = accountInformationDao.select(contract.getClient_pk());
        
        if(accountinfo.getSubscription() == 1)
        {
        	AccountInfo clientaccount = accountDao.select(contract.getClient_pk());

        	String result = sendMail("admin@wjm.com",clientaccount.getEmail(),addition.getTitle()+" 추가요청이 취소되었습니다. "
				, "외주몬 알림 메일입니다.");
        	logger.info("클라이언트 메일 : "+result);
        }

        if(accountinfo.getSms_subscription() == 1)
        {
        	String phone = "";
        	
        	if(Validator.hasValue(accountinfo.getCellphone_num()))
        		phone = accountinfo.getCellphone_num().replace("-", "");
        	
        	if(Validator.hasValue(phone))
        	{
        		SMS.sendSMS(phone, phone, 
        				addition.getTitle()+" 추가요청이 취소되었습니다. "
        				,"");
	    		logger.info("SMS 전송");
        	}
        }
        
		jObject.put("messages", "success");
		jObject.put("path", "/wjm/admin/contract/addition/list");
		logger.info(jObject.toString());
		
		return jObject.toString();
	}

	/**
	 * 추가요청 완료
	 */
	@RequestMapping(value = "/admin/addition/complete/{addition_pk}", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String Admincontroller_addition_complete(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("addition_pk") int addition_pk) {

		logger.info("/admin/addition/complete/{addition_pk} Post Page");
		logger.info("addition_pk = " + addition_pk);

		JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null)
		{
			jObject.put("messages", "error");
			jObject.put("path", "/wjm/accounts/login");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		} 
		else if(!account.getAccount_type().equals("admin"))
		{
			jObject.put("messages", "error");
			jObject.put("path", "/wjm/index");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		} 
		
		AdditionInfo addition = additionDao.select(addition_pk);
		
		if(addition == null)
		{
			jObject.put("messages", "error");
			jObject.put("path", "/wjm/accounts/login");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		} 
		
		//상태 업데이트
		additionDao.updateStatusAdmin(addition_pk, "완료");
		
		jObject.put("messages", "success");
		jObject.put("path", "/wjm/admin/contract/addition/progress");
		logger.info(jObject.toString());
		
		return jObject.toString();
	}
	
	
	@RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
	 public String fileUpload(MultipartRequest multipartRequest, 
			 ModelAndView mv,
			 HttpServletRequest request) throws IOException, FileUploadException{
	  MultipartFile imgfile = multipartRequest.getFile("Filedata");     
	  //write.jsp 부분에서 input file의 name 입니다.
	  Calendar cal = Calendar.getInstance();
	  String fileName = imgfile.getOriginalFilename();
	  String fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());
	  String replaceName = cal.getTimeInMillis() + fileType;  
	  
	  String path = request.getRealPath("") + "\\";
	  //파일이 저장되는 경로입니다. deploy되는 곳의 경로를 찾아서 저장합니다
	  Fileupload.upload_notice( path, imgfile, replaceName);
	  mv.addObject("filename", replaceName);       
	  // 저장된 이름을 전달합니다.​
	  return "file_upload";
	 }
	//다중파일업로드
	@RequestMapping("/multiplePhotoUpload")
	public void multiplePhotoUpload(HttpServletRequest request, 
			HttpServletResponse response){
	    
		logger.info("multiplePhotoUpload");
		logger.info("request.getContext = "+request.getContextPath());
		
		try {
	         //파일정보
	         String sFileInfo = "";
	         //파일명을 받는다 - 일반 원본파일명
	         String filename = request.getHeader("file-name");
	         //파일 확장자
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         //확장자를소문자로 변경
	         filename_ext = filename_ext.toLowerCase();
	         //파일 기본경로
	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         //파일 기본경로 _ 상세경로
	         String filePath = dftFilePath + "resources" + File.separator + "photo_upload" + File.separator;
	         File file = new File(filePath);
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         String realFileNm = "";
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath + realFileNm;
	         ///////////////// 서버에 파일쓰기 ///////////////// 
	         InputStream is = request.getInputStream();
	         OutputStream os=new FileOutputStream(rlFileNm);
	         int numRead;
	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	         while((numRead = is.read(b,0,b.length)) != -1){
	            os.write(b,0,numRead);
	         }
	         if(is != null) {
	            is.close();
	         }
	         os.flush();
	         os.close();
	         ///////////////// 서버에 파일쓰기 /////////////////
	         // 정보 출력
	         sFileInfo += "&bNewLine=true";
	         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
	         sFileInfo += "&sFileName="+ filename;;
	         sFileInfo += "&sFileURL="+request.getContextPath()+"/resources/photo_upload/"+realFileNm;
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	}
}
