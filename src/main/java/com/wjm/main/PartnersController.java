package com.wjm.main;

import java.text.ParseException;
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
import com.wjm.dao.AssessmentDao;
import com.wjm.dao.CareerDao;
import com.wjm.dao.EducationDao;
import com.wjm.dao.LicenseDao;
import com.wjm.dao.PortfolioDao;
import com.wjm.dao.TechniqueDao;
import com.wjm.main.function.Validator;
import com.wjm.models.AccountInfo;
import com.wjm.models.AccountInformationInfo;
import com.wjm.models.CareerInfo;
import com.wjm.models.EducationInfo;
import com.wjm.models.LicenseInfo;
import com.wjm.models.TechniqueInfo;

import net.sf.json.JSONObject;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PartnersController {
	
	private static final Logger logger = LoggerFactory.getLogger(PartnersController.class);

	private static final boolean Available = false;
	

	@Autowired
	private AccountDao accountDao;

	@Autowired
	private AccountInformationDao accountInformationDao;
	
	@Autowired
	private PortfolioDao portfolioDao;

	@Autowired
	private TechniqueDao techniqueDao;

	@Autowired
	private CareerDao careerDao;

	@Autowired
	private EducationDao educationDao;

	@Autowired
	private LicenseDao licenseDao;

	@Autowired
	private AssessmentDao assessmentDao;
	
	public String isSame(AccountInfo account, AccountInfo this_account)
	{
		if(account == null)
			return null;
		else
		{
			if(account.getPk() == this_account.getPk())
			{
				logger.info("isSame");
				return "true";
			}
			else
				return null;
		}	
	}
	/**
	 * 내 프로필 보기
	 */
	@RequestMapping(value = "/partners/p/{id}", method = RequestMethod.GET)
	public ModelAndView PartnersController_p(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id} Page");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);
		
		if(this_account == null)
		{
			mv.setViewName("/error");
			return mv;
		}
		
		mv.addObject("isSame",isSame(account, this_account));

		AccountInformationInfo this_accountinfo = accountInformationDao.select(this_account.getPk());
		mv.addObject("this_accountinfo",this_accountinfo);

		//자기소개 값
		if(Validator.hasValue(this_accountinfo.getIntroduction()))
			mv.addObject("introduction",this_accountinfo.getIntroduction());
		
		//보유 기술
		List<TechniqueInfo> skill = techniqueDao.select(this_account.getPk());
		
		mv.addObject("skill",skill);
		
		mv.addObject("this_account",this_account);
		mv.setViewName("/partners/p");

		
		return mv;
	}
	/**
	 * 자기소개 보기
	 */
	@RequestMapping(value = "/partners/p/{id}/introduction", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_introduction(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/introduction Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);
				
		if(this_account == null)
		{
			mv.setViewName("/partners");
			return mv;
		}
		
		String isSame = isSame(account, this_account);

		//url 아이디의 account 가져옴
		AccountInformationInfo this_accountinfo = accountInformationDao.select(this_account.getPk());
		mv.addObject("this_accountinfo",this_accountinfo);

		//자기소개 값이 존재한다면
		if(Validator.hasValue(this_accountinfo.getIntroduction()))
			{
			logger.info("introduction = "+this_accountinfo.getIntroduction());
			mv.addObject("introduction",this_accountinfo.getIntroduction());
			}
		
		mv.addObject("this_account",this_account);

		mv.addObject("isSame",isSame(account, this_account));
		mv.setViewName("/partners/p/introduction");

		
		return mv;
	}
	
	/**
	 * 자기소개 정보 관리
	 */
	@RequestMapping(value = "/partners/p/{id}/introduction/update", method = RequestMethod.GET)
	public ModelAndView PartnersController_introductionupdate(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/introduction/update Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);
				
		if(this_account == null)
		{
			mv.setViewName("redirect:/partners/");
			return mv;
		}
		
		String isSame = isSame(account, this_account);
		
		//자기 자신이 아닌데 업데이트에 접근하는 경우
		if(isSame == null)
		{
			mv.setViewName("redirect:/partners/p/"+id+"/introduction");
			return mv;
		}
		
		AccountInformationInfo this_accountinfo = accountInformationDao.select(this_account.getPk());
		
		
		if(Validator.hasValue(this_accountinfo.getIntroduction()))
			{
			logger.info("introduction = "+this_accountinfo.getIntroduction());
			mv.addObject("introduction",this_accountinfo.getIntroduction());
			}
		
		mv.setViewName("/partners/p/introduction/update");

		
		return mv;
	}

	/**
	 * 자기소개 정보 추가
	 */
	@RequestMapping(value = "/partners/p/{id}/introduction/update/add", method = RequestMethod.GET)
	public ModelAndView PartnersController_introductionupdateadd(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/introduction/update/add Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);
				
		if(this_account == null)
		{
			mv.setViewName("/partners");
			return mv;
		}
		
		String isSame = isSame(account, this_account);
		
		//자기 자신이 아닌데 업데이트에 접근하는 경우
		if(isSame == null)
		{
			mv.setViewName("redirect:/partners/p/"+id+"/");
			return mv;
		}
		
		AccountInformationInfo this_accountinfo = accountInformationDao.select(this_account.getPk());
		
		
		if(Validator.hasValue(this_accountinfo.getIntroduction()))
			{
			logger.info("introduction = "+this_accountinfo.getIntroduction());
			mv.addObject("introduction",this_accountinfo.getIntroduction());
			}
		
		mv.setViewName("/partners/p/introduction/update/add");

		return mv;
	}
	/**
	 * 자기소개 정보 추가
	 */
	@RequestMapping(value = "/partners/p/{id}/introduction/update/add", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String PartnersController_introductionupdateadd_post(HttpServletRequest request, 
 			HttpServletResponse response,
			@PathVariable("id") String id,
			@RequestParam("description") String introduction) {
		logger.info("/partners/p/{id}/introduction/update/add POST! Page");
	    JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);
				
		if(this_account == null)
		{
			jObject.put("messages","잘못된 URL 입니다.");
			logger.info("jobject = "+jObject.toString());
			return jObject.toString();		}
		
		String isSame = isSame(account, this_account);
		
		//자기 자신이 아닌데 접근하는 경우
		if(isSame == null)
		{
			jObject.put("messages","잘못된 접근 입니다.");
			logger.info("jobject = "+jObject.toString());
			return jObject.toString();	
		}
		
		if(Validator.hasValue(introduction))
		{
			if(Validator.isValidLength(introduction, 1, 5000))
			{
				accountInformationDao.updateIntroduction(account.getPk(), introduction);
				jObject.put("messages","success");
				logger.info("jobject = "+jObject.toString());
				return jObject.toString();
			}
		}
		
		jObject.put("messages","자기소개를 정상적으로 입력해주세요.");
		logger.info("jobject = "+jObject.toString());
		return jObject.toString();
	}
	
	
	
	/**
	 * 포트폴리오 보기
	 */
	@RequestMapping(value = "/partners/p/{id}/portfolio", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_portfolio(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("index Page");
		
		mv.setViewName("/partners/p/{id}/portfolio");

		return mv;
	}
	
	/**
	 * 포트폴리오 보기
	 */
	@RequestMapping(value = "/partners/p/{id}/portfolio/update", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_portfolio_update(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/portfolio/update Page");
		
		mv.setViewName("/partners/p/{id}/portfolio/update");

		return mv;
	}

	
	/**
	 * 포트폴리오 추가
	 */
	@RequestMapping(value = "/partners/p/{id}/portfolio/update/add", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_portfolioadd(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("index Page");
		
		mv.setViewName("/partners/p/{id}/portfolio/update/add");

		return mv;
	}
	
	/**
	 * 보유기술 보기
	 */
	@RequestMapping(value = "/partners/p/{id}/skill", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_skill(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/skill Page");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);
		
		if(this_account == null)
		{
			mv.setViewName("/partners");
			return mv;
		}
		mv.addObject("this_account",this_account);
		
		AccountInformationInfo this_accountinfo = accountInformationDao.select(this_account.getPk());
		mv.addObject("this_accountinfo",this_accountinfo);
		
		String isSame = isSame(account, this_account);
		mv.addObject("isSame",isSame);

		List<TechniqueInfo> skill = techniqueDao.select(this_account.getPk());
		mv.addObject("skill",skill);
		
		
		mv.setViewName("/partners/p/skill");

		return mv;
	}


	/**
	 * 보유기술 관리
	 */
	@RequestMapping(value = "/partners/p/{id}/skill/update", method = RequestMethod.GET)
	public ModelAndView PartnersController_skillpdate(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/skill/update Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);
				
		if(this_account == null)
		{
			mv.setViewName("redirect:/partners/");
			return mv;
		}
		
		mv.addObject("this_account",this_account);
		String isSame = isSame(account, this_account);
		mv.addObject("isSame",isSame);

		//자기 자신이 아닌데 업데이트에 접근하는 경우
		if(isSame == null)
		{
			mv.setViewName("redirect:/partners/p/"+id+"/skill");
			return mv;
		}
		

		List<TechniqueInfo> skill = techniqueDao.select(account.getPk());
		mv.addObject("skill",skill);
		
		mv.setViewName("/partners/p/skill/update");
		return mv;
		
	}
	

	/**
	 * 보유기술 추가
	 */
	@RequestMapping(value = "/partners/p/{id}/skill/update/add", method = RequestMethod.GET)
	public ModelAndView PartnersController_skillupdateadd(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/skill/update/add Page");
		

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);
				
		if(this_account == null)
		{
			mv.setViewName("redirect:/partners/");
			return mv;
		}
		mv.addObject("this_account",this_account);
		
		String isSame = isSame(account, this_account);
		mv.addObject("isSame",isSame);

		//자기 자신이 아닌데 업데이트에 접근하는 경우
		if(isSame == null)
		{
			mv.setViewName("redirect:/partners/p/"+id+"/");
			return mv;
		}
		
		mv.setViewName("partners/p/skill/update/add");
		
		return mv;
	}
	


	/**
	 * 보유기술 추가
	 */
	@RequestMapping(value = "/partners/p/{id}/skill/update/add", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String  PartnersController_skillupdateadd_post(HttpServletRequest request,
			HttpServletResponse response,
			@PathVariable("id") String id,
			@RequestParam("title") String title,
			@RequestParam("experience") String experience,
			@RequestParam("rating") String rating) {
		
		logger.info("/partners/p/{id}/skill/update/add Post Page");
		logger.info("id = "+id);
		logger.info("title = "+title);
		logger.info("experience = "+experience);
		logger.info("rating = "+rating);
		JSONObject jObject = new JSONObject();
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);
				
		if(this_account == null)
		{
			jObject.put("messages", "error");
			logger.info("jobject = "+jObject.toString());
			return jObject.toString();
		}
		
		String isSame = isSame(account, this_account);

		//자기 자신이 아닌데 업데이트에 접근하는 경우
		if(isSame == null)
		{
			jObject.put("messages", "error");
			logger.info("jobject = "+jObject.toString());
			return jObject.toString();
		}
		
		String result = techniqueDao.createSkill(this_account.getPk(),title,experience, rating);
		
		logger.info("result = "+result);
		if(result.equals("성공"))
			jObject.put("messages", "success");
		else
		{
			jObject.put("messages",result);
		}
		
		return jObject.toString();
	}


	/**
	 * 보유기술 수정
	 */
	@RequestMapping(value = "/partners/p/{id}/skill/update/edit/{skill_pk}", method = RequestMethod.GET)
	public ModelAndView PartnersController_skillupdateedit(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id,
			@PathVariable("skill_pk") String skill_pk) {
		logger.info("/partners/p/{id}/skill/update/edit Page");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);
				
		if(this_account == null)
		{
			mv.setViewName("redirect:/partners/");
			return mv;
		}
		mv.addObject("this_account",this_account);
		
		String isSame = isSame(account, this_account);
		mv.addObject("isSame",isSame);

		//자기 자신이 아닌데 업데이트에 접근하는 경우
		if(isSame == null)
		{
			mv.setViewName("redirect:/partners/p/"+id+"/");
			return mv;
		}
		
		//skill_pk가 숫자가 아니라면 반환
		if(!Validator.isDigit(skill_pk))
		{			
			mv.setViewName("redirect:/partners/p/"+id+"/");
			return mv;
		}
		
		TechniqueInfo skill = techniqueDao.select_skill(Integer.parseInt(skill_pk));
		mv.addObject("skill", skill);
		mv.setViewName("partners/p/skill/update/edit");
		
		return mv;
	}
	
	/**
	 * 보유기술 수정
	 */
	@RequestMapping(value = "/partners/p/{id}/skill/update/edit/{skill_pk}", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String  PartnersController_skillupdateedit_post(HttpServletRequest request,
			HttpServletResponse response,
			@PathVariable("id") String id,
			@PathVariable("skill_pk") String skill_pk,
			@RequestParam("title") String title,
			@RequestParam("experience") String experience,
			@RequestParam("rating") String rating) {
		
		logger.info("/partners/p/{id}/skill/update/edit Post Page");
		logger.info("id = "+id);
		logger.info("skill_pk = "+skill_pk);
		logger.info("title = "+title);
		logger.info("experience = "+experience);
		logger.info("rating = "+rating);
		
		JSONObject jObject = new JSONObject();
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);
				
		if(this_account == null)
		{
			jObject.put("messages", "error");
			logger.info("jobject = "+jObject.toString());
			return jObject.toString();
		}
		
		String isSame = isSame(account, this_account);

		//자기 자신이 아닌데 업데이트에 접근하는 경우
		if(isSame == null)
		{
			jObject.put("messages", "error");
			logger.info("jobject = "+jObject.toString());
			return jObject.toString();
		}
		
		if(!Validator.isDigit(skill_pk))
		{
			jObject.put("messages", "error");
			logger.info("jobject = "+jObject.toString());
			return jObject.toString();
		}
		
		String result = techniqueDao.updateSkill(Integer.parseInt(skill_pk),title,experience, rating);
		
		logger.info("result = "+result);
		if(result.equals("성공"))
			jObject.put("messages", "success");
		else
		{
			jObject.put("messages",result);
		}
		
		return jObject.toString();
	}
	
	/**
	 * 보유기술 삭제
	 */
	@RequestMapping(value = "/partners/p/{id}/skill/update/delete_", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String  PartnersController_skillupdateedit_post(HttpServletRequest request,
			HttpServletResponse response,
			@PathVariable("id") String id,
			@RequestParam("delete_skill_id") String skill_pk) {
		
		logger.info("/partners/p/{id}/skill/update/delete_ Post Page");
		logger.info("id = "+id);
		logger.info("delete_skill_id = "+skill_pk);
		
		JSONObject jObject = new JSONObject();
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);
				
		if(this_account == null)
		{
			jObject.put("messages", "error");
			logger.info("jobject = "+jObject.toString());
			return jObject.toString();
		}
		
		String isSame = isSame(account, this_account);

		//자기 자신이 아닌데 업데이트에 접근하는 경우
		if(isSame == null)
		{
			jObject.put("messages", "error");
			logger.info("jobject = "+jObject.toString());
			return jObject.toString();
		}
		
		if(!Validator.isDigit(skill_pk))
		{
			jObject.put("messages", "error");
			logger.info("jobject = "+jObject.toString());
			return jObject.toString();
		}
		
		String result = techniqueDao.delete(Integer.parseInt(skill_pk));
		
		logger.info("result = "+result);
		if(result.equals("성공"))
			jObject.put("messages", "success");
		else
		{
			jObject.put("messages",result);
		}
		
		return jObject.toString();
	}
	
	/**
	 * 대표 기술 설정
	 */
	@RequestMapping(value = "/partners/p/{id}/skill/update/represent", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String  PartnersController_skillupdaterepresent_post(HttpServletRequest request,
			HttpServletResponse response,
			@PathVariable("id") String id,
			@RequestParam("p5-skill-check") String[] pk_list) {
		
		logger.info("/partners/p/{id}/skill/update/represent Post Page");
		logger.info("id = "+id);
		
		for(int i=0;i<pk_list.length;i++)
			logger.info("pk = "+pk_list[i]);
		
		JSONObject jObject = new JSONObject();
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);
				
		if(this_account == null)
		{
			jObject.put("messages", "error");
			logger.info("jobject = "+jObject.toString());
			return jObject.toString();
		}
		
		String isSame = isSame(account, this_account);

		//자기 자신이 아닌데 업데이트에 접근하는 경우
		if(isSame == null)
		{
			jObject.put("messages", "error");
			logger.info("jobject = "+jObject.toString());
			return jObject.toString();
		}
		
		
		String result = techniqueDao.updateRepresentative(this_account.getPk(), pk_list);
		
		logger.info("result = "+result);
		if(result.equals("성공"))
			jObject.put("messages", "success");
		else
		{
			jObject.put("messages",result);
		}
		
		return jObject.toString();
	}
	
	/**
	 * 경력, 학력, 자격증 보기
	 */
	@RequestMapping(value = "/partners/p/{id}/background", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_background(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("index Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);
		
		if(this_account == null)
		{
			mv.setViewName("/partners");
			return mv;
		}
		mv.addObject("this_account",this_account);
		
		AccountInformationInfo this_accountinfo = accountInformationDao.select(this_account.getPk());
		mv.addObject("this_accountinfo",this_accountinfo);
		
		String isSame = isSame(account, this_account);
		mv.addObject("isSame",isSame);

		List<CareerInfo> career = careerDao.select(this_account.getPk());
		List<EducationInfo> education = educationDao.select(this_account.getPk());
		List<LicenseInfo> license = licenseDao.select(this_account.getPk());		
		
		mv.addObject("career",career);
		mv.addObject("education",education);
		mv.addObject("license",license);
		
		mv.setViewName("/partners/p/background");
		
		return mv;
	}
	

	/**
	 * 경력, 학력, 자격 정보 관리
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update", method = RequestMethod.GET)
	public ModelAndView PartnersController_backgroundupdate(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/background/update Page");
		

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);
				
		if(this_account == null)
		{
			mv.setViewName("redirect:/partners/");
			return mv;
		}
		mv.addObject("this_account",this_account);

		String isSame = isSame(account, this_account);
		
		//자기 자신이 아닌데 업데이트에 접근하는 경우
		if(isSame == null)
		{
			mv.setViewName("redirect:/partners/p/"+id+"/");
			return mv;
		}
		
		List<CareerInfo> career = careerDao.select(this_account.getPk());
		List<EducationInfo> education = educationDao.select(this_account.getPk());
		List<LicenseInfo> license = licenseDao.select(this_account.getPk());		
		
		mv.addObject("career",career);
		mv.addObject("education",education);
		mv.addObject("license",license);
		
		mv.setViewName("/partners/p/background/update");

		
		return mv;
	}

	/**
	 * 경력 정보 추가
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update/add/employ", method = RequestMethod.GET)
	public ModelAndView PartnersController_backgroundupdateaddemploy(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/info/update/add/employ Page");
		

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);
				
		if(this_account == null)
		{
			mv.setViewName("redirect:/partners/");
			return mv;
		}
		mv.addObject("this_account",this_account);
		
		String isSame = isSame(account, this_account);
		mv.addObject("isSame",isSame);

		//자기 자신이 아닌데 업데이트에 접근하는 경우
		if(isSame == null)
		{
			mv.setViewName("redirect:/partners/p/"+id+"/");
			return mv;
		}
		
		mv.setViewName("/partners/p/background/update/add/employ");
		
		return mv;
	}
	

	/**
	 * 경력 정보 추가 처리
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update/add/employ", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String PartnersController_backgroundupdateaddemploy_post(HttpServletRequest request, 
			HttpServletResponse response,
			@PathVariable("id") String id,
			@RequestParam("company_name") String company_name,
			@RequestParam("division") String division,
			@RequestParam("position") String position,
			@RequestParam("date_hired_year") String date_hired_year,
			@RequestParam("date_hired_month") String date_hired_month,
			@RequestParam("date_retired_year") String date_retired_year,
			@RequestParam("date_retired_month") String date_retired_month) {
		
		logger.info("/partners/p/{id}/info/update/add/employ Page");
		
		logger.info("id = "+id);
		logger.info("company_name = "+company_name);
		logger.info("division = "+division);
		logger.info("position = "+position);
		logger.info("date_hired_year = "+date_hired_year);
		logger.info("date_hired_month = "+date_hired_month);
		logger.info("date_retired_year = "+date_retired_year);
		logger.info("date_retired_month = "+date_retired_month);
		JSONObject jObject = new JSONObject();
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);
				
		if(this_account == null)
		{
			jObject.put("messages", "error");
			logger.info("jobject = "+jObject.toString());
			return jObject.toString();
		}

		String isSame = isSame(account, this_account);

		//자기 자신이 아닌데 업데이트에 접근하는 경우
		if(isSame == null)
		{
			jObject.put("messages", "error");
			logger.info("jobject = "+jObject.toString());
			return jObject.toString();
		}

		String result;
		try{
		result = careerDao.createCareer(this_account.getPk(),company_name,division,position,
				date_hired_year,date_hired_month,date_retired_year,date_retired_month);
		}
		catch(ParseException e)
		{
			logger.info(e.toString());
			jObject.put("messages", "error");
			logger.info("jobject = "+jObject.toString());
			return jObject.toString();
		}
		logger.info("result = "+result);
		if(result.equals("성공"))
			jObject.put("messages", "success");
		else
		{
			jObject.put("messages",result);
		}
		
		return jObject.toString();
	}
	

	/**
	 * 경력 정보 수정
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update/edit/employ/{pk}", method = RequestMethod.GET)
	public ModelAndView PartnersController_backgroundupdateeditemploy(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id,
			@PathVariable("pk") String pk) {
		logger.info("/partners/p/{id}/info/update/edit/employ Page");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);
				
		if(this_account == null)
		{
			mv.setViewName("redirect:/partners/");
			return mv;
		}
		mv.addObject("this_account",this_account);
		
		String isSame = isSame(account, this_account);
		mv.addObject("isSame",isSame);

		//자기 자신이 아닌데 업데이트에 접근하는 경우
		if(isSame == null)
		{
			mv.setViewName("redirect:/partners/p/"+id+"/");
			return mv;
		}
		
		//pk가 숫자가 아니라면 반환
		if(!Validator.isDigit(pk))
		{			
			mv.setViewName("redirect:/partners/p/"+id+"/");
			return mv;
		}
		
		CareerInfo career = careerDao.select_career(Integer.parseInt(pk));
		
		if(career == null)
		{
			mv.setViewName("redirect:/partners/p/"+id+"/");
			return mv;
		}
		
		mv.addObject("career",career);
		
		mv.setViewName("/partners/p/background/update/edit/employ");
		
		return mv;
	}

	/**
	 * 경력 정보 수정 처리
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update/edit/employ/{pk}", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String PartnersController_backgroundupdateeditemploy_post(HttpServletRequest request,
			HttpServletResponse response,
			@PathVariable("id") String id,
			@PathVariable("pk") String pk,
			@RequestParam("company_name") String company_name,
			@RequestParam("division") String division,
			@RequestParam("position") String position,
			@RequestParam("date_hired_year") String date_hired_year,
			@RequestParam("date_hired_month") String date_hired_month,
			@RequestParam("date_retired_year") String date_retired_year,
			@RequestParam("date_retired_month") String date_retired_month) {
		
		logger.info("/partners/p/{id}/info/update/edit/employ post Page");

		logger.info("id = "+id);
		logger.info("company_name = "+company_name);
		logger.info("division = "+division);
		logger.info("position = "+position);
		logger.info("date_hired_year = "+date_hired_year);
		logger.info("date_hired_month = "+date_hired_month);
		logger.info("date_retired_year = "+date_retired_year);
		logger.info("date_retired_month = "+date_retired_month);
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);
		
		JSONObject jObject = new JSONObject();
		
		if(this_account == null)
		{
			jObject.put("messages", "error");
			logger.info("jobject = "+jObject.toString());
			return jObject.toString();
		}
		
		String isSame = isSame(account, this_account);

		//자기 자신이 아닌데 업데이트에 접근하는 경우
		if(isSame == null)
		{
			jObject.put("messages", "error");
			logger.info("jobject = "+jObject.toString());
			return jObject.toString();
		}
		
		//pk가 숫자가 아니라면 반환
		if(!Validator.isDigit(pk))
		{			
			jObject.put("messages", "error");
			logger.info("jobject = "+jObject.toString());
			return jObject.toString();
		}
		
		String result;
		try{
		result = careerDao.updateCareer(Integer.parseInt(pk),company_name,division,position,
				date_hired_year,date_hired_month,date_retired_year,date_retired_month);
		}
		catch(ParseException e)
		{
			jObject.put("messages", "error");
			logger.info("jobject = "+jObject.toString());
			return jObject.toString();
		}

		logger.info("result = "+result);
		if(result.equals("성공"))
			jObject.put("messages", "success");
		else
		{
			jObject.put("messages",result);
		}
		
		return jObject.toString();
	}
	/**
	 * 자격증 정보 추가
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update/add/certify", method = RequestMethod.GET)
	public ModelAndView PartnersController_backgroundupdateaddcertify(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/info/update/add/certify Page");
		

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);
				
		if(this_account == null)
		{
			mv.setViewName("redirect:/partners/");
			return mv;
		}
		mv.addObject("this_account",this_account);
		
		String isSame = isSame(account, this_account);
		mv.addObject("isSame",isSame);

		//자기 자신이 아닌데 업데이트에 접근하는 경우
		if(isSame == null)
		{
			mv.setViewName("redirect:/partners/p/"+id+"/");
			return mv;
		}
		
		mv.setViewName("/partners/p/background/update/add/certify");

		return mv;
	}
	/**
	 * 학력 정보 추가
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update/add/edu", method = RequestMethod.GET)
	public ModelAndView PartnersController_backgroundupdateaddedu(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/info/update/add/edu Page");


		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);
				
		if(this_account == null)
		{
			mv.setViewName("redirect:/partners/");
			return mv;
		}
		mv.addObject("this_account",this_account);
		
		String isSame = isSame(account, this_account);
		mv.addObject("isSame",isSame);

		//자기 자신이 아닌데 업데이트에 접근하는 경우
		if(isSame == null)
		{
			mv.setViewName("redirect:/partners/p/"+id+"/");
			return mv;
		}
		
		mv.setViewName("/partners/p/background/update/add/edu");

		
		return mv;
	}
	
	/**
	 * 평가 보기
	 */
	@RequestMapping(value = "/partners/p/{id}/evaluation", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_evaluation(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("index Page");
		

		mv.setViewName("/partners/p/evaluation");
		
		return mv;
	}
	
	/**
	 * history 보기
	 */
	@RequestMapping(value = "/partners/p/{id}/history", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_history(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("index Page");
		
		
		
		mv.setViewName("/partners/p/history");

		
		return mv;
	}
	
	
	/**
	 * 프로필 정보 관리
	 */
	@RequestMapping(value = "/partners/p/{id}/info/update", method = RequestMethod.GET)
	public ModelAndView PartnersController_infoupdate(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/info/update Page");
		
		
		return mv;
	}

	/**
	 * 프로필 정보 추가
	 */
	@RequestMapping(value = "/partners/p/{id}/info/update/add", method = RequestMethod.GET)
	public ModelAndView PartnersController_infoupdateadd(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/info/update/add Page");
		
		mv.setViewName("/partners/p/info/update/add/");
		return mv;
	}

	/**
	 * 프로젝트 히스토리 관리
	 */
	@RequestMapping(value = "/partners/p/{id}/evaluation/update", method = RequestMethod.GET)
	public ModelAndView PartnersController_evaluationupdate(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/evaluation/update Page");
		
		
		return mv;
	}
	///////////////////////////////////////////////////////////////////////////////////
	//파트너스 포르젝트 관리
	////////////////////////////////////////////////////////////////////////////////////
	/**
	 * 관심 프로젝트
	 */
	@RequestMapping(value = "/partners/manage/interest", method = RequestMethod.GET)
	public ModelAndView PartnersController_manage_interest(HttpServletRequest request
			, ModelAndView mv) {
		logger.info("/partners/manage/interest Page");
		
		
		return mv;
	}

	/**
	 * 지원 내역(지원 중)
	 */
	@RequestMapping(value = "/partners/manage/proposal/counselling", method = RequestMethod.GET)
	public ModelAndView PartnersController_manage_proposalcounselling(HttpServletRequest request
			, ModelAndView mv) {
		logger.info("/partners/manage/proposal/counselling Page");
		
		
		return mv;
	}
	/**
	 * 지원 내역(지원 종료)
	 */
	@RequestMapping(value = "/partners/manage/proposal/end-counselling", method = RequestMethod.GET)
	public ModelAndView PartnersController_manage_proposalendcounselling(HttpServletRequest request
			, ModelAndView mv) {
		logger.info("/partners/manage/proposal/end-counselling Page");
		
		
		return mv;
	}
	
	/**
	 * 진행중인 프로젝트 내역
	 */
	@RequestMapping(value = "/partners/manage/contract-in-progress", method = RequestMethod.GET)
	public ModelAndView PartnersController_manage_contractinprogress(HttpServletRequest request
			, ModelAndView mv) {
		logger.info("/partners/manage/contract-in-progress Page");
		
		
		return mv;
	}
	
	/**
	 * 완료한 프로젝트 내역(평가 대기중)
	 */
	@RequestMapping(value = "/partners/manage/past/review-contract", method = RequestMethod.GET)
	public ModelAndView PartnersController_manage_reviewcontract(HttpServletRequest request
			, ModelAndView mv) {
		logger.info("/partners/manage/past/review-contract Page");
		
		
		return mv;
	}
	
	
	/**
	 * 완료한 프로젝트 내역(완료한 프로젝트)
	 */
	@RequestMapping(value = "/partners/manage/past/completed-contract", method = RequestMethod.GET)
	public ModelAndView PartnersController_manage_completedcontract(HttpServletRequest request
			, ModelAndView mv) {
		logger.info("/partners/manage/past/completed-contract Page");
		
		
		return mv;
	}
	
	
}
