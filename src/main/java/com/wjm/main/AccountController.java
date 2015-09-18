package com.wjm.main;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileUploadException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.wjm.dao.AccountDao;
import com.wjm.dao.AccountInformationDao;
import com.wjm.main.function.Fileupload;
import com.wjm.main.function.Validator;
import com.wjm.models.AccountInfo;
import com.wjm.models.AccountInformationInfo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AccountController {
	
	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	   
	@Autowired
	private AccountDao accountDao;
	
	@Autowired
	private AccountInformationDao accountInformationDao;
	/**
	 * 로그인 페이지
	 */
	@RequestMapping(value = "/accounts/notifications", method = RequestMethod.GET)
	public String MainController_notifications_get(HttpServletRequest request) {
		logger.info("notifications Get Page");
		
		return "/accounts/notifications";
	}
	
	/**
	 * 로그인 페이지
	 */
	@RequestMapping(value = "/accounts/login", method = RequestMethod.GET)
	public String MainController_login_get(HttpServletRequest request) {
		logger.info("login Get Page");
		
		return "/accounts/login";
	}
	
	/**
	 * 로그인 처리
	 */
	@RequestMapping(value = "/accounts/login", method = RequestMethod.POST, produces = "text/plain; charset=utf8")
	public ModelAndView MainController_login_post(HttpServletRequest request,
 			HttpServletResponse response,
			 @RequestParam("id") String id,
			 @RequestParam("password") String password) {
		logger.info("login Post Page");

		ModelAndView mv = new ModelAndView();
		String return_val = "/accounts/login";
		
		mv.setViewName(return_val);
		
		//아이디 체크
		if(!Validator.isId(id))
		{			
			mv.addObject("id_msg", "아이디는 6글자 이상 입력해 주세요.");
			return mv;
		}
		//패스워드 길이 체크
		if(password.length()<8 || password.length()>32)
		{			
			mv.addObject("password_msg","비밀번호는 8자 이상 32자 이하로 입력해 주세요.");
			return mv;
		}

		//로그인 체크
		AccountInfo account = (AccountInfo)accountDao.login(id, password);
		
		//로그인 실패
		if(account == null)
		{
			mv.addObject("messages", "아이디 혹은 비밀번호를 확인하세요.");
			return mv;
		}
		
		//세션에 계정 정보 저장
		request.getSession().setAttribute("account", account);
		
		//클라이언트의 경우
		if(account.getAccount_type().equals("client"))
		{
			return_val = "redirect:/mywjm/client";
		}
		//파트너스의 경우
		else if(account.getAccount_type().equals("partners"))
		{
			return_val = "redirect:/mywjm/partners";
		}
		//둘다 아닌 경우, 오류..
		else
		{
			return_val = "redirect:/index";
		}
		
		mv.setViewName(return_val);

		return mv;
	}
	/**
	 * 회원가입 페이지
	 */
	@RequestMapping(value = "/accounts/signup", method = RequestMethod.GET)
	public ModelAndView AccountController_signup_get(HttpServletRequest request, ModelAndView mv) {
		logger.info("signup Get Page");
		
		int clientnum = accountDao.select_account("client");
		int partnersnum = accountDao.select_account("partners");
		
		mv.addObject("clientnum",clientnum);
		mv.addObject("partnersnum",partnersnum);
		
		return mv;
	}
	
	/**
	 * 회원가입 처리
	 */
	
	@RequestMapping(value = "/accounts/signup", method = RequestMethod.POST)
	public ModelAndView AccountController_signup_post(HttpServletRequest request,
 			HttpServletResponse response,
			 @RequestParam("email") String email,
			 @RequestParam("id") String id,
			 @RequestParam("password") String password,
			 @RequestParam("password_confirm") String password_confirm,
			 @RequestParam(value = "usage", required = false, 
                     defaultValue = "") String account_type,
			 @RequestParam(value = "tos", required = false, 
                     defaultValue = "") String tos
			) {
		logger.info("signup Post Page");
				
		logger.info("id = "+id);
		//반환 뷰 값
		String return_val = "/accounts/signup";
		//등록 가능 여부
		boolean isAvailable = true;
		
		//모뎅 앤 뷰 생성
		ModelAndView mv = new ModelAndView();
		mv.setViewName(return_val);

		//개인정보 체크 안한 경우
		if(tos.equals("off")|| tos.isEmpty())
		{
			logger.info("이용약관 및 개인정보보호방침에 동의해주세요.");
			mv.addObject("tos_msg", "이용약관 및 개인정보보호방침에 동의해주세요.");
			isAvailable = false;
		}
		else
		{
			mv.addObject("tos_val", tos);
		}

		//계정 종류
		if(account_type==null|| account_type.isEmpty())
		{
			logger.info("이용 목적을 선택해주세요.");
			mv.addObject("account_type_msg", "이용 목적을 선택해주세요.");
			isAvailable = false;
		}
		else
		{
			mv.addObject("account_type_val", account_type);
		}
		
		//아이디 탐색
		if(!Validator.isId(id))
		{			
			logger.info("6글자 이상 입력해 주세요.");
			mv.addObject("id_msg", "6글자 이상 입력해 주세요.");
			isAvailable = false;
		}
		else
		{
			//아이디 계정 탐색
			List<AccountInfo> accountlist = accountDao.select(id);
			
			//헤딩 아이디가 존재하는 경우
			if(accountlist.size() != 0)
			{
				logger.info("입력한 아이디가 이미 사용 중입니다. 다른 이메일을 입력해주세요.");
				mv.addObject("id_msg", "입력한 아이디가 이미 사용 중입니다. 다른 이메일을 입력해주세요.");
				isAvailable = false;
			}
		}
		mv.addObject("id_val", id);
				
		//이메일 형식 체크
		if(!Validator.isEmail(email))
		{				
			logger.info("올바른 이메일 형식을 사용해주세요.");
			mv.addObject("email_msg", "올바른 이메일 형식을 사용해주세요.");
			isAvailable = false;
		}
		else
		{
			//이메일 계정 탐색
			List<AccountInfo> accountlist = accountDao.select_email(email);
			//해당 이메일이 존재하는 경우
			if(accountlist.size() != 0)
			{
				logger.info("입력한 이메일은 이미 사용 중입니다. 다른 이메일을 입력해주세요.");
				mv.addObject("email_msg","입력한 이메일은 이미 사용 중입니다. 다른 이메일을 입력해주세요.");
				isAvailable = false;
			}
		}
		mv.addObject("email_val", email);
		
		//패스워드 길이 체크
		if(password.length()<8 || password.length()>32)
		{			
			logger.info("비밀번호는 8자 이상 32자 이하로 입력해 주세요.");
			mv.addObject("password_msg","비밀번호는 8자 이상 32자 이하로 입력해 주세요.");
			isAvailable = false;
		}
		else
		{
			if(!password.equals(password_confirm))
			{
				logger.info("동일한 비밀번호를 입력해 주세요.");
				mv.addObject("password_msg","동일한 비밀번호를 입력해 주세요.");
				isAvailable = false;
			}
		}

		if(isAvailable)
		{
			accountDao.signup(id, email, password, account_type);
			mv.setViewName("/accounts/login");
		}
		
		return mv;
	}
	
	/**
	 * 회원가입 페이지
	 */
	@RequestMapping(value = "/accounts/password/change", method = RequestMethod.GET)
	public String AccountController_password_change_get(HttpServletRequest request) {
		logger.info("/accounts/password/change Get Page");
		
		return "/accounts/password/change";
	}
	/**
	 * 회원가입 페이지
	 */
	@RequestMapping(value = "/accounts/settings/bank_account", method = RequestMethod.GET)
	public String AccountController_bank_account_get(HttpServletRequest request) {
		logger.info("bank_account Get Page");
		
		return "/accounts/settings/bank_account";
	}
	/**
	 * 회원가입 페이지
	 */
	@RequestMapping(value = "/accounts/settings/profile", method = RequestMethod.GET)
	public ModelAndView AccountController_profile_get(HttpServletRequest request, ModelAndView mv) {
		logger.info("profile Get Page");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		AccountInformationInfo accountinfo;
		
		if(account != null)
		{
			logger.info("account 존재");
			accountinfo = accountInformationDao.select(account.getPk());
			if(accountinfo  == null)
			{
				logger.info("accountinfo 존재X");
				accountInformationDao.create(account.getPk());
				accountinfo = accountInformationDao.select(account.getPk());
			}
			else
			{
				logger.info("accountinfo 존재");
				if(accountInformationDao.hasBasicInfo(account.getPk()))
				{
					mv.addObject("hasBasicInfo","true");
				}
				if(accountInformationDao.hasPhoneNum(account.getPk()))
				{
					mv.addObject("hasPhoneNum","true");
				}
				if(account.getEmail()!=null)
				{
					mv.addObject("hasEmail","true");
				}
			}
		}
		else
			accountinfo = null;
			
		mv.addObject("accountinfo",accountinfo);
		
		return mv;
	}
	
	/**
	 * 기본정보 수정
	 */
	@RequestMapping(value = "/accounts/settings/profile", method = RequestMethod.POST)
	public ModelAndView AccountController_profile_post(HttpServletRequest request,
 			HttpServletResponse response,
 			ModelAndView mv,
			 @RequestParam(value = "image", required = false, defaultValue = "") MultipartFile image,
			 @RequestParam(value = "form_of_business", required = false, defaultValue = "") String form_of_business,
			 @RequestParam(value = "full_name", required = false, defaultValue = "") String full_name,
			 @RequestParam(value = "company_name", required = false, defaultValue = "") String company_name,
			 @RequestParam(value = "representative", required = false, defaultValue = "") String representative,
			 @RequestParam(value = "gender", required = false, defaultValue = "") String gender,
			 @RequestParam(value = "date_of_birth_year", required = false, defaultValue = "") String date_of_birth_year,
			 @RequestParam(value = "date_of_birth_month", required = false, defaultValue = "") String date_of_birth_month,
			 @RequestParam(value = "date_of_birth_day", required = false, defaultValue = "") String date_of_birth_day,
			 @RequestParam(value = "address_sido", required = false, defaultValue = "") String address_sido,
			 @RequestParam(value = "sigungu", required = false, defaultValue = "") String sigungu,
			 @RequestParam(value = "address_detail", required = false, defaultValue = "") String address_detail,
			 @RequestParam(value = "email_subscription", required = false, defaultValue = "") String email_subscription,
			 @RequestParam(value = "cell_phone_number_code", required = false, defaultValue = "") String cell_phone_number_code,
			 @RequestParam(value = "phone_number_entered", required = false, defaultValue = "") String phone_number_entered,
			 @RequestParam(value = "fax_number", required = false, defaultValue = "") String fax_number,
			 @RequestParam("submit_type") String submit_type
			) throws IOException, FileUploadException, ParseException  {
		logger.info("profile Post Page");
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");

		if(account == null)
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		
		mv.setViewName("/accounts/settings/profile");
		AccountInformationInfo accountinfo = accountInformationDao.select(account.getPk());
		
		if(accountinfo == null)
		{
			accountInformationDao.create(account.getPk());
			accountinfo = accountInformationDao.select(account.getPk());
		}
		
		if(submit_type.equals("base"))
		{
			if(image == null)
			{
				mv.addObject("msg", "이미지를 등록해주세요");
				return mv;
			}
			if(image.isEmpty())
			{
				mv.addObject("msg", "이미지를 등록해주세요");
				return mv;
			}
			
			String image_path = Fileupload.upload(request.getRealPath(File.separator), image);
			
			if(image_path.equals("error"))
			{
				mv.addObject("msg", "이미지 제목은 20 글자까지 가능하고, 최대 용량은 3MB입니다.");
				return mv;
			}
			else
			{
				try{
				String msg = accountInformationDao.updateBase(image_path,form_of_business,full_name,
						company_name,representative,gender,date_of_birth_year,date_of_birth_month,
						date_of_birth_day,address_sido,sigungu,address_detail,accountinfo.getPk());
					if(msg.equals("성공"))
					{
						mv.addObject("msg",msg);
						return mv;
					}
					else
					{
						mv.addObject("msg",msg);
						return mv;
					}
				}
				catch(Exception e)
				{
					mv.addObject("msg","에러가 발생했습니다.");
					return mv;
				}
			}
		}
		
		
		/*
		else if(submit_type.equals("email"))
		{
			accountInformationDao.updateEmail(email_subscription);
		}
		else if(submit_type.equals("connect"))
		{
			accountInformationDao.updateConnect(cell_phone_number_code, cell_phone_number_middle, cell_phone_number_end,
					phone_number_code, phone_number_entered, fax_number);
		}
		else
		{
			
		}*/
		
		//submit_type(base, connect, email)
		//base : image, form_of_business, full_name, company_name, representative, gender, date_of_birth_year, 
		//       date_of_birth_month, date_of_birth_day, address_sido, sigungu, address_detail
		//email : email_subscription
		
		// connect : cell_phone_number_code, cell_phone_number_middle, cell_phone_number_end
		//           phone_number_code, phone_number_entered, fax_number
		
		
		
		return mv;
	}
	/**
	 * 회원가입 페이지
	 */
	@RequestMapping(value = "/accounts/settings/relogin", method = RequestMethod.GET)
	public String AccountController_relogin_get(HttpServletRequest request) {
		logger.info("relogin Get Page");
		
		return "/accounts/settings/relogin";
	}
	/**
	 * 회원가입 페이지
	 */
	@RequestMapping(value = "/accounts/settings/verify_identity", method = RequestMethod.GET)
	public String AccountController_verify_identity_get(HttpServletRequest request) {
		logger.info("verify_identity Get Page");
		
		return "/accounts/settings/change";
	}
	
	/** 로그아웃 */
	@RequestMapping(value = "/accounts/logout", method = RequestMethod.GET)
	public String AccountController_logout(HttpServletRequest request) {
		logger.info("logout Page");
		
		request.getSession().invalidate();
		
		return "redirect:/index";
	}
	
}
