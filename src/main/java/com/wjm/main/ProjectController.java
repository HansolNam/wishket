package com.wjm.main;

import java.text.ParseException;
import java.util.ArrayList;
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
import com.wjm.dao.AreaDetailDao;
import com.wjm.dao.CommentDao;
import com.wjm.dao.Partners_infoDao;
import com.wjm.dao.PortfolioDao;
import com.wjm.dao.ProjectDao;
import com.wjm.dao.TechniqueDao;
import com.wjm.main.function.Time;
import com.wjm.main.function.Validator;
import com.wjm.models.AccountInfo;
import com.wjm.models.AccountInformationInfo;
import com.wjm.models.ApplicantInfo;
import com.wjm.models.CommentInfo;
import com.wjm.models.PortfolioInfo;
import com.wjm.models.ProjectInfo;

import net.sf.json.JSONObject;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProjectController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	private static final boolean Available = false;
	   
	@Autowired
	private ProjectDao projectDao;
	@Autowired
	private AccountDao accountDao;
	@Autowired
	private ApplicantDao applicantDao;
	@Autowired
	private CommentDao commentDao;

	@Autowired
	private AccountInformationDao accountInformationDao;
	
	@Autowired
	private AreaDetailDao areaDetailDao;
	
	@Autowired
	private Partners_infoDao partners_infoDao;
	

	@Autowired
	private PortfolioDao portfolioDao;

	@Autowired
	private TechniqueDao techniqueDao;
	/**
	 * 프로젝트 추가
	 */
	@RequestMapping(value = "/project/add", method = RequestMethod.GET)
	public ModelAndView ProjectController_project_add(HttpServletRequest request,ModelAndView mv) {
		logger.info("project add Page");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		
		//기본 정보가 있는 경우, 프로젝트 등록 페이지로
		if(accountInformationDao.hasContactInfo(account.getPk()))
			mv.setViewName("redirect:/project/add/detail");
		//기본 정보가 없는 경우, 기본정보 등록 페이지로
		else
		{
			mv.setViewName("redirect:/project/add/contact");
		}
		
		return mv;
	}
	/**
	 * 프로젝트 추가위한 기본정보 페이지
	 */
	@RequestMapping(value = "/project/add/contact", method = RequestMethod.GET)
	public ModelAndView ProjectController_add_contact(HttpServletRequest request,ModelAndView mv) {
		logger.info("/project/add/contact 페이지");
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");

		if(account == null) {mv.setViewName("redirect:/accounts/login");return mv;}
		
		AccountInformationInfo accountinfo = accountInformationDao.select(account.getPk());
		
		logger.info("name = "+accountinfo.getName());
		logger.info("cellphone_num = "+accountinfo.getCellphone_num());
		logger.info("form = "+accountinfo.getForm());
		logger.info("c_name = "+accountinfo.getCompany_name());
		logger.info("representative = "+accountinfo.getCompany_representative());
		logger.info("introduction = "+accountinfo.getIntroduction());
		
		mv.addObject("name", accountinfo.getName());
		mv.addObject("cellphone_num", accountinfo.getCellphone_num());
		mv.addObject("form",accountinfo.getForm());
		mv.addObject("company_name",accountinfo.getCompany_name());
		mv.addObject("representative",accountinfo.getCompany_representative());
		mv.addObject("introduction",accountinfo.getIntroduction());
		
		return mv;
	}
	/**
	 * 기본정보 추가 처리
	 */
	@RequestMapping(value = "/project/add/contact", method = RequestMethod.POST, produces = "text/plain; charset=utf8")
	public ModelAndView ProjectController_add_contact_post(HttpServletRequest request,
 			HttpServletResponse response,
			 @RequestParam("name") String name,
			 @RequestParam("cellphone_num_code") String cellphone_num_code,
			 @RequestParam("cellphone_num_middle") String cellphone_num_middle,
			 @RequestParam("cellphone_num_end") String cellphone_num_end,
			 @RequestParam("form") String form,
			 @RequestParam(value = "company_name", required = false, defaultValue = "") String company_name,
			 @RequestParam(value = "representative", required = false, defaultValue = "") String company_representative,
			 @RequestParam("introduction") String introduction
			 ) {
		logger.info("기본 정보 추가 처리");

		logger.info("name = "+name);
		logger.info("cellphone_num_code = "+cellphone_num_code);
		logger.info("cellphone_num_middle = "+cellphone_num_middle);
		logger.info("cellphone_num_end = "+cellphone_num_end);
		logger.info("form = "+form);
		logger.info("company_name = "+company_name);
		logger.info("representative = "+company_representative);
		logger.info("introduction = "+introduction);
		
		
		//모델앤뷰 생성
		ModelAndView mv = new ModelAndView();
		String return_val = "/project/add/contact";
		mv.setViewName(return_val);

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		
		boolean isAvailable = true;
		
		mv.addObject("name_val",name);
		mv.addObject("cellphone_num_code_val",cellphone_num_code);
		mv.addObject("cellphone_num_middle_val",cellphone_num_middle);
		mv.addObject("cellphone_num_end_val",cellphone_num_end);
		mv.addObject("form_val",form);
		mv.addObject("company_name_val",company_name);
		mv.addObject("representative_val",company_representative);
		mv.addObject("introduction_val",introduction);
		
		
		//이름
		if(name == null)
		{
			isAvailable = false;
			mv.addObject("name_msg","이름을 입력해주세요");
		}
		else if(name.isEmpty())
		{
			isAvailable = false;
			mv.addObject("name_msg","이름을 입력해주세요");
		}
		else if(name.length()>20)
		{
			isAvailable = false;
			mv.addObject("name_msg","이름은 20글자 이하로 입력해주세요.");
		}
		
		//핸드폰번호
		if(!Validator.isPhoneCode(cellphone_num_code)||!Validator.isDigit(cellphone_num_middle)||!Validator.isDigit(cellphone_num_end))
		{
			isAvailable = false;
			mv.addObject("cellphone_num_msg","핸드폰번호를 올바르게 입력해주세요.");
		}
		else if(cellphone_num_middle.length()>10 || cellphone_num_end.length()>10)
		{
			isAvailable = false;
			mv.addObject("cellphone_num_msg","핸드폰번호를 올바르게 입력해주세요.");
		}
		
		//회사 형태
		if(!Validator.isCompanyForm(form))
		{
			isAvailable = false;
			mv.addObject("form_msg","회사형태를 올바르게 선택해주세요");
		}

		//회사소개
		if(introduction == null)
		{
			isAvailable = false;
			mv.addObject("introduction_msg","클라이언트 소개를 입력해주세요");
		}
		else if(name.isEmpty())
		{
			isAvailable = false;
			mv.addObject("introduction_msg","클라이언트 소개를 입력해주세요");
		}
		else if(name.length()>150)
		{
			isAvailable = false;
			mv.addObject("introduction_msg","클라이언트 소개는 150글자 이하로 입력해주세요.");
		}
		
		if(!form.equals("individual") && !form.equals("team"))
		{
			//회사명
			if(company_name == null)
			{
				isAvailable = false;
				mv.addObject("company_name_msg","회사명을 입력해주세요");
			}
			else if(company_name.isEmpty())
			{
				isAvailable = false;
				mv.addObject("company_name_msg","회사명을 입력해주세요");
			}
			else if(company_name.length()>20)
			{
				isAvailable = false;
				mv.addObject("company_name_msg","회사명은 20글자 이하로 입력해주세요.");
			}
			//대표명
			if(company_representative == null)
			{
				isAvailable = false;
				mv.addObject("representative_msg","대표명을 입력해주세요");
			}
			else if(company_representative.isEmpty())
			{
				isAvailable = false;
				mv.addObject("representative_msg","대표명을 입력해주세요");
			}
			else if(company_representative.length()>20)
			{
				isAvailable = false;
				mv.addObject("representative_msg","대표명은 20글자 이하로 입력해주세요.");
			}
			
			//사용자 계정 존재시
			if(account != null && isAvailable)
			{
				mv = new ModelAndView();
				mv.setViewName("redirect:/project/add/detail");
				String cellphone_num = cellphone_num_code + "-" + cellphone_num_middle + "-" +cellphone_num_end;
				accountInformationDao.updateBasicInfo(account.getPk(), name, cellphone_num, form, company_name, company_representative, introduction);
				
			}
			
		}
		else
		{
			//사용자 계정 존재시
			if(account != null && isAvailable)
			{
				mv = new ModelAndView();
				mv.setViewName("redirect:/project/add/detail");
				String cellphone_num = cellphone_num_code + "-" + cellphone_num_middle + "-" +cellphone_num_end;
				accountInformationDao.updateBasicInfo_individual(account.getPk(), name, cellphone_num, form, introduction);
				mv.setViewName("redirect:/project/add/detail");
			}
		}
		
		
		
		return mv;
	}
	/**
	 * 프로젝트 수정 페이지
	 */
	@RequestMapping(value = "/project/add/edit/{project_pk}", method = RequestMethod.GET)
	public ModelAndView ProjectController_edit(HttpServletRequest request, ModelAndView mv,
			@PathVariable("project_pk") int project_pk) {
		logger.info("/project/edit/{project_pk} Page");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");

		if(account == null) {mv.setViewName("redirect:/accounts/login");return mv;}
		
		ProjectInfo project = projectDao.select_project(project_pk);
		
		if(project == null)
		{
			mv.setViewName("/error");
			return mv;
		}
		else
		{
			mv.setViewName("/project/add/edit");
			mv.addObject("project",project);
		}
		
		
		return mv;
	}

	/**
	 * 프로젝트 수정 처리 페이지
	 * @throws ParseException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value = "/project/add/edit/{project_pk}", method = RequestMethod.POST, produces = "text/plain; charset=utf8")
	public ModelAndView ProjectController_add_edit_post(HttpServletRequest request,
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
			 @RequestParam(value = "post_a_job", required = false, defaultValue = "") String post_a_job,
			 @RequestParam(value ="save_for_later", required = false, defaultValue = "") String save_for_later
			 ) throws NumberFormatException, ParseException {
		logger.info("프로젝트 추가 처리");
		
		boolean isAvailable = true;
		
		//모델앤뷰 생성
		ModelAndView mv = new ModelAndView();
		String return_val = "/project/add/edit";
		mv.setViewName(return_val);
		
		
		
		//title 체크
		if(title.isEmpty())
		{
			logger.info("title!!!!");
			isAvailable = false;
			mv.addObject("title_msg","이 항목은 필수입니다.");
		}
		else if(!Validator.isValidLength(title, 1, 30))
		{
			logger.info("title!!!!");
			isAvailable = false;
			mv.addObject("title_msg","프로젝트 제목을 올바르게 입력해주세요");
		}
		else
		{
			logger.info("title = "+title);
			mv.addObject("title_val",title);
		}
		
		
		//category 체크
		if(category.isEmpty())
		{
			logger.info("category!!!!");
			isAvailable = false;
			mv.addObject("category_msg","이 항목은 필수입니다.");
		}
		else if(!category.equals("개발")&&!category.equals("디자인"))
		{
			logger.info("category!!!!");
			isAvailable = false;
			mv.addObject("category_msg","카테고리를 올바르게 선택해주세요");
		}
		else
		{
			logger.info("category_val = "+category);
			mv.addObject("category_val",category);
		}

		//sub category 체크
		if(sub_category.isEmpty())
		{
			logger.info("sub_category!!!!");
			isAvailable = false;
			mv.addObject("category_msg","이 항목은 필수입니다.");
		}
		else if(!Validator.isProjectCategory(category, sub_category))
		{
			logger.info("sub_category!!!!");
			isAvailable = false;
			mv.addObject("category_msg","카테고리를 올바르게 선택해주세요");
		}
		else
		{
			logger.info("sub_category_val = "+sub_category);
			mv.addObject("sub_category_val",sub_category);
		}
		
		//is_turnkey 체크
		if(is_turnkey.isEmpty())
		{
			logger.info("is_turnkey!!!!");
			isAvailable = false;
			mv.addObject("is_turnkey_msg","디자인 혹은 개발도 필요하신지 선택해주세요.");
		}
		else
		{
			logger.info("is_turnkey_val = "+is_turnkey);
			mv.addObject("is_turnkey_val",is_turnkey);
		}
		
		//project_term 체크
		if(project_term.isEmpty())
		{
			logger.info("project_term!!!!");
			isAvailable = false;
			mv.addObject("project_term_msg","이 항목은 필수입니다.");
		}
		else if(!Validator.isDigit(project_term)||!Validator.isValidLength(project_term, 1, 3))
		{
			logger.info("project_term!!!!");
			isAvailable = false;
			mv.addObject("project_term_msg","프로젝트 진행기간을 올바르게 입력해주세요");
		}
		else
		{
			logger.info("project_term_val = "+project_term);
			mv.addObject("project_term_val",project_term);
		}
		
		//budget_maximum 체크
		if(budget_maximum.isEmpty())
		{
			logger.info("budget_maximum!!!!");
			isAvailable = false;
			mv.addObject("budget_maximum_msg","이 항목은 필수입니다.");
		}
		else
		{
			budget_maximum = budget_maximum.replace(",", "");
			
			if(!Validator.isDigit(budget_maximum))
			{
				logger.info("budget_maximum!!!!");
				isAvailable = false;
				mv.addObject("budget_maximum_msg","숫자만 입력 가능합니다.");
			}
			else
			{
			logger.info("budget_maximum_val = "+budget_maximum);
			mv.addObject("budget_maximum_val",budget_maximum);
			}
		}	
		
		//planning_status 체크
		if(planning_status.isEmpty())
		{
			logger.info("planning_status!!!!");
			isAvailable = false;
			mv.addObject("planning_status_msg","이 항목은 필수입니다.");
		}
		else if(!Validator.isPlanStatus(planning_status))
		{
			logger.info("planning_status!!!!");
			isAvailable = false;
			mv.addObject("planning_status_msg","프로젝트 기획상태를 올바르게 입력해주세요");
		}
		else
		{
			logger.info("planning_status_val = "+planning_status);
			mv.addObject("planning_status_val",planning_status);
		}	
		
		//description 체크
		if(description.isEmpty())
		{
			logger.info("description!!!!");
			isAvailable = false;
			mv.addObject("description_msg","이 항목은 필수입니다.");
		}
		else if(!Validator.isValidLength(description, 1, 5000))
		{
			logger.info("description!!!!");
			isAvailable = false;
			mv.addObject("description_msg","프로젝트 내용이 너무 깁니다.");
		}
		else
		{
			description.replace("\n", "<br/>");
			logger.info("description_val = "+description);
			mv.addObject("description_val",description);
		}	
		
		//skill_required 체크(필수 X)
		if(!skill_required.isEmpty())
		{
			if(!Validator.isValidLength(skill_required, 1, 100))
			{
				logger.info("skill_required!!!!");
				isAvailable = false;
				mv.addObject("skill_required_msg","관련 기술이 너무 깁니다");
			}
			else
			{
				logger.info("skill_required_val = "+skill_required);
				mv.addObject("skill_required_val",skill_required);
			}	
		}
		
		//deadline 체크
		if(deadline.isEmpty())
		{
			logger.info("deadline!!!!");
			isAvailable = false;
			mv.addObject("deadline_msg","이 항목은 필수입니다.");
		}
		else
		{
			logger.info("deadline_val = "+deadline);
			mv.addObject("deadline_val",deadline);
		}
		
		//method_pre_interview 체크
		if(method_pre_interview.isEmpty())
		{
			logger.info("method_pre_interview!!!!");
			isAvailable = false;
			mv.addObject("method_pre_interview_msg","이 항목은 필수입니다.");
		}
		else if(!method_pre_interview.equals("OFFLINE")&&!method_pre_interview.equals("ONLINE"))
		{
			logger.info("method_pre_interview!!!!");
			isAvailable = false;
			mv.addObject("method_pre_interview_msg","사전 미팅을 올바르게 선택해주세요.");
		}
		else
		{
			logger.info("method_pre_interview_val = "+method_pre_interview);
			mv.addObject("method_pre_interview_val",method_pre_interview);
		}
		
		//시,도 군 체크
		if(address_sido.isEmpty() ||sigungu.isEmpty() )
		{
			logger.info("address_sido||sigungu!!!!");
			isAvailable = false;
			mv.addObject("address_msg","이 항목은 필수입니다.");
		}
		else
		{
			logger.info("address_sido_val = "+address_sido);
			logger.info("sigungu_val = "+sigungu);
			mv.addObject("address_sido_val",address_sido);
			mv.addObject("sigungu_val",sigungu);
		}
		
		
		//date_expected_kick_off
		if(date_expected_kick_off.isEmpty() )
		{
			logger.info("date_expected_kick_off!!!!");
			isAvailable = false;
			mv.addObject("date_expected_kick_off_msg","이 항목은 필수입니다.");
		}
		else
		{
			logger.info("date_expected_kick_off_val = "+date_expected_kick_off);
			mv.addObject("date_expected_kick_off_val",date_expected_kick_off);
		}
		
		//has_manage_experience
		if(has_manage_experience.isEmpty())
		{
			logger.info("has_manage_experience!!!!");
			isAvailable = false;
			mv.addObject("has_manage_experience_msg","이 항목은 필수입니다.");
		}
		else
		{
			logger.info("has_manage_experience_val = "+has_manage_experience);
			mv.addObject("has_manage_experience_val",has_manage_experience);
		}
		
		//prefer_partner(필수X)
		if(!prefer_partner.isEmpty())
		{
			if(!prefer_partner.equals("whatever")&&!prefer_partner.equals("corporate_business")
					&&!prefer_partner.equals("individual_business")&&!prefer_partner.equals("team")
					&&!prefer_partner.equals("individual"))
			{
				isAvailable = false;
				logger.info("prefer_partner!!!!");
				mv.addObject("prefer_partner_msg","선호하는 파트너를 올바르게 선택해주세요.");
			}
			else
			{
				logger.info("prefer_partner_val = "+prefer_partner);
				mv.addObject("prefer_partner_val",prefer_partner);
			}
		}
		
		//submit_purpose(필수 X)
		if(!submit_purpose.isEmpty())
		{
			if(!submit_purpose.equals("request")&&!submit_purpose.equals("inquire"))
			{
				logger.info("submit_purpose!!!!");
				isAvailable = false;
				mv.addObject("submit_purpose_msg","프로젝트 의뢰 목적를 올바르게 선택해주세요.");
			}
			else
			{
				logger.info("submit_purpose_val = "+submit_purpose);
				mv.addObject("submit_purpose_val",submit_purpose);
			}
		}

		String status = "";
		if(!post_a_job.isEmpty())
		{	
			status = "검수중";
		}
		else if(!save_for_later.isEmpty())
			status = "임시저장";
		
		
		if(isAvailable)
		{
			logger.info("추가 가능");
			AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");

			if(account!=null)
			{
				projectDao.Update(project_pk,account.getPk(),category,sub_category,is_turnkey,title,Integer.parseInt(project_term),
						Integer.parseInt(budget_maximum),planning_status,description,skill_required,Time.dateToTimestamp(deadline),
						method_pre_interview, address_sido, sigungu, Time.dateToTimestamp(date_expected_kick_off), has_manage_experience,
						prefer_partner, submit_purpose, status);
				if(status.equals("임시저장"))
				{
					mv = new ModelAndView();
					return_val = "redirect:/client/manage/project/saved/";
				}
				else if(status.equals("검수중")){
					////////////////////알림 & 히스토리 업데이트
					mv = new ModelAndView();
					return_val = "redirect:/project/add/thank-you";
				}
				mv.setViewName(return_val);
			}
			else
			{
				mv.setViewName("redirect:/accounts/login");
			}
		}
		return mv;
	}
	/**
	 * 프로젝트 수정 페이지
	 */
	@RequestMapping(value = "/project/add/detail", method = RequestMethod.GET)
	public ModelAndView ProjectController_add_detail(HttpServletRequest request, ModelAndView mv) {
		logger.info("add detail Page");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");

		if(account == null) {mv.setViewName("redirect:/accounts/login");return mv;}
		
		return mv;
	}
	
	/**
	 * 프로젝트 추가 페이지
	 * @throws ParseException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(value = "/project/add/detail", method = RequestMethod.POST, produces = "text/plain; charset=utf8")
	public ModelAndView ProjectController_add_detail_post(HttpServletRequest request,
 			HttpServletResponse response,
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
			 @RequestParam(value = "post_a_job", required = false, defaultValue = "") String post_a_job,
			 @RequestParam(value ="save_for_later", required = false, defaultValue = "") String save_for_later
			 ) throws NumberFormatException, ParseException {
		logger.info("프로젝트 추가 처리");
		
		boolean isAvailable = true;
		
		//모델앤뷰 생성
		ModelAndView mv = new ModelAndView();
		String return_val = "/project/add/detail";
		mv.setViewName(return_val);
		
		
		
		//title 체크
		if(title.isEmpty())
		{
			logger.info("title!!!!");
			isAvailable = false;
			mv.addObject("title_msg","이 항목은 필수입니다.");
		}
		else if(!Validator.isValidLength(title, 1, 30))
		{
			logger.info("title!!!!");
			isAvailable = false;
			mv.addObject("title_msg","프로젝트 제목을 올바르게 입력해주세요");
		}
		else
		{
			logger.info("title = "+title);
			mv.addObject("title_val",title);
		}
		
		
		//category 체크
		if(category.isEmpty())
		{
			logger.info("category!!!!");
			isAvailable = false;
			mv.addObject("category_msg","이 항목은 필수입니다.");
		}
		else if(!category.equals("개발")&&!category.equals("디자인"))
		{
			logger.info("category!!!!");
			isAvailable = false;
			mv.addObject("category_msg","카테고리를 올바르게 선택해주세요");
		}
		else
		{
			logger.info("category_val = "+category);
			mv.addObject("category_val",category);
		}

		//sub category 체크
		if(sub_category.isEmpty())
		{
			logger.info("sub_category!!!!");
			isAvailable = false;
			mv.addObject("category_msg","이 항목은 필수입니다.");
		}
		else if(!Validator.isProjectCategory(category, sub_category))
		{
			logger.info("sub_category!!!!");
			isAvailable = false;
			mv.addObject("category_msg","카테고리를 올바르게 선택해주세요");
		}
		else
		{
			logger.info("sub_category_val = "+sub_category);
			mv.addObject("sub_category_val",sub_category);
		}
		
		//is_turnkey 체크
		if(is_turnkey.isEmpty())
		{
			logger.info("is_turnkey!!!!");
			isAvailable = false;
			mv.addObject("is_turnkey_msg","디자인 혹은 개발도 필요하신지 선택해주세요.");
		}
		else
		{
			logger.info("is_turnkey_val = "+is_turnkey);
			mv.addObject("is_turnkey_val",is_turnkey);
		}
		
		//project_term 체크
		if(project_term.isEmpty())
		{
			logger.info("project_term!!!!");
			isAvailable = false;
			mv.addObject("project_term_msg","이 항목은 필수입니다.");
		}
		else if(!Validator.isDigit(project_term)||!Validator.isValidLength(project_term, 1, 3))
		{
			logger.info("project_term!!!!");
			isAvailable = false;
			mv.addObject("project_term_msg","프로젝트 진행기간을 올바르게 입력해주세요");
		}
		else
		{
			logger.info("project_term_val = "+project_term);
			mv.addObject("project_term_val",project_term);
		}
		
		//budget_maximum 체크
		if(budget_maximum.isEmpty())
		{
			logger.info("budget_maximum!!!!");
			isAvailable = false;
			mv.addObject("budget_maximum_msg","이 항목은 필수입니다.");
		}
		else
		{
			budget_maximum = budget_maximum.replace(",", "");
			
			if(!Validator.isDigit(budget_maximum))
			{
				logger.info("budget_maximum!!!!");
				isAvailable = false;
				mv.addObject("budget_maximum_msg","숫자만 입력 가능합니다.");
			}
			else
			{
			logger.info("budget_maximum_val = "+budget_maximum);
			mv.addObject("budget_maximum_val",budget_maximum);
			}
		}	
		
		//planning_status 체크
		if(planning_status.isEmpty())
		{
			logger.info("planning_status!!!!");
			isAvailable = false;
			mv.addObject("planning_status_msg","이 항목은 필수입니다.");
		}
		else if(!Validator.isPlanStatus(planning_status))
		{
			logger.info("planning_status!!!!");
			isAvailable = false;
			mv.addObject("planning_status_msg","프로젝트 기획상태를 올바르게 입력해주세요");
		}
		else
		{
			logger.info("planning_status_val = "+planning_status);
			mv.addObject("planning_status_val",planning_status);
		}	
		
		//description 체크
		if(description.isEmpty())
		{
			logger.info("description!!!!");
			isAvailable = false;
			mv.addObject("description_msg","이 항목은 필수입니다.");
		}
		else if(!Validator.isValidLength(description, 1, 5000))
		{
			logger.info("description!!!!");
			isAvailable = false;
			mv.addObject("description_msg","프로젝트 내용이 너무 깁니다.");
		}
		else
		{
			description.replace("\n", "<br/>");
			logger.info("description_val = "+description);
			mv.addObject("description_val",description);
		}	
		
		//skill_required 체크(필수 X)
		if(!skill_required.isEmpty())
		{
			if(!Validator.isValidLength(skill_required, 1, 100))
			{
				logger.info("skill_required!!!!");
				isAvailable = false;
				mv.addObject("skill_required_msg","관련 기술이 너무 깁니다");
			}
			else
			{
				logger.info("skill_required_val = "+skill_required);
				mv.addObject("skill_required_val",skill_required);
			}	
		}
		
		//deadline 체크
		if(deadline.isEmpty())
		{
			logger.info("deadline!!!!");
			isAvailable = false;
			mv.addObject("deadline_msg","이 항목은 필수입니다.");
		}
		else
		{
			logger.info("deadline_val = "+deadline);
			mv.addObject("deadline_val",deadline);
		}
		
		//method_pre_interview 체크
		if(method_pre_interview.isEmpty())
		{
			logger.info("method_pre_interview!!!!");
			isAvailable = false;
			mv.addObject("method_pre_interview_msg","이 항목은 필수입니다.");
		}
		else if(!method_pre_interview.equals("OFFLINE")&&!method_pre_interview.equals("ONLINE"))
		{
			logger.info("method_pre_interview!!!!");
			isAvailable = false;
			mv.addObject("method_pre_interview_msg","사전 미팅을 올바르게 선택해주세요.");
		}
		else
		{
			logger.info("method_pre_interview_val = "+method_pre_interview);
			mv.addObject("method_pre_interview_val",method_pre_interview);
		}
		
		//시,도 군 체크
		if(address_sido.isEmpty() ||sigungu.isEmpty() )
		{
			logger.info("address_sido||sigungu!!!!");
			isAvailable = false;
			mv.addObject("address_msg","이 항목은 필수입니다.");
		}
		else
		{
			logger.info("address_sido_val = "+address_sido);
			logger.info("sigungu_val = "+sigungu);
			mv.addObject("address_sido_val",address_sido);
			mv.addObject("sigungu_val",sigungu);
		}
		
		
		//date_expected_kick_off
		if(date_expected_kick_off.isEmpty() )
		{
			logger.info("date_expected_kick_off!!!!");
			isAvailable = false;
			mv.addObject("date_expected_kick_off_msg","이 항목은 필수입니다.");
		}
		else
		{
			logger.info("date_expected_kick_off_val = "+date_expected_kick_off);
			mv.addObject("date_expected_kick_off_val",date_expected_kick_off);
		}
		
		//has_manage_experience
		if(has_manage_experience.isEmpty())
		{
			logger.info("has_manage_experience!!!!");
			isAvailable = false;
			mv.addObject("has_manage_experience_msg","이 항목은 필수입니다.");
		}
		else
		{
			logger.info("has_manage_experience_val = "+has_manage_experience);
			mv.addObject("has_manage_experience_val",has_manage_experience);
		}
		
		//prefer_partner(필수X)
		if(!prefer_partner.isEmpty())
		{
			if(!prefer_partner.equals("whatever")&&!prefer_partner.equals("corporate_business")
					&&!prefer_partner.equals("individual_business")&&!prefer_partner.equals("team")
					&&!prefer_partner.equals("individual"))
			{
				isAvailable = false;
				logger.info("prefer_partner!!!!");
				mv.addObject("prefer_partner_msg","선호하는 파트너를 올바르게 선택해주세요.");
			}
			else
			{
				logger.info("prefer_partner_val = "+prefer_partner);
				mv.addObject("prefer_partner_val",prefer_partner);
			}
		}
		
		//submit_purpose(필수 X)
		if(!submit_purpose.isEmpty())
		{
			if(!submit_purpose.equals("request")&&!submit_purpose.equals("inquire"))
			{
				logger.info("submit_purpose!!!!");
				isAvailable = false;
				mv.addObject("submit_purpose_msg","프로젝트 의뢰 목적를 올바르게 선택해주세요.");
			}
			else
			{
				logger.info("submit_purpose_val = "+submit_purpose);
				mv.addObject("submit_purpose_val",submit_purpose);
			}
		}

		String status = "";
		if(!post_a_job.isEmpty())
			status = "검수중";
		else if(!save_for_later.isEmpty())
			status = "임시저장";
		
		
		if(isAvailable)
		{
			logger.info("추가 가능");
			AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");

			if(account!=null)
			{
				projectDao.Save(account.getPk(),category,sub_category,is_turnkey,title,Integer.parseInt(project_term),
						Integer.parseInt(budget_maximum),planning_status,description,skill_required,Time.dateToTimestamp(deadline),
						method_pre_interview, address_sido, sigungu, Time.dateToTimestamp(date_expected_kick_off), has_manage_experience,
						prefer_partner, submit_purpose, status);
				if(status.equals("임시저장"))
				{
					mv = new ModelAndView();
					return_val = "redirect:/client/manage/project/saved/";
				}
				else if(status.equals("검수중")){
					mv = new ModelAndView();
					return_val = "redirect:/project/add/thank-you";
				}
				mv.setViewName(return_val);
			}
		}
		return mv;
	}
	/**
	 * 프로젝트 추가 안내
	 */
	@RequestMapping(value = "/project/add/thank-you", method = RequestMethod.GET)
	public String ProjectController_add_thankyou(HttpServletRequest request) {
		logger.info("add thankyou Page");
		
		
		
		return "/project/add/thank-you";
	}
	/**
	 * 프로젝트 질문답변
	 */
	@RequestMapping(value = "/project/faq", method = RequestMethod.GET)
	public String ProjectController_faq(HttpServletRequest request) {
		logger.info("add faq Page");
		
		
		
		return "/project/faq";
	}
	/**
	 * 프로젝트 미리보기
	 */
	@RequestMapping(value = "/project/preview/{name}/{pk}", method = RequestMethod.GET)
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
			mv.setViewName("/project/preview");
		
		
		return mv;
	}

	//중분류 리스트
	@RequestMapping(value = "/getCategoryM", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String ProjectController_getCategoryM(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("categoryL") String categoryL) {
		logger.info("getCategoryM AJAX");

		JSONObject jObject = new JSONObject();
		List<String> categoryMlist = new ArrayList<String>();

		if(categoryL.equals("개발"))
		{
			categoryMlist.add("웹");
			categoryMlist.add("애플리케이션");
			categoryMlist.add("워드프레스");
			categoryMlist.add("퍼블리싱");
			categoryMlist.add("일반소프트웨어");
			categoryMlist.add("커머스_쇼핑몰");
			categoryMlist.add("게임");
			categoryMlist.add("임베디드");
			categoryMlist.add("기타");
		}
		else if(categoryL.equals("디자인"))
		{
			categoryMlist.add("웹");
			categoryMlist.add("애플리케이션");
			categoryMlist.add("제품");
			categoryMlist.add("프레젠테이션");
			categoryMlist.add("인쇄물");
			categoryMlist.add("커머스_쇼핑몰");
			categoryMlist.add("로고");
			categoryMlist.add("그래픽");
			categoryMlist.add("영상");
			categoryMlist.add("게임");
			categoryMlist.add("기타");
		}
		
		jObject.put("categoryMlist", categoryMlist);
		logger.info(jObject.toString());

		return jObject.toString();
	}
	
	//지역 리스트(area_name)
	@RequestMapping(value = "/getAddress", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String ProjectController_getAddress(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("area") String area) {
		logger.info("getAddress AJAX");

		logger.info("area = "+area);
		JSONObject jObject = new JSONObject();
		
		if(area.equals(""))
		{
			logger.info(jObject.toString());
			return jObject.toString();
		}
		else
		{
			List<String> arealist = areaDetailDao.select(area.trim());
	
			jObject.put("arealist", arealist);
			logger.info(jObject.toString());
			return jObject.toString();
		}

	}
	

	/**
	 * 프로젝트 찾기
	 */
	@RequestMapping(value = "/project_ajax", method = RequestMethod.GET, produces="application/html;charset=UTF-8")
	public ModelAndView ProjectController_project_ajax(HttpServletRequest request
			,@RequestParam("page") String page
			,@RequestParam("q") String q
			,@RequestParam("sort") String sort
			,@RequestParam("cat_dev") String cat_dev
			,@RequestParam("cat_design") String cat_design
			,@RequestParam("addr") String addr) {
		logger.info("project_ajax Page");

		/*
			page = "1"
			q = "None"
			sort = "2" 1: 급액 높은 순, 2: 금액 낮은 순, 3: 최신 등록 순, 4. 마감 임박순
			cat_dev = "2222222222" 10개
			cate_design = "1111111111" 11개
			1:
			
			addr = "";17개
			1:서울특별시, 2:경기도, 3:인천광역시, 4:부산광역시, 5:대구광역시, 
			6:광주광역시, 7:대전광역시, 8:울산광역시, 9:세종특별자치시
			10:강원도, 11:충청북도, 12:충청남도, 13:전라북도
			14:전라남도, 15:경상북도, 16: 경상남도, 17:제주특별자치도
		*/
		logger.info("page = "+page);
		logger.info("q = "+q);
		logger.info("sort = "+sort);
		logger.info("cat_dev = "+cat_dev);
		logger.info("cat_design = "+cat_design);
		logger.info("addr = "+addr);

		//모델앤뷰 생성
		ModelAndView mv = new ModelAndView();
		String return_val = "/project_ajax";
		mv.setViewName(return_val);
		
		List<ProjectInfo> projectlist = projectDao.selectCondition(q,cat_dev,cat_design,addr,sort);
		
		for(int i=0;i<projectlist.size();i++)
		{
			logger.info(i + " : "+projectlist.get(i).getName());
		}
		mv.addObject("projectlist",projectlist);
		
		return mv;
	}
	
	/**
	 * 프로젝트 찾기에서 클릭
	 */

	@RequestMapping(value = "/project/{name}/{pk}", method = RequestMethod.GET)
	public ModelAndView ProjectController_project_about(HttpServletRequest request, 
			@PathVariable("pk") String pk, 
			@PathVariable("name") String name, ModelAndView mv) {
		logger.info("project about get Page");
		
		if(!Validator.hasValue(name))
		{
			mv.setViewName("/project");
			return mv;
		}
		
		if(!Validator.isDigit(pk))
		{
			mv.setViewName("/project");
			return mv;
		}
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

				
		ProjectInfo project = projectDao.select(Integer.parseInt(pk), name);
		if(project!=null)
		{
			AccountInfo project_account = accountDao.select(project.getAccount_pk());
			project.setAccount(project_account);
			
			mv.addObject("project",project);

			mv.addObject("applicantnum", project.getApplicantnum());
			AccountInformationInfo accountinformation = accountInformationDao.select(project.getAccount_pk());
			mv.addObject("accountinfo",accountinformation);
			
			if(account.getAccount_type().equals("partners"))
			{
				boolean hasInfo, hasIntro, hasSkill, hasPortfolio, not_end, already_apply;
				
				hasInfo = partners_infoDao.hasPartnersInfo(account.getPk());
				hasIntro = accountInformationDao.hasIntroduction(account.getPk());
				hasSkill = techniqueDao.hasSkill(account.getPk());
				hasPortfolio = portfolioDao.hasPortfolio(account.getPk());
				
				if(Time.remainDate(project.getDeadline(),Time.getCurrentTimestamp())>=0)
				{
					not_end = true;
				}
				else
					not_end = false;
				
				ApplicantInfo applicant = applicantDao.select(account.getPk(),project.getPk());
				if(applicant == null)
					already_apply = false;
				else
					already_apply = true;
				
				if(hasInfo && hasIntro && hasSkill && hasPortfolio && not_end && !already_apply)
					{
						mv.addObject("available", "true");
					}
			}
			
		}
		else
		{
			mv.setViewName("/project");
			return mv;
		}
		
		List<CommentInfo> comment = commentDao.select(Integer.parseInt(pk));
		mv.addObject("comment",comment);
		
		mv.setViewName("/project/about");
		return mv;
	}

	/**
	 * 프로젝트 지원하기 클릭
	 */

	@RequestMapping(value = "/project/{name}/{pk}/proposal/apply", method = RequestMethod.GET)
	public ModelAndView ProjectController_project_proposalapply(HttpServletRequest request, 
			@PathVariable("pk") String pk, 
			@PathVariable("name") String name, ModelAndView mv) {
		logger.info("project proposal apply get Page");
		
		if(!Validator.hasValue(name))
		{
			mv.setViewName("/project");
			return mv;
		}
		
		if(!Validator.isDigit(pk))
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
				
		ProjectInfo project = projectDao.select(Integer.parseInt(pk), name);
		if(project!=null)
			mv.addObject("project",project);
		else
		{
			mv.setViewName("/project");
			return mv;
		}
		
		List<PortfolioInfo> portfolio = portfolioDao.select(account.getPk());
		
		if(portfolio != null && portfolio.isEmpty())
			portfolio = null;
		mv.addObject("portfolio", portfolio);
		mv.setViewName("/project/proposal/apply");
		
		return mv;
	}
	//estimated_budget
	//estimated_term
	//body
	//has_related_portfolio(True, False)
	//related_portfolio
	//related_description
	

	/**
	 * 프로젝트 지원하기 처리
	 */
	@RequestMapping(value = "/project/{name}/{pk}/proposal/apply", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String ProjectController_project_proposalapply_post(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("name") String name, 
			@PathVariable("pk") String pk, 
			@RequestParam("estimated_budget") String estimated_budget,
			@RequestParam("estimated_term") String estimated_term, 
			@RequestParam("body") String body,
			@RequestParam("has_related_portfolio") String has_related_portfolio,
			@RequestParam(value = "related_portfolio", required = false) String[] related_portfolio,
			@RequestParam(value = "related_description", required = false, defaultValue = "") String related_description
			) {

		logger.info("/project/{name}/{pk}/proposal/apply Post Page");
		

		logger.info("name = " + name);
		logger.info("pk = " + pk);
		logger.info("estimated_budget = " + estimated_budget);
		logger.info("estimated_term = " + estimated_term);
		logger.info("body = " + body);
		logger.info("has_related_portfolio = " + has_related_portfolio);
		if(related_portfolio != null)
			for(int i=0;i<related_portfolio.length;i++)
				logger.info(i+" : "+related_portfolio[i]);
		logger.info("related_description = " + related_description);
		
		JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		
		if (!Validator.isDigit(pk)) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String result = "";

		try {
			result = applicantDao.createApplicant(account.getPk(),Integer.parseInt(pk),name,estimated_budget,
					estimated_term,body,has_related_portfolio,related_portfolio,related_description);
			
		} catch (Exception e) {
			logger.info(e.toString());
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}
		logger.info("result = " + result);
		if (result.equals("성공"))
			jObject.put("messages", "success");
		else {
			jObject.put("messages", result);
		}

		return jObject.toString();
	}
	
	/**
	 * 댓글 달기 처리 페이지
	 */
	@RequestMapping(value = "/project/{name}/{pk}", method = RequestMethod.POST)
	public ModelAndView ProjectController_comment_post(HttpServletRequest request,
 			HttpServletResponse response,
 			ModelAndView mv,
 			@PathVariable("name") String name,
 			@PathVariable("pk") int project_pk,
 			@RequestParam("body") String body) {
		logger.info("comment POST Page");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		
		if(account == null)
		{
			mv.setViewName("/accounts/login");
			return mv;
		}
		
		if(!Validator.hasValue(body))
			mv.addObject("messages","댓글을 입력해주세요");
		else if(!Validator.isValidLength(body, 1, 250))
			mv.addObject("messages","댓글은 최대 250자입니다.");
		else
		{
			commentDao.create(account.getPk(), project_pk, body);
		}

		AccountInformationInfo accountinformation = accountInformationDao.select(account.getPk());
		
		mv.addObject("accountinfo",accountinformation);
				
		ProjectInfo project = projectDao.select(project_pk, name);
		if(project!=null)
			mv.addObject("project",project);
		else
		{
			mv.setViewName("/project");
			return mv;
		}
		
		List<CommentInfo> comment = commentDao.select(project_pk);
		mv.addObject("comment",comment);
		
		List<ApplicantInfo> applicantlist = applicantDao.select_project(project_pk);
		if(applicantlist == null)
			mv.addObject("applicantnum", 0);
		else
			mv.addObject("applicantnum", applicantlist.size());
		mv.setViewName("/project/about");
		
		return mv;
		
	}
	


	/**
	 * 프로젝트 삭제
	 */
	@RequestMapping(value = "/project/delete", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String ProjectController_projectdelete_post(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("delete_project_id") String delete_project_id) {

		logger.info("/project/delete Post Page");
		logger.info("delete_project_id = " + delete_project_id);

		JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		
		if (account == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}
		

		if (!Validator.isDigit(delete_project_id)) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String result = projectDao.delete_project(Integer.parseInt(delete_project_id));

		logger.info("result = " + result);
		if (result.equals("성공"))
			jObject.put("messages", "success");
		else {
			jObject.put("messages", result);
		}

		return jObject.toString();
	}
}
