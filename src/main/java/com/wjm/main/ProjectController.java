package com.wjm.main;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wjm.dao.AccountDao;
import com.wjm.dao.AccountInformationDao;
import com.wjm.dao.ProjectDao;
import com.wjm.models.AccountInfo;

import net.sf.json.JSONObject;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProjectController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	   
	@Autowired
	private ProjectDao projectDao;
	@Autowired
	private AccountDao accountDao;

	@Autowired
	private AccountInformationDao accountInformationDao;
	/**
	 * 프로젝트 추가
	 */
	@RequestMapping(value = "/project/add", method = RequestMethod.GET)
	public String ProjectController_project_add(HttpServletRequest request) {
		logger.info("project add Page");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		
		//기본 정보가 있는 경우, 프로젝트 등록 페이지로
		if(accountInformationDao.hasBasicInfo(account.getPk()))
			return "redirect:/project/add/detail";
		//기본 정보가 없는 경우, 기본정보 등록 페이지로
		else
			return "redirect:/project/add/contact";
	}
	/**
	 * 프로젝트 추가위한 기본정보 페이지
	 */
	@RequestMapping(value = "/project/add/contact", method = RequestMethod.GET)
	public String ProjectController_add_contact(HttpServletRequest request) {
		logger.info("기본 정보 추가 페이지");
				
		return "/project/add/contact";
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
			 @RequestParam("company_name") String company_name,
			 @RequestParam("company_representative") String company_representative,
			 @RequestParam("introduction") String introduction
			 ) {
		logger.info("기본 정보 추가 처리");

		logger.info("name = "+name);
		logger.info("cellphone_num_code = "+cellphone_num_code);
		logger.info("cellphone_num_middle = "+cellphone_num_middle);
		logger.info("cellphone_num_end = "+cellphone_num_end);
		logger.info("form = "+form);
		logger.info("company_name = "+company_name);
		logger.info("company_representative = "+company_representative);
		logger.info("introduction = "+introduction);
		
		
		
		//모델앤뷰 생성
		ModelAndView mv = new ModelAndView();
		String return_val = "redirect:/project/add/contact";
		mv.setViewName(return_val);
		
		
		//이름
		if(name == null)
		{
			mv.addObject("name_msg","이름을 입력해주세요");
			return mv;
		}
		else if(name.length()>20)
		{
			mv.addObject("name_msg","이름은 20글자 이하로 입력해주세요.");
			return mv;
		}
		
		//핸드폰번호
		if(!isPhoneCode(cellphone_num_code)||!isDigit(cellphone_num_middle)||!isDigit(cellphone_num_end))
		{
			mv.addObject("cellphone_num_msg","핸드폰번호를 올바르게 선택해주세요.");
		}
		else if(cellphone_num_middle.length()>10 || cellphone_num_end.length()>10)
		{
			mv.addObject("cellphone_num_msg","핸드폰번호를 올바르게 입력해주세요.");
		}
		
		//회사 형태
		if(!isCompanyForm(form))
		{
			mv.addObject("form_msg","회사형태를 올바르게 선택해주세요");
			return mv;
		}
		//회사명
		if(company_name == null)
		{
			mv.addObject("company_name_msg","회사명을 입력해주세요");
			return mv;
		}
		else if(company_name.length()>20)
		{
			mv.addObject("company_name_msg","회사명은 20글자 이하로 입력해주세요.");
			return mv;
		}
		//대표명
		if(company_representative == null)
		{
			mv.addObject("company_representative_msg","대표명을 입력해주세요");
			return mv;
		}
		else if(company_representative.length()>20)
		{
			mv.addObject("company_representative_msg","대표명은 20글자 이하로 입력해주세요.");
			return mv;
		}
		//회사소개
		if(introduction == null)
		{
			mv.addObject("name_msg","회사소개를 입력해주세요");
			return mv;
		}
		else if(name.length()>150)
		{
			mv.addObject("name_msg","회사소개는 150글자 이하로 입력해주세요.");
			return mv;
		}
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		
		//사용자 계정 존재시
		if(account != null)
		{
			String cellphone_num = cellphone_num_code + cellphone_num_middle + cellphone_num_end;
			accountInformationDao.updateBasicInfo(account.getPk(), company_name, cellphone_num, form, company_name, company_representative, introduction);
			mv.setViewName("redirect:/project/add/detail");
		}
		return mv;
	}
	/**
	 * 프로젝트 추가 페이지
	 */
	@RequestMapping(value = "/project/add/detail", method = RequestMethod.GET)
	public String ProjectController_add_detail(HttpServletRequest request) {
		logger.info("add detail Page");
		
		
		
		return "/project/add/detail";
	}
	/**
	 * 프로젝트 추가 안내
	 */
	@RequestMapping(value = "/project/add/thank-you", method = RequestMethod.GET)
	public String ProjectController_add_thankyou(HttpServletRequest request) {
		logger.info("add thankyou Page");
		
		
		
		return "redirect:/project/add/thank-you";
	}
	/**
	 * 프로젝트 질문답변
	 */
	@RequestMapping(value = "/project/faq", method = RequestMethod.GET)
	public String ProjectController_faq(HttpServletRequest request) {
		logger.info("add faq Page");
		
		
		
		return "redirect:/project/faq";
	}
	/**
	 * 프로젝트 추가
	 */
	@RequestMapping(value = "/project/preview", method = RequestMethod.GET)
	public String ProjectController_preview(HttpServletRequest request) {
		logger.info("project preview Page");
		
		
		
		return "redirect:/project/preview";
	}
	
	public boolean isPhoneCode(String code)
	{
		if(code.equals("010"))
			return true;
		else if(code.equals("011"))
			return true;
		else if(code.equals("016"))
			return true;
		else if(code.equals("017"))
			return true;
		else if(code.equals("019"))
			return true;
		else
			return false;
		
	}
	/*
	1. individual
	2. team
	3. individual_business
	4. corporate_business
	*/
	public boolean isCompanyForm(String form)
	{
		if(form.equals("individual"))
			return true;
		else if(form.equals("team"))
			return true;
		else if(form.equals("individual_business"))
			return true;
		else if(form.equals("corporate_business"))
			return true;
		else
			return false;
		
	}
	public boolean isDigit(String digit)
	{
		if(digit == null) return false;

		boolean result = Pattern.matches("^[0-9]+$",digit.trim());
		
		return result;

	}
	
	//중분류 리스트
	@RequestMapping(value = "/getCategoryM", method = RequestMethod.POST, produces="applicateion/json;charset=UTF-8")
	@ResponseBody
	public String ProjectController_getCategoryM(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("categoryL") String categoryL) {
		logger.info("getCategoryM AJAX");

		JSONObject jObject = new JSONObject();
		List<String> categoryMlist = new ArrayList<String>();

		if(categoryL.equals("develop"))
		{
			categoryMlist.add("웹");
			categoryMlist.add("애플리케이션");
			categoryMlist.add("워드프레스");
			categoryMlist.add("퍼블리싱");
			categoryMlist.add("일반소프트웨어");
			categoryMlist.add("커머스&쇼핑몰");
			categoryMlist.add("게임");
			categoryMlist.add("임베디드");
			categoryMlist.add("기타");
		}
		else if(categoryL.equals("design"))
		{
			categoryMlist.add("웹");
			categoryMlist.add("애플리케이션");
			categoryMlist.add("제품");
			categoryMlist.add("프레젠테이션");
			categoryMlist.add("인쇄물");
			categoryMlist.add("커머스&쇼핑몰");
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
}
