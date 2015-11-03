package com.wjm.main;

import java.text.ParseException;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.servlet.ModelAndView;

import com.wjm.dao.AccountDao;
import com.wjm.dao.AccountInformationDao;
import com.wjm.dao.ApplicantDao;
import com.wjm.dao.AssessmentDao;
import com.wjm.dao.CareerDao;
import com.wjm.dao.ContractDao;
import com.wjm.dao.EducationDao;
import com.wjm.dao.LicenseDao;
import com.wjm.dao.NotificationDao;
import com.wjm.dao.Partners_infoDao;
import com.wjm.dao.PortfolioDao;
import com.wjm.dao.ProjectDao;
import com.wjm.dao.TechniqueDao;
import com.wjm.main.function.Validator;
import com.wjm.models.AccountInfo;
import com.wjm.models.AccountInformationInfo;
import com.wjm.models.ApplicantInfo;
import com.wjm.models.AssessmentInfo;
import com.wjm.models.CareerInfo;
import com.wjm.models.ContractInfo;
import com.wjm.models.EducationInfo;
import com.wjm.models.LicenseInfo;
import com.wjm.models.Partners_infoInfo;
import com.wjm.models.PortfolioInfo;
import com.wjm.models.ProjectInfo;
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

	@Autowired
	private Partners_infoDao partners_infoDao;
	
	@Autowired
	private ApplicantDao applicantDao;
	@Autowired
	private ContractDao contractDao;

	@Autowired
	private ProjectDao projectDao;
	@Autowired
	private NotificationDao notificationDao;

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
	
	public boolean AccountCheck(AccountInfo account)
	{
		if(account.getAccount_type() == null)
			return false;
		else if(account.getAccount_type().equals("partners"))
			return true;
		else
			return false;
		
	}
	public String isSame(AccountInfo account, AccountInfo this_account) {
		if (account == null)
			return null;
		else {
			if (account.getPk() == this_account.getPk()) {
				logger.info("isSame");
				return "true";
			} else
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

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		
		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("redirect:/error/404error");
			return mv;
		}

		mv.addObject("isSame", isSame(account, this_account));

		//파트너스정보
		Partners_infoInfo info = partners_infoDao.select(this_account.getPk());
		mv.addObject("info",info);
		
		if(info != null)
		{
			if (Validator.hasValue(info.getJob()) && Validator.hasValue(info.getAvailability())) {
				logger.info("파트너스 정보 있음");
				mv.addObject("hasInfo", "true");
			}		
		}
		//portfolio
		List<PortfolioInfo> portfolio = portfolioDao.select(this_account.getPk());
		if(portfolio != null)
		{
			if(portfolio.size()>0)
			{
				logger.info("포트폴리오 정보 있음");

				mv.addObject("portfolio",portfolio);
				mv.addObject("hasPortfolio","true");
			}
		}
		
		//backround
		List<CareerInfo> career = careerDao.select(this_account.getPk());
		List<EducationInfo> education = educationDao.select(this_account.getPk());
		List<LicenseInfo> license = licenseDao.select(this_account.getPk());

		
		mv.addObject("career", career);
		mv.addObject("education", education);
		mv.addObject("license", license);

		
		AccountInformationInfo this_accountinfo = accountInformationDao.select(this_account.getPk());
		mv.addObject("this_accountinfo", this_accountinfo);

		// 자기소개 값
		if (Validator.hasValue(this_accountinfo.getIntroduction()))
			{
			mv.addObject("introduction", this_accountinfo.getIntroduction());
			mv.addObject("hasIntro","true");
			logger.info("자기소개 정보 있음");

			}

		// 보유 기술
		List<TechniqueInfo> skill = techniqueDao.select(this_account.getPk());

		mv.addObject("skill", skill);

		if(skill != null)
		{
			if (skill.size()>0) {
				logger.info("보유기술 정보 있음");
				mv.addObject("hasSkill", "true");
			}		
		}
		mv.addObject("this_account", this_account);
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

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		
		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("/partners");
			return mv;
		}

		String isSame = isSame(account, this_account);

		// url 아이디의 account 가져옴
		AccountInformationInfo this_accountinfo = accountInformationDao.select(this_account.getPk());
		mv.addObject("this_accountinfo", this_accountinfo);

		// 자기소개 값이 존재한다면
		if (Validator.hasValue(this_accountinfo.getIntroduction())) {
			logger.info("introduction = " + this_accountinfo.getIntroduction());
			mv.addObject("introduction", this_accountinfo.getIntroduction());
		}

		mv.addObject("this_account", this_account);

		mv.addObject("isSame", isSame(account, this_account));
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

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
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
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("redirect:/partners/");
			return mv;
		}

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			mv.setViewName("redirect:/partners/p/" + id + "/introduction");
			return mv;
		}

		AccountInformationInfo this_accountinfo = accountInformationDao.select(this_account.getPk());

		if (Validator.hasValue(this_accountinfo.getIntroduction())) {
			logger.info("introduction = " + this_accountinfo.getIntroduction());
			mv.addObject("introduction", this_accountinfo.getIntroduction());
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

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
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
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("/partners");
			return mv;
		}

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			mv.setViewName("redirect:/partners/p/" + id + "/");
			return mv;
		}

		AccountInformationInfo this_accountinfo = accountInformationDao.select(this_account.getPk());

		if (Validator.hasValue(this_accountinfo.getIntroduction())) {
			logger.info("introduction = " + this_accountinfo.getIntroduction());
			mv.addObject("introduction", this_accountinfo.getIntroduction());
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
			HttpServletResponse response, @PathVariable("id") String id,
			@RequestParam("description") String introduction) {
		logger.info("/partners/p/{id}/introduction/update/add POST! Page");
		JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			jObject.put("messages", "잘못된 URL 입니다.");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 접근하는 경우
		if (isSame == null) {
			jObject.put("messages", "잘못된 접근 입니다.");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}
		if(!AccountCheck(account))
		{
			jObject.put("messages", "잘못된 접근 입니다.");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		if (Validator.hasValue(introduction)) {
			if (Validator.isValidLength(introduction, 1, 5000)) {
				accountInformationDao.updateIntroduction(account.getPk(), introduction);
				jObject.put("messages", "success");
				logger.info("jobject = " + jObject.toString());
				return jObject.toString();
			}
		}

		jObject.put("messages", "자기소개를 정상적으로 입력해주세요.");
		logger.info("jobject = " + jObject.toString());
		return jObject.toString();
	}

	/**
	 * 포트폴리오 보기
	 */
	@RequestMapping(value = "/partners/p/{id}/portfolio", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_portfolio(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/portfolio Page");

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("/partners");
			return mv;
		}
		mv.addObject("profile",accountInformationDao.getProfileImg(this_account.getPk()));

		String isSame = isSame(account, this_account);
		mv.addObject("isSame", isSame);

		// url 아이디의 account 가져옴
		mv.addObject("this_account", this_account);
		mv.addObject("profile",accountInformationDao.getProfileImg(this_account.getPk()));

		List<PortfolioInfo> portfolio = portfolioDao.select(this_account.getPk());
		mv.addObject("portfolio", portfolio);
		mv.setViewName("/partners/p/portfolio");

		return mv;
	}

	/**
	 * 특정 포트폴리오 보기
	 */
	@RequestMapping(value = "/partners/p/{id}/portfolio/{pk}", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_portfolio(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id,
			@PathVariable("pk") String pk) {
		logger.info("/partners/p/{id}/portfolio/{pk} Page");

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("/partners");
			return mv;
		}
		mv.addObject("profile",accountInformationDao.getProfileImg(this_account.getPk()));

		String isSame = isSame(account, this_account);
		mv.addObject("isSame", isSame);

		// url 아이디의 account 가져옴
		mv.addObject("this_account", this_account);

		if(!Validator.isDigit(pk))
		{
			mv.setViewName("/partners/p/"+id+"/portfolio");
			return mv;
		}
		PortfolioInfo portfolio = portfolioDao.select_portfolio(Integer.parseInt(pk));
		mv.addObject("portfolio", portfolio);
		mv.setViewName("/partners/p/portfolio/specific/portfolio");

		return mv;
	}
	/**
	 * 포트폴리오 보기2
	 */
	@RequestMapping(value = "/partners/p/{id}/portfolio/update", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_portfolio_update(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/portfolio/update Page");

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
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
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("redirect:/partners/");
			return mv;
		}
		mv.addObject("this_account", this_account);

		String isSame = isSame(account, this_account);
		mv.addObject("isSame", isSame);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			mv.setViewName("redirect:/partners/p/"+id);
			return mv;
		}

		List<PortfolioInfo> portfolio = portfolioDao.select(this_account.getPk());
		mv.addObject("portfolio", portfolio);

		if(portfolio != null)
		{
			for (int i = 0; i < portfolio.size(); i++) {
				logger.info("portfolioname : " + portfolio.get(i).getName());
			}
		}
		mv.setViewName("/partners/p/portfolio/update");

		return mv;
	}

	/**
	 * 특정 포트폴리오 보기2
	 */
	@RequestMapping(value = "/partners/p/{id}/portfolio/{pk}/update", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_portfolio_update(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id,
			@PathVariable("pk") String pk) {
		logger.info("/partners/p/{id}/portfolio/{pk}/update Page");

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
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
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("/partners");
			return mv;
		}

		String isSame = isSame(account, this_account);
		mv.addObject("isSame", isSame);

		// url 아이디의 account 가져옴
		mv.addObject("this_account", this_account);

		if(!Validator.isDigit(pk))
		{
			mv.setViewName("/partners/p/portfolio");
			return mv;
		}
		if(isSame == null)
		{
			mv.setViewName("/partners/p/portfolio");
			return mv;
		}
		PortfolioInfo portfolio = portfolioDao.select_portfolio(Integer.parseInt(pk));
		
		if(portfolio == null)
		{
			mv.setViewName("/partners/p/portfolio");
			return mv;
		}
		mv.addObject("portfolio", portfolio);
		mv.setViewName("/partners/p/portfolio/specific/update");

		return mv;
	}
	/**
	 * 포트폴리오 추가
	 */
	@RequestMapping(value = "/partners/p/{id}/portfolio/update/add", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_portfolioadd(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/portfolio/update/add Page");

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
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
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("redirect:/partners/");
			return mv;
		}
		mv.addObject("this_account", this_account);

		String isSame = isSame(account, this_account);
		mv.addObject("isSame", isSame);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			mv.setViewName("redirect:/partners/p/portfolio");
			return mv;
		}

		mv.setViewName("/partners/p/portfolio/update/add");

		return mv;
	}

	/**
	 * 포트폴리오 추가 처리
	 */
	@RequestMapping(value = "/partners/p/{id}/portfolio/update/add", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String PartnersController_p_portfolioadd_post(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("id") String id, @RequestParam("title") String title,
			@RequestParam("categoryId") String categoryId, @RequestParam("subcategoryId") String subcategoryId,
			@RequestParam("description") String description,
			@RequestParam("participationBeginYear") String participationBeginYear,
			@RequestParam("participationBeginMonth") String participationBeginMonth,
			@RequestParam("participationEndYear") String participationEndYear,
			@RequestParam("participationEndMonth") String participationEndMonth,
			@RequestParam("participationRate") String participationRate, @RequestParam("image1") MultipartFile image1,
			@RequestParam(value = "caption1", required = false, defaultValue = "") String caption1,
			@RequestParam("image2") MultipartFile image2,
			@RequestParam(value = "caption2", required = false, defaultValue = "") String caption2,
			@RequestParam("image3") MultipartFile image3,
			@RequestParam(value = "caption3", required = false, defaultValue = "") String caption3,
			@RequestParam(value = "tagList", required = false, defaultValue = "") String tagList) {
		logger.info("/partners/p/{id}/portfolio/update/add post Page");

		logger.info("id = " + id);
		logger.info("title = " + title);
		logger.info("categoryId = " + categoryId);
		logger.info("subcategoryId = " + subcategoryId);
		logger.info("description = " + description);
		logger.info("participationBeginYear = " + participationBeginYear);
		logger.info("participationBeginMonth = " + participationBeginMonth);
		logger.info("participationEndYear = " + participationEndYear);
		logger.info("participationEndMonth = " + participationEndMonth);
		logger.info("participationRate = " + participationRate);
		logger.info("image1 getOriginalFilename : " + image1.getOriginalFilename());
		logger.info("caption1 = " + caption1);
		logger.info("image2 getOriginalFilename : " + image2.getOriginalFilename());
		logger.info("caption2 = " + caption2);
		logger.info("image3 getOriginalFilename : " + image3.getOriginalFilename());
		logger.info("caption3 = " + caption3);
		logger.info("tagList = " + tagList);

		JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		logger.info("request.getRealPath : " + request.getRealPath("") + "\\");

		String result;

		try {
			result = portfolioDao.createPortfolio(this_account.getPk(), this_account.getId(), title, categoryId, subcategoryId, description,
					participationBeginYear, participationBeginMonth, participationEndYear, participationEndMonth,
					participationRate, image1, caption1, image2, caption2, image3, caption3, tagList,
					request.getRealPath("") + "\\");
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
	 * 포트폴리오 수정
	 */
	@RequestMapping(value = "/partners/p/{id}/portfolio/{portfolio_pk}/update/edit", method = RequestMethod.GET)
	public ModelAndView PartnersController_portfolioupdateedit(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id, 
			@PathVariable("portfolio_pk") String portfolio_pk) {
		logger.info("/partners/p/{id}/portfolio/update/edit/{portfolio_pk} Page");

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("redirect:/partners/");
			return mv;
		}
		mv.addObject("this_account", this_account);

		String isSame = isSame(account, this_account);
		mv.addObject("isSame", isSame);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			mv.setViewName("redirect:/partners/p/" + id + "/");
			return mv;
		}

		// skill_pk가 숫자가 아니라면 반환
		if (!Validator.isDigit(portfolio_pk)) {
			mv.setViewName("redirect:/partners/p/" + id + "/");
			return mv;
		}

		PortfolioInfo portfolio = portfolioDao.select_portfolio(Integer.parseInt(portfolio_pk));
		mv.addObject("portfolio", portfolio);
		
		mv.setViewName("partners/p/portfolio/update/edit");

		return mv;
	}

	/**
	 * 포트폴리오 수정 처리
	 */
	@RequestMapping(value = "/partners/p/{id}/portfolio/{portfolio_pk}/update/edit", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String PartnersController_portfolioupdateedit_post(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("id") String id, 
			@PathVariable("portfolio_pk") String portfolio_pk, 
			@RequestParam("title") String title,
			@RequestParam("categoryId") String categoryId, 
			@RequestParam("subcategoryId") String subcategoryId,
			@RequestParam("description") String description,
			@RequestParam("participationBeginYear") String participationBeginYear,
			@RequestParam("participationBeginMonth") String participationBeginMonth,
			@RequestParam("participationEndYear") String participationEndYear,
			@RequestParam("participationEndMonth") String participationEndMonth,
			@RequestParam("participationRate") String participationRate, @RequestParam("image1") MultipartFile image1,
			@RequestParam(value = "caption1", required = false, defaultValue = "") String caption1,
			@RequestParam("image2") MultipartFile image2,
			@RequestParam(value = "caption2", required = false, defaultValue = "") String caption2,
			@RequestParam("image3") MultipartFile image3,
			@RequestParam(value = "caption3", required = false, defaultValue = "") String caption3,
			@RequestParam(value = "tagList", required = false, defaultValue = "") String tagList,
			@RequestParam(value = "isImage1Changed", required = false, defaultValue = "") String isImage1Changed,
			@RequestParam(value = "isImage2Changed", required = false, defaultValue = "") String isImage2Changed,
			@RequestParam(value = "isImage3Changed", required = false, defaultValue = "") String isImage3Changed
			) {

		logger.info("/partners/p/{id}/portfolio/update/edit Post Page");
		

		logger.info("id = " + id);
		logger.info("title = " + title);
		logger.info("categoryId = " + categoryId);
		logger.info("subcategoryId = " + subcategoryId);
		logger.info("description = " + description);
		logger.info("participationBeginYear = " + participationBeginYear);
		logger.info("participationBeginMonth = " + participationBeginMonth);
		logger.info("participationEndYear = " + participationEndYear);
		logger.info("participationEndMonth = " + participationEndMonth);
		logger.info("participationRate = " + participationRate);
		logger.info("image1 getOriginalFilename : " + image1.getOriginalFilename());
		logger.info("caption1 = " + caption1);
		logger.info("image2 getOriginalFilename : " + image2.getOriginalFilename());
		logger.info("caption2 = " + caption2);
		logger.info("image3 getOriginalFilename : " + image3.getOriginalFilename());
		logger.info("caption3 = " + caption3);
		logger.info("tagList = " + tagList);
		logger.info("isImage1Changed = " + isImage1Changed);
		logger.info("isImage2Changed = " + isImage2Changed);
		logger.info("isImage3Changed = " + isImage3Changed);
		
		JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		if (!Validator.isDigit(portfolio_pk)) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		logger.info("request.getRealPath : " + request.getRealPath("") + "\\");

		String result;

		try {
			result = portfolioDao.updatePortfolio(Integer.parseInt(portfolio_pk), this_account.getId(), title, categoryId, subcategoryId, description,
					participationBeginYear, participationBeginMonth, participationEndYear, participationEndMonth,
					participationRate, image1, caption1, image2, caption2, image3, caption3, tagList,
					request.getRealPath("") + "\\", isImage1Changed, isImage2Changed, isImage3Changed);
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
	 * 대표 포트폴리오 설정
	 */
	@RequestMapping(value = "/partners/p/{id}/portfolio/update/represent", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String PartnersController_portfolioupdaterepresent_post(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("id") String id, 
			@RequestParam("p5-portfolio-check") String[] pk_list) {

		logger.info("/partners/p/{id}/portfolio/update/represent Post Page");
		logger.info("id = " + id);

		for (int i = 0; i < pk_list.length; i++)
			logger.info("pk = " + pk_list[i]);

		JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String result = portfolioDao.updateRepresentative(this_account.getPk(), pk_list);

		logger.info("result = " + result);
		if (result.equals("성공"))
			jObject.put("messages", "success");
		else {
			jObject.put("messages", result);
		}

		return jObject.toString();
	}
	

	/**
	 * 포트폴리오 삭제
	 */
	@RequestMapping(value = "/partners/p/{id}/portfolio/update/delete_", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String PartnersController_portfolioupdateedit_post(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("id") String id, 
			@RequestParam("delete_portfolio_id") String portfolio_pk) {

		logger.info("/partners/p/{id}/portfolio/update/delete_ Post Page");
		logger.info("id = " + id);
		logger.info("delete_portfolio_id = " + portfolio_pk);

		JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		if (!Validator.isDigit(portfolio_pk)) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String result = portfolioDao.delete(Integer.parseInt(portfolio_pk));

		logger.info("result = " + result);
		if (result.equals("성공"))
			jObject.put("messages", "success");
		else {
			jObject.put("messages", result);
		}

		return jObject.toString();
	}

	/**
	 * 보유기술 보기
	 */
	@RequestMapping(value = "/partners/p/{id}/skill", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_skill(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/skill Page");

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("/partners");
			return mv;
		}
		mv.addObject("this_account", this_account);

		AccountInformationInfo this_accountinfo = accountInformationDao.select(this_account.getPk());
		mv.addObject("this_accountinfo", this_accountinfo);

		String isSame = isSame(account, this_account);
		mv.addObject("isSame", isSame);

		List<TechniqueInfo> skill = techniqueDao.select(this_account.getPk());
		mv.addObject("skill", skill);

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

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("redirect:/partners/");
			return mv;
		}

		mv.addObject("this_account", this_account);
		String isSame = isSame(account, this_account);
		mv.addObject("isSame", isSame);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			mv.setViewName("redirect:/partners/p/" + id + "/skill");
			return mv;
		}

		List<TechniqueInfo> skill = techniqueDao.select(account.getPk());
		mv.addObject("skill", skill);

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

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("redirect:/partners/");
			return mv;
		}
		mv.addObject("this_account", this_account);

		String isSame = isSame(account, this_account);
		mv.addObject("isSame", isSame);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			mv.setViewName("redirect:/partners/p/" + id + "/");
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
	public String PartnersController_skillupdateadd_post(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("id") String id, @RequestParam("title") String title,
			@RequestParam("experience") String experience, @RequestParam("rating") String rating) {

		logger.info("/partners/p/{id}/skill/update/add Post Page");
		logger.info("id = " + id);
		logger.info("title = " + title);
		logger.info("experience = " + experience);
		logger.info("rating = " + rating);
		JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String result = techniqueDao.createSkill(this_account.getPk(), title, experience, rating);

		logger.info("result = " + result);
		if (result.equals("성공"))
			jObject.put("messages", "success");
		else {
			jObject.put("messages", result);
		}

		return jObject.toString();
	}

	/**
	 * 보유기술 수정
	 */
	@RequestMapping(value = "/partners/p/{id}/skill/update/edit/{skill_pk}", method = RequestMethod.GET)
	public ModelAndView PartnersController_skillupdateedit(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id, @PathVariable("skill_pk") String skill_pk) {
		logger.info("/partners/p/{id}/skill/update/edit Page");

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("redirect:/partners/");
			return mv;
		}
		mv.addObject("this_account", this_account);

		String isSame = isSame(account, this_account);
		mv.addObject("isSame", isSame);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			mv.setViewName("redirect:/partners/p/" + id + "/");
			return mv;
		}

		// skill_pk가 숫자가 아니라면 반환
		if (!Validator.isDigit(skill_pk)) {
			mv.setViewName("redirect:/partners/p/" + id + "/");
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
	public String PartnersController_skillupdateedit_post(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("id") String id, @PathVariable("skill_pk") String skill_pk,
			@RequestParam("title") String title, @RequestParam("experience") String experience,
			@RequestParam("rating") String rating) {

		logger.info("/partners/p/{id}/skill/update/edit Post Page");
		logger.info("id = " + id);
		logger.info("skill_pk = " + skill_pk);
		logger.info("title = " + title);
		logger.info("experience = " + experience);
		logger.info("rating = " + rating);

		JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		if (!Validator.isDigit(skill_pk)) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String result = techniqueDao.updateSkill(Integer.parseInt(skill_pk), title, experience, rating);

		logger.info("result = " + result);
		if (result.equals("성공"))
			jObject.put("messages", "success");
		else {
			jObject.put("messages", result);
		}

		return jObject.toString();
	}

	/**
	 * 보유기술 삭제
	 */
	@RequestMapping(value = "/partners/p/{id}/skill/update/delete_", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String PartnersController_skillupdateedit_post(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("id") String id, @RequestParam("delete_skill_id") String skill_pk) {

		logger.info("/partners/p/{id}/skill/update/delete_ Post Page");
		logger.info("id = " + id);
		logger.info("delete_skill_id = " + skill_pk);

		JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		if (!Validator.isDigit(skill_pk)) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String result = techniqueDao.delete(Integer.parseInt(skill_pk));

		logger.info("result = " + result);
		if (result.equals("성공"))
			jObject.put("messages", "success");
		else {
			jObject.put("messages", result);
		}

		return jObject.toString();
	}

	/**
	 * 대표 기술 설정
	 */
	@RequestMapping(value = "/partners/p/{id}/skill/update/represent", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String PartnersController_skillupdaterepresent_post(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("id") String id, @RequestParam("p5-skill-check") String[] pk_list) {

		logger.info("/partners/p/{id}/skill/update/represent Post Page");
		logger.info("id = " + id);

		for (int i = 0; i < pk_list.length; i++)
			logger.info("pk = " + pk_list[i]);

		JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String result = techniqueDao.updateRepresentative(this_account.getPk(), pk_list);

		logger.info("result = " + result);
		if (result.equals("성공"))
			jObject.put("messages", "success");
		else {
			jObject.put("messages", result);
		}

		return jObject.toString();
	}

	/**
	 * 경력, 학력, 자격증 보기
	 */
	@RequestMapping(value = "/partners/p/{id}/background", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_background(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/background Page");

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("/partners");
			return mv;
		}
		mv.addObject("this_account", this_account);

		AccountInformationInfo this_accountinfo = accountInformationDao.select(this_account.getPk());
		mv.addObject("this_accountinfo", this_accountinfo);
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

		String isSame = isSame(account, this_account);
		mv.addObject("isSame", isSame);

		List<CareerInfo> career = careerDao.select(this_account.getPk());
		List<EducationInfo> education = educationDao.select(this_account.getPk());
		List<LicenseInfo> license = licenseDao.select(this_account.getPk());

		mv.addObject("career", career);
		mv.addObject("education", education);
		mv.addObject("license", license);

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

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("redirect:/partners/");
			return mv;
		}
		mv.addObject("this_account", this_account);

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			mv.setViewName("redirect:/partners/p/" + id + "/");
			return mv;
		}

		List<CareerInfo> career = careerDao.select(this_account.getPk());
		List<EducationInfo> education = educationDao.select(this_account.getPk());
		List<LicenseInfo> license = licenseDao.select(this_account.getPk());

		mv.addObject("career", career);
		mv.addObject("education", education);
		mv.addObject("license", license);

		mv.setViewName("/partners/p/background/update");

		return mv;
	}

	/**
	 * 경력 정보 추가
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update/add/employ", method = RequestMethod.GET)
	public ModelAndView PartnersController_backgroundupdateaddemploy(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/background/update/add/employ Page");

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("redirect:/partners/");
			return mv;
		}
		mv.addObject("this_account", this_account);

		String isSame = isSame(account, this_account);
		mv.addObject("isSame", isSame);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			mv.setViewName("redirect:/partners/p/" + id + "/");
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
			HttpServletResponse response, @PathVariable("id") String id,
			@RequestParam("company_name") String company_name, @RequestParam("division") String division,
			@RequestParam("position") String position, @RequestParam("date_hired_year") String date_hired_year,
			@RequestParam("date_hired_month") String date_hired_month,
			@RequestParam("date_retired_year") String date_retired_year,
			@RequestParam("date_retired_month") String date_retired_month) {

		logger.info("/partners/p/{id}/background/update/add/employ Page");

		logger.info("id = " + id);
		logger.info("company_name = " + company_name);
		logger.info("division = " + division);
		logger.info("position = " + position);
		logger.info("date_hired_year = " + date_hired_year);
		logger.info("date_hired_month = " + date_hired_month);
		logger.info("date_retired_year = " + date_retired_year);
		logger.info("date_retired_month = " + date_retired_month);
		JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String result;
		try {
			result = careerDao.createCareer(this_account.getPk(), company_name, division, position, date_hired_year,
					date_hired_month, date_retired_year, date_retired_month);
		} catch (ParseException e) {
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
	 * 경력 정보 수정
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update/edit/employ/{pk}", method = RequestMethod.GET)
	public ModelAndView PartnersController_backgroundupdateeditemploy(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id, @PathVariable("pk") String pk) {
		logger.info("/partners/p/{id}/background/update/edit/employ Page");

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("redirect:/partners/");
			return mv;
		}
		mv.addObject("this_account", this_account);

		String isSame = isSame(account, this_account);
		mv.addObject("isSame", isSame);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			mv.setViewName("redirect:/partners/p/" + id + "/");
			return mv;
		}

		// pk가 숫자가 아니라면 반환
		if (!Validator.isDigit(pk)) {
			mv.setViewName("redirect:/partners/p/" + id + "/");
			return mv;
		}

		CareerInfo career = careerDao.select_career(Integer.parseInt(pk));

		logger.info("startdate = " + career.getStart_date());
		logger.info("startdate = " + career.getEnd_date());

		if (career == null) {
			mv.setViewName("redirect:/partners/p/" + id + "/");
			return mv;
		}

		mv.addObject("career", career);

		mv.setViewName("/partners/p/background/update/edit/employ");

		return mv;
	}

	/**
	 * 경력 정보 수정 처리
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update/edit/employ/{pk}", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String PartnersController_backgroundupdateeditemploy_post(HttpServletRequest request,
			HttpServletResponse response, @PathVariable("id") String id, @PathVariable("pk") String pk,
			@RequestParam("company_name") String company_name, @RequestParam("division") String division,
			@RequestParam("position") String position, @RequestParam("date_hired_year") String date_hired_year,
			@RequestParam("date_hired_month") String date_hired_month,
			@RequestParam("date_retired_year") String date_retired_year,
			@RequestParam("date_retired_month") String date_retired_month) {

		logger.info("/partners/p/{id}/background/update/edit/employ post Page");

		logger.info("id = " + id);
		logger.info("company_name = " + company_name);
		logger.info("division = " + division);
		logger.info("position = " + position);
		logger.info("date_hired_year = " + date_hired_year);
		logger.info("date_hired_month = " + date_hired_month);
		logger.info("date_retired_year = " + date_retired_year);
		logger.info("date_retired_month = " + date_retired_month);

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		JSONObject jObject = new JSONObject();

		if (this_account == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		// pk가 숫자가 아니라면 반환
		if (!Validator.isDigit(pk)) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String result;
		try {
			result = careerDao.updateCareer(Integer.parseInt(pk), company_name, division, position, date_hired_year,
					date_hired_month, date_retired_year, date_retired_month);
		} catch (ParseException e) {
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
	 * 경력 삭제
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update/delete_/employ", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String PartnersController_backgroundupdatedelete_post(HttpServletRequest request,
			HttpServletResponse response, @PathVariable("id") String id, @RequestParam("employ_id") String employ_id) {

		logger.info("/partners/p/{id}/background/update/delete_/employ Post Page");
		logger.info("id = " + id);
		logger.info("employ_id = " + employ_id);

		JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		if (!Validator.isDigit(employ_id)) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String result = careerDao.delete(Integer.parseInt(employ_id));

		logger.info("result = " + result);
		if (result.equals("성공"))
			jObject.put("messages", "success");
		else {
			jObject.put("messages", result);
		}

		return jObject.toString();
	}

	/**
	 * 학력 정보 추가
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update/add/edu", method = RequestMethod.GET)
	public ModelAndView PartnersController_backgroundupdateaddedu(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/background/update/add/edu Page");

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("redirect:/partners/");
			return mv;
		}
		mv.addObject("this_account", this_account);

		String isSame = isSame(account, this_account);
		mv.addObject("isSame", isSame);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			mv.setViewName("redirect:/partners/p/" + id + "/");
			return mv;
		}

		mv.setViewName("/partners/p/background/update/add/edu");

		return mv;
	}

	/**
	 * 학력 정보 추가 처리
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update/add/edu", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String PartnersController_backgroundupdateaddedu_post(HttpServletRequest request,
			HttpServletResponse response, @PathVariable("id") String id,
			@RequestParam("school_name") String school_name, @RequestParam("major") String major,
			@RequestParam("edu_type") String edu_type, @RequestParam("edu_status") String edu_status,
			@RequestParam("date_entrance_year") String date_entrance_year,
			@RequestParam("date_entrance_month") String date_entrance_month,
			@RequestParam("date_graduate_year") String date_graduate_year,
			@RequestParam("date_graduate_month") String date_graduate_month) {
		logger.info("/partners/p/{id}/background/update/add/edu post Page");

		logger.info("id = " + id);
		logger.info("school_name = " + school_name);
		logger.info("major = " + major);
		logger.info("edu_type = " + edu_type);
		logger.info("edu_status = " + edu_status);
		logger.info("date_entrance_year = " + date_entrance_year);
		logger.info("date_entrance_month = " + date_entrance_month);
		logger.info("date_graduate_year = " + date_graduate_year);
		logger.info("date_graduate_month = " + date_graduate_month);

		JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String result;
		try {
			result = educationDao.createEdu(this_account.getPk(), school_name, major, edu_type, edu_status,
					date_entrance_year, date_entrance_month, date_graduate_year, date_graduate_month);
		} catch (ParseException e) {
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
	 * 학력 정보 수정
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update/edit/edu/{pk}", method = RequestMethod.GET)
	public ModelAndView PartnersController_backgroundupdateeditedu(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id, @PathVariable("pk") String pk) {
		logger.info("/partners/p/{id}/background/update/edit/edu Page");

		logger.info("id = " + id);
		logger.info("pk = " + pk);
		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("redirect:/partners/");
			return mv;
		}
		mv.addObject("this_account", this_account);

		String isSame = isSame(account, this_account);
		mv.addObject("isSame", isSame);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			mv.setViewName("redirect:/partners/p/" + id + "/");
			return mv;
		}

		// pk가 숫자가 아니라면 반환
		if (!Validator.isDigit(pk)) {
			mv.setViewName("redirect:/partners/p/" + id + "/");
			return mv;
		}

		EducationInfo edu = educationDao.select_edu(Integer.parseInt(pk));

		if (edu == null) {
			mv.setViewName("redirect:/partners/p/" + id + "/");
			return mv;
		}

		mv.addObject("edu", edu);

		mv.setViewName("/partners/p/background/update/edit/edu");

		return mv;
	}

	/**
	 * 학력 정보 수정 처리
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update/edit/edu/{pk}", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String PartnersController_backgroundupdateeditedu_post(HttpServletRequest request,
			HttpServletResponse response, @PathVariable("id") String id, @PathVariable("pk") String pk,
			@RequestParam("school_name") String school_name, @RequestParam("major") String major,
			@RequestParam("edu_type") String edu_type, @RequestParam("edu_status") String edu_status,
			@RequestParam("date_entrance_year") String date_entrance_year,
			@RequestParam("date_entrance_month") String date_entrance_month,
			@RequestParam("date_graduate_year") String date_graduate_year,
			@RequestParam("date_graduate_month") String date_graduate_month) {

		logger.info("/partners/p/{id}/background/update/edit/edu post Page");

		logger.info("id = " + id);
		logger.info("pk = " + pk);
		logger.info("school_name = " + school_name);
		logger.info("major = " + major);
		logger.info("edu_type = " + edu_type);
		logger.info("edu_status = " + edu_status);
		logger.info("date_entrance_year = " + date_entrance_year);
		logger.info("date_entrance_month = " + date_entrance_month);
		logger.info("date_graduate_year = " + date_graduate_year);
		logger.info("date_graduate_month = " + date_graduate_month);

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		JSONObject jObject = new JSONObject();

		if (this_account == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		// pk가 숫자가 아니라면 반환
		if (!Validator.isDigit(pk)) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String result;
		try {
			result = educationDao.updateEdu(Integer.parseInt(pk), school_name, major, edu_type, edu_status,
					date_entrance_year, date_entrance_month, date_graduate_year, date_graduate_month);
		} catch (ParseException e) {
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
	 * 교육 삭제
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update/delete_/edu", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String PartnersController_backgroundupdatedeleteedu_post(HttpServletRequest request,
			HttpServletResponse response, @PathVariable("id") String id,
			@RequestParam("education_id") String education_id) {

		logger.info("/partners/p/{id}/background/update/delete_/edu Post Page");
		logger.info("id = " + id);
		logger.info("education_id = " + education_id);

		JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		if (!Validator.isDigit(education_id)) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String result = educationDao.delete(Integer.parseInt(education_id));

		logger.info("result = " + result);
		if (result.equals("성공"))
			jObject.put("messages", "success");
		else {
			jObject.put("messages", result);
		}

		return jObject.toString();
	}

	/**
	 * 자격증 정보 추가
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update/add/certify", method = RequestMethod.GET)
	public ModelAndView PartnersController_backgroundupdateaddcertify(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/background/update/add/certify Page");

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("redirect:/partners/");
			return mv;
		}
		mv.addObject("this_account", this_account);

		String isSame = isSame(account, this_account);
		mv.addObject("isSame", isSame);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			mv.setViewName("redirect:/partners/p/" + id + "/");
			return mv;
		}

		mv.setViewName("/partners/p/background/update/add/certify");

		return mv;
	}

	/**
	 * 자격증 정보 추가 처리
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update/add/certify", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String PartnersController_backgroundupdateaddcertify_post(HttpServletRequest request,
			HttpServletResponse response, @PathVariable("id") String id, @RequestParam("title") String title,
			@RequestParam("institution") String institution,
			@RequestParam("certification_number") String certification_number,
			@RequestParam("date_issued_year") String date_issued_year,
			@RequestParam("date_issued_month") String date_issued_month,
			@RequestParam("date_issued_day") String date_issued_day) {

		logger.info("/partners/p/{id}/background/update/add/employ Page");

		logger.info("id = " + id);
		logger.info("title = " + title);
		logger.info("institution = " + institution);
		logger.info("certification_number = " + certification_number);
		logger.info("date_issued_year = " + date_issued_year);
		logger.info("date_issued_month = " + date_issued_month);
		logger.info("date_issued_day = " + date_issued_day);

		JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String result;
		try {
			result = licenseDao.createLicense(this_account.getPk(), title, institution, certification_number,
					date_issued_year, date_issued_month, date_issued_day);
		} catch (ParseException e) {
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
	 * 자격증 정보 수정
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update/edit/certify/{pk}", method = RequestMethod.GET)
	public ModelAndView PartnersController_backgroundupdateaddcertify(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id, @PathVariable("pk") String pk) {
		logger.info("/partners/p/{id}/background/update/edit/certify Page");

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("redirect:/partners/");
			return mv;
		}
		mv.addObject("this_account", this_account);

		String isSame = isSame(account, this_account);
		mv.addObject("isSame", isSame);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			mv.setViewName("redirect:/partners/p/" + id + "/");
			return mv;
		}

		// pk가 숫자가 아니라면 반환
		if (!Validator.isDigit(pk)) {
			mv.setViewName("redirect:/partners/p/" + id + "/");
			return mv;
		}

		LicenseInfo license = licenseDao.select_license(Integer.parseInt(pk));
		mv.addObject("license", license);

		mv.setViewName("/partners/p/background/update/edit/certify");

		return mv;
	}

	/**
	 * 자격증 정보 수정 처리
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update/edit/certify/{pk}", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String PartnersController_backgroundupdateeditcertify_post(HttpServletRequest request,
			HttpServletResponse response, @PathVariable("id") String id, @PathVariable("pk") String pk,
			@RequestParam("title") String title, @RequestParam("institution") String institution,
			@RequestParam("certification_number") String certification_number,
			@RequestParam("date_issued_year") String date_issued_year,
			@RequestParam("date_issued_month") String date_issued_month,
			@RequestParam("date_issued_day") String date_issued_day) {

		logger.info("/partners/p/{id}/background/update/edit/employ Page");

		logger.info("id = " + id);
		logger.info("title = " + title);
		logger.info("institution = " + institution);
		logger.info("certification_number = " + certification_number);
		logger.info("date_issued_year = " + date_issued_year);
		logger.info("date_issued_month = " + date_issued_month);
		logger.info("date_issued_day = " + date_issued_day);

		JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		// pk가 숫자가 아니라면 반환
		if (!Validator.isDigit(pk)) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String result;
		try {
			result = licenseDao.updateLicense(Integer.parseInt(pk), title, institution, certification_number,
					date_issued_year, date_issued_month, date_issued_day);
		} catch (ParseException e) {
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
	 * 자격증 삭제
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update/delete_/certify", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String PartnersController_backgroundupdatedeletecertify_post(HttpServletRequest request,
			HttpServletResponse response, @PathVariable("id") String id,
			@RequestParam("certify_id") String certify_id) {

		logger.info("/partners/p/{id}/background/update/delete_/certify Post Page");
		logger.info("id = " + id);
		logger.info("certify_id = " + certify_id);

		JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		if (!Validator.isDigit(certify_id)) {
			jObject.put("messages", "error");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String result = licenseDao.delete(Integer.parseInt(certify_id));

		logger.info("result = " + result);
		if (result.equals("성공"))
			jObject.put("messages", "success");
		else {
			jObject.put("messages", result);
		}

		return jObject.toString();
	}

	/**
	 * 평가 보기
	 */
	@RequestMapping(value = "/partners/p/{id}/evaluation", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_evaluation(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/evaluation Page");

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		
		//해당 파트너스의 계정
		AccountInfo this_account = accountDao.select(id);

		//에러
		if (this_account == null) {
			mv.setViewName("redirect:/partners");
			return mv;
		}
		
		//해당 파트너스의 계정과 계정 정보
		mv.addObject("this_account", this_account);
		AccountInformationInfo this_accountinfo = accountInformationDao.select(this_account.getPk());
		mv.addObject("this_accountinfo", this_accountinfo);

		//접속한 사용자와 해당 사용자가 같은지 체크
		String isSame = isSame(account, this_account);
		mv.addObject("isSame", isSame);

		//계약 개수
		int contractnum = contractDao.getPartnersContractCount(this_account.getPk());
		mv.addObject("contractnum",contractnum);
		
		//평가받은 리스트
		List<AssessmentInfo> assessmentlist = assessmentDao.select_assessed(this_account.getPk());
		mv.addObject("assessmentlist",assessmentlist);
		
		if(assessmentlist != null)
		{
			for(int i=0;i<assessmentlist.size();i++)
				logger.info(i + " : "+assessmentlist.get(i).getProject().getName());
		}
		
		mv.setViewName("/partners/p/evaluation");

		return mv;
	}

	/**
	 * history 보기
	 */
	@RequestMapping(value = "/partners/p/{id}/history", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_history(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/history Page");

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("/partners");
			return mv;
		}
		mv.addObject("this_account", this_account);

		AccountInformationInfo this_accountinfo = accountInformationDao.select(this_account.getPk());
		mv.addObject("this_accountinfo", this_accountinfo);

		String isSame = isSame(account, this_account);
		mv.addObject("isSame", isSame);

		mv.setViewName("/partners/p/history");

		return mv;
	}
	

	/**
	 * history 업데이트
	 */
	@RequestMapping(value = "/partners/p/{id}/history/update", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_history_update(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/history/update Page");

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("/partners");
			return mv;
		}
		mv.addObject("this_account", this_account);

		AccountInformationInfo this_accountinfo = accountInformationDao.select(this_account.getPk());
		mv.addObject("this_accountinfo", this_accountinfo);

		String isSame = isSame(account, this_account);
		mv.addObject("isSame", isSame);

		mv.setViewName("/partners/p/history/update");

		return mv;
	}

	/**
	 * 프로필 정보 관리
	 */
	@RequestMapping(value = "/partners/p/{id}/info/update", method = RequestMethod.GET)
	public ModelAndView PartnersController_infoupdate(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/info/update Page");

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("redirect:/partners/");
			return mv;
		}
		mv.addObject("this_account", this_account);

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			mv.setViewName("redirect:/partners/p/" + id + "/");
			return mv;
		}

		Partners_infoInfo info = partners_infoDao.select(this_account.getPk());

		mv.addObject("info", info);

		if (Validator.hasValue(info.getJob()) || Validator.hasValue(info.getJob_subcategory_develop())
				|| Validator.hasValue(info.getJob_subcategory_design()) || Validator.hasValue(info.getAvailability())) {
			logger.info("파트너스 정보 있음");
			mv.addObject("hasInfo", "true");
		}
		mv.setViewName("/partners/p/info/update");
		return mv;
	}

	/**
	 * 프로필 정보 추가
	 */
	@RequestMapping(value = "/partners/p/{id}/info/update/add", method = RequestMethod.GET)
	public ModelAndView PartnersController_infoupdateadd(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/info/update/add Page");

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("/partners");
			return mv;
		}
		mv.addObject("this_account", this_account);

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			mv.setViewName("redirect:/partners/p/" + id + "/");
			return mv;
		}

		mv.setViewName("/partners/p/info/update/add");
		return mv;
	}

	/**
	 * 프로필 정보 추가 처리
	 */
	@RequestMapping(value = "/partners/p/{id}/info/update/add", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String PartnersController_infoupdateadd_post(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("id") String id, @RequestParam("job") String job,
			@RequestParam(value = "job_subcategory_develop",  required = false) String[] job_subcategory_develop,
			@RequestParam(value = "job_subcategory_design",  required = false) String[] job_subcategory_design,
			@RequestParam("availability") String availability) {

		logger.info("/partners/p/{id}/info/update/add post Page");

		JSONObject jObject = new JSONObject();

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			jObject.put("messages", "잘못된 URL 입니다.");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			jObject.put("messages", "잘못된 접근 입니다.");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String result = partners_infoDao.update(this_account.getPk(), job, job_subcategory_develop,
				job_subcategory_design, availability);

		if (result.equals("성공")) {
			jObject.put("messages", "success");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		} else {
			jObject.put("messages", result);
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}
	}
	

	/**
	 * 프로필 정보 수정
	 */
	@RequestMapping(value = "/partners/p/{id}/info/update/edit", method = RequestMethod.GET)
	public ModelAndView PartnersController_infoupdateedit(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/info/update/edit Page");

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("/partners");
			return mv;
		}
		mv.addObject("this_account", this_account);

		String isSame = isSame(account, this_account);

		// 자기 자신이 아닌데 업데이트에 접근하는 경우
		if (isSame == null) {
			mv.setViewName("redirect:/partners/p/" + id + "/");
			return mv;
		}

		Partners_infoInfo info = partners_infoDao.select(this_account.getPk());

		mv.addObject("info", info);

		if (Validator.hasValue(info.getJob()) || Validator.hasValue(info.getJob_subcategory_develop())
				|| Validator.hasValue(info.getJob_subcategory_design()) || Validator.hasValue(info.getAvailability())) {
			logger.info("파트너스 정보 있음");
			mv.addObject("hasInfo", "true");
		}
		mv.setViewName("/partners/p/info/update/edit");
		return mv;
	}

	/**
	 * 프로젝트 히스토리 관리
	 */
	@RequestMapping(value = "/partners/p/{id}/evaluation/update", method = RequestMethod.GET)
	public ModelAndView PartnersController_evaluationupdate(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/evaluation/update Page");

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		AccountInfo this_account = accountDao.select(id);

		if (this_account == null) {
			mv.setViewName("/partners");
			return mv;
		}
		mv.addObject("this_account", this_account);

		AccountInformationInfo this_accountinfo = accountInformationDao.select(this_account.getPk());
		mv.addObject("this_accountinfo", this_accountinfo);

		String isSame = isSame(account, this_account);
		mv.addObject("isSame", isSame);

		mv.setViewName("/partners/p/evaluation/update");

		return mv;
	}

	///////////////////////////////////////////////////////////////////////////////////
	// 파트너스 포르젝트 관리
	////////////////////////////////////////////////////////////////////////////////////
	

	/**
	 * 지원자 마이페이지
	 */
	/*@RequestMapping(value = "/mywjm/partners", method = RequestMethod.GET)
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
			mv.setViewName("/accounts/login");
			return mv;
		}
		
		List<ProjectInfo> interest = applicantDao.getInterestProject(account.getPk());
		List<ApplicantInfo> apply = applicantDao.select_applicant(account.getPk(), "지원중");
		List<ContractInfo> contract = null;

		mv.setViewName("/mywjm/partners");
		mv.addObject("interest",interest);
		mv.addObject("apply",apply);
		mv.addObject("contract",contract);
		
		return mv;
	}
	*/
	/**
	 * 관심 프로젝트
	 */
	@RequestMapping(value = "/partners/manage/interest", method = RequestMethod.GET)
	public ModelAndView PartnersController_manage_interest(HttpServletRequest request, ModelAndView mv) {
		logger.info("/partners/manage/interest Page");


		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		
		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		else if(!account.getAccount_type().equals("partners"))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

		List<ProjectInfo> interest = applicantDao.getInterestProject(account.getPk());
		mv.setViewName("/partners/manage/interest");
		mv.addObject("interest",interest);
		
		return mv;
	}

	/**
	 * 지원 내역(지원 중)
	 */
	@RequestMapping(value = "/partners/manage/proposal/counselling", method = RequestMethod.GET)
	public ModelAndView PartnersController_manage_proposalcounselling(HttpServletRequest request, ModelAndView mv) {
		logger.info("/partners/manage/proposal/counselling Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		
		if(account == null)
		{
			mv.setViewName("/accounts/login");
			return mv;
		}
		else if(!account.getAccount_type().equals("partners"))
		{
			mv.setViewName("/accounts/login");
			return mv;
		}
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

		List<ApplicantInfo> apply = applicantDao.select_applicant(account.getPk(), "지원중");
		
		List<ApplicantInfo> end_apply = applicantDao.select_applicant(account.getPk(), "지원종료");
		if(end_apply!=null) mv.addObject("endnum",end_apply.size());

		mv.addObject("apply",apply);
		
		mv.setViewName("/partners/manage/proposal/counselling");
		return mv;
	}

	/**
	 * 지원 내역(지원 종료)
	 */
	@RequestMapping(value = "/partners/manage/proposal/end-counselling", method = RequestMethod.GET)
	public ModelAndView PartnersController_manage_proposalendcounselling(HttpServletRequest request, ModelAndView mv) {
		logger.info("/partners/manage/proposal/end-counselling Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		
		if(account == null)
		{
			mv.setViewName("/accounts/login");
			return mv;
		}
		else if(!account.getAccount_type().equals("partners"))
		{
			mv.setViewName("/accounts/login");
			return mv;
		}
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

		List<ApplicantInfo> apply_ing = applicantDao.select_applicant(account.getPk(), "지원중");
		if(apply_ing!=null) mv.addObject("ingnum",apply_ing.size());

		List<ApplicantInfo> apply = applicantDao.select_applicant(account.getPk(), "지원종료");
		
		mv.addObject("apply",apply);
		
		mv.setViewName("/partners/manage/proposal/end-counselling");
		
		return mv;
	}

	/**
	 * 진행중인 프로젝트 내역
	 */
	@RequestMapping(value = "/partners/manage/contract-in-progress", method = RequestMethod.GET)
	public ModelAndView PartnersController_manage_contractinprogress(HttpServletRequest request, ModelAndView mv) {
		logger.info("/partners/manage/contract-in-progress Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		
		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		else if(!account.getAccount_type().equals("partners"))
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}

		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

		
		List<ContractInfo> contractlist = contractDao.selectProgressPartners(account.getPk(),"진행중");
		mv.addObject("contractlist",contractlist);
		
		mv.setViewName("/partners/manage/contract-in-progress");
		
		return mv;
	}

	/**
	 * 완료한 프로젝트 내역(평가 대기중)
	 */
	@RequestMapping(value = "/partners/manage/past/review-contract", method = RequestMethod.GET)
	public ModelAndView PartnersController_manage_reviewcontract(HttpServletRequest request, ModelAndView mv) {
		logger.info("/partners/manage/past/review-contract Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		
		if(account == null)
		{
			mv.setViewName("/accounts/login");
			return mv;
		}
		else if(!account.getAccount_type().equals("partners"))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

		List<ContractInfo> reviewlist = contractDao.selectReviewPartners(account.getPk(),"완료한프로젝트");
		List<ContractInfo> completedlist = contractDao.selectCompletedPartners(account.getPk(),"완료한프로젝트");
		if(completedlist!=null) mv.addObject("completednum",completedlist.size());
		
		mv.addObject("reviewlist",reviewlist);
		
		mv.setViewName("/partners/manage/past/review-contract");
		return mv;
	}

	/**
	 * 평가 하기 페이지
	 */
	@RequestMapping(value = "/partners/manage/review/{project_pk}/{client_pk}/{partners_pk}", method = RequestMethod.GET)
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
			if(contract.getPartners_pk() != account.getPk())
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
		
		mv.setViewName("partners/manage/review");
		
		return mv;
	}

	/**
	 * 평가 하기 처리 페이지
	 */
	@RequestMapping(value = "/partners/manage/review/{project_pk}/{client_pk}/{partners_pk}", method = RequestMethod.POST)
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
			if(contract.getPartners_pk() != account.getPk())
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
			mv.setViewName("partners/manage/review");
			return mv;
		}
		else if(!Validator.isDigit(professionalism))
		{
			logger.info("전문선 x");
			mv.addObject("messages","전문성은 숫자만 입력 가능합니다.");
			mv.addObject("contract",contract);
			mv.setViewName("partners/manage/review");
			return mv;
		}

		if(!Validator.hasValue(satisfaction))
		{
			logger.info("만족도 x");
			mv.addObject("messages","만족도를 선택해주세요.");
			mv.addObject("contract",contract);
			mv.setViewName("partners/manage/review");
			return mv;
		}
		else if(!Validator.isDigit(satisfaction))
		{
			logger.info("만족도 x");
			mv.addObject("messages","만족도는 숫자만 입력 가능합니다.");
			mv.addObject("contract",contract);
			mv.setViewName("partners/manage/review");
			return mv;
		}

		if(!Validator.hasValue(schedule_observance))
		{
			logger.info("일정준수 x");
			mv.addObject("messages","일정준수를 선택해주세요.");
			mv.addObject("contract",contract);
			mv.setViewName("partners/manage/review");
			return mv;
		}
		else if(!Validator.isDigit(schedule_observance))
		{
			logger.info("일정준수 x");
			mv.addObject("messages","일정준수는 숫자만 입력 가능합니다.");
			mv.addObject("contract",contract);
			mv.setViewName("partners/manage/review");
			return mv;
		}

		if(!Validator.hasValue(activeness))
		{
			logger.info("적극성 x");
			mv.addObject("messages","적극성을 선택해주세요.");
			mv.addObject("contract",contract);
			mv.setViewName("partners/manage/review");
			return mv;
		}
		else if(!Validator.isDigit(activeness))
		{
			logger.info("적극성 x");
			mv.addObject("messages","적극성은 숫자만 입력 가능합니다.");
			mv.addObject("contract",contract);
			mv.setViewName("partners/manage/review");
			return mv;
		}

		if(!Validator.hasValue(communication))
		{
			logger.info("의사소통 x");
			mv.addObject("messages","의사소통을 선택해주세요.");
			mv.addObject("contract",contract);
			mv.setViewName("partners/manage/review");
			return mv;
		}
		else if(!Validator.isDigit(communication))
		{
			logger.info("의사소통 x");
			mv.addObject("messages","의사소통은 숫자만 입력 가능합니다.");
			mv.addObject("contract",contract);
			mv.setViewName("partners/manage/review");
			return mv;
		}
		
		if(!Validator.hasValue(communication))
		{
			logger.info("추천한마디 x");
			mv.addObject("messages","추천한마디를 입력해주세요.");
			mv.addObject("contract",contract);
			mv.setViewName("partners/manage/review");
			return mv;
		}
		else if(!Validator.isValidLength(recommendation, 1, 250))
		{
			logger.info("추천 한마디가 250자 넘음");
			mv.addObject("messages","추천 한 마디는 250 미만입니다.");
			mv.addObject("contract",contract);
			mv.setViewName("partners/manage/review");
			return mv;
		}
		
		logger.info("평가생성");
		assessmentDao.create(project_pk, partners_pk, client_pk
				, Integer.parseInt(professionalism), Integer.parseInt(satisfaction), 
						Integer.parseInt(schedule_observance), Integer.parseInt(activeness), 
								Integer.parseInt(communication), recommendation);
		
		ProjectInfo project = projectDao.select_project(project_pk);
		//notification update
		notificationDao.create(account.getPk(), contract.getClient_id()+" 클라이언트를 평가하셨습니다. 프로젝트가 완료되었습니다.");
		String result = sendMail("admin@wjm.com", "gksthf1611@gmail.com", contract.getClient_id()+" 클라이언트를 평가하셨습니다. 프로젝트가 완료되었습니다.", "외주몬 알림 메일입니다");
		logger.info("이메일 전송 결과 = "+result);
		notificationDao.create(client_pk, contract.getPartners_id()+" 님이 "+project.getName()+" 프로젝트의 평가를 완료하셨습니다.");
		result = sendMail("admin@wjm.com", "gksthf1611@gmail.com", contract.getPartners_id()+" 님이 "+project.getName()+" 프로젝트의 평가를 완료하셨습니다.", "외주몬 알림 메일입니다");
		logger.info("이메일 전송 결과 = "+result);
				
		
		mv.setViewName("redirect:/partners/manage/past/completed-contract");
		
		return mv;
	}
	/**
	 * 완료한 프로젝트 내역(완료한 프로젝트)
	 */
	@RequestMapping(value = "/partners/manage/past/completed-contract", method = RequestMethod.GET)
	public ModelAndView PartnersController_manage_completedcontract(HttpServletRequest request, ModelAndView mv) {
		logger.info("/partners/manage/past/completed-contract Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		
		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		else if(!account.getAccount_type().equals("partners"))
		{
			mv.setViewName("redirect:/error/404error");
			return mv;
		}
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

		//평가 대기중
		List<ContractInfo> reviewlist = contractDao.selectReviewPartners(account.getPk(),"완료한프로젝트");
		if(reviewlist!=null) mv.addObject("reviewnum",reviewlist.size());

		//완료한 프로젝트
		List<ContractInfo> completedlist = contractDao.selectCompletedPartners(account.getPk(),"완료한프로젝트");
		mv.addObject("completedlist",completedlist);

		mv.setViewName("/partners/manage/past/completed-contract");
		return mv;
	}


	/**
	 * 관심 프로젝트에서 삭제
	 */
	@RequestMapping(value = "/partners/manage/interest/delete/{project_pk}", method = RequestMethod.GET)
	public ModelAndView PartnersController_manage_interestdelete(HttpServletRequest request, ModelAndView mv,
			@PathVariable("project_pk") int project_pk) {
		logger.info("/partners/p/{id}/introduction Page");

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		
		if(account == null)
		{
			mv.setViewName("/accounts/login");
			return mv;
		}
		else if(!account.getAccount_type().equals("partners"))
		{
			mv.setViewName("/accounts/login");
			return mv;
		}

		String result = applicantDao.toggleInterest(account.getPk(),project_pk);
		logger.info("result : "+result);
		mv.setViewName("redirect:/mywjm/partners");

		return mv;
	}
	
	/**
	 * 관심 프로젝트에서 추가 및 제거
	 */
	@RequestMapping(value = "/partners/manage/interest/toggle/{project_pk}", method = RequestMethod.GET, produces = "text/json; charset=utf8")
	@ResponseBody
	public String PartnersController_manage_interesttoggle(HttpServletRequest request,
			@PathVariable("project_pk") int project_pk) {
		logger.info("/partners/manage/interest/toggle/{project_pk}");

		AccountInfo account = (AccountInfo) request.getSession().getAttribute("account");
		JSONObject jObject = new JSONObject();

		if (account == null) {
			jObject.put("messages", "로그인해주세요.");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}
		else if(!account.getAccount_type().equals("partners"))
		{
			jObject.put("messages", "파트너스만 관심프로젝트를 등록 가능합니다.");
			logger.info("jobject = " + jObject.toString());
			return jObject.toString();
		}

		String result = applicantDao.toggleInterest(account.getPk(),project_pk);
		logger.info("result : "+result);
		
		jObject.put("messages", result);
		
		logger.info(jObject.toString());
		return jObject.toString();
	}

}
