package com.wjm.main;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileUploadException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.wjm.dao.AccountDao;
import com.wjm.dao.AccountInformationDao;
import com.wjm.dao.AuthenticationDao;
import com.wjm.dao.BankDao;
import com.wjm.main.function.Mail;
import com.wjm.main.function.Validator;
import com.wjm.models.AccountInfo;
import com.wjm.models.AccountInformationInfo;
import com.wjm.models.AuthenticationInfo;

import net.sf.json.JSONObject;

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
	
	@Autowired
	private BankDao bankDao;
	

	@Autowired
	private AuthenticationDao authenticationDao;


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
	 * 알림 페이지
	 */
	@RequestMapping(value = "/accounts/notifications", method = RequestMethod.GET)
	public String MainController_notifications_get(HttpServletRequest request) {
		logger.info("notifications Get Page");
		
		return "/accounts/notifications";
	}
	/**
	 * 비밀번호 찾기 페이지
	 */
	@RequestMapping(value = "/accounts/password/reset", method = RequestMethod.GET)
	public String MainController_password_reset_get(HttpServletRequest request) {
		logger.info("password_reset_get Page");
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		
		if(account != null)
		{
			if(account.getAccount_type().equals("client"))
				return "redirect:/mywjm/client";
			else 
				return "redirect:/mywjm/partners";
		}
		
		return "/accounts/password/reset";
	}
	/**
	 * 비밀번호 찾기 처리 페이지
	 */
	@RequestMapping(value = "/accounts/password/reset", method = RequestMethod.POST)
	public ModelAndView MainController_notifications_post(HttpServletRequest request,
 			HttpServletResponse response,
 			ModelAndView mv,
			 @RequestParam("email") String email) {
		logger.info("reset POST Page");
		
		String newPassword = accountDao.reset_password(email);
		
		if(newPassword == null)
		{
			mv.addObject("messages","해당하는 이메일이 존재하지 않습니다.");
			return mv;
		}
		else
		{	        
	        logger.info("newPassword = "+newPassword);
			String result = sendMail("admin@wjm.com","gksthf1611@gmail.com","임시비밀번호는 "
					+newPassword+" 입니다.", "외주몬 임시 비밀번호 발송 메일입니다.");
			logger.info("메일 : "+result);
			
			if(result.equals("성공"))
				mv.addObject("messages","임시 비밀번호를 발송하였습니다.");
			else
				mv.addObject("messages","임시 비밀번호를 발송에 실패하였습니다.");
			
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		
	}
	/**
	 * 회원가입 인증 페이지
	 */
	@RequestMapping(value = "/accounts/reverify", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String MainController_reverify(HttpServletRequest request,
 			HttpServletResponse response) {
		logger.info("reverify get Page");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		//
		

	    JSONObject jObject = new JSONObject();
	    
	    
		Random random = new Random();
        int f = random.nextInt(1000);
        
        String key = accountDao.updateAuthenticationKey(account.getPk(),account.getEmail()+f);
        
        account.setAuthorization_key(key);
        logger.info("key = "+key);
		String result = sendMail("admin@wjm.com","gksthf1611@gmail.com","인증코드는 "
				+key+" 입니다.", "외주몬 회원가입 인증 메일입니다.");
		logger.info("메일 : "+result);
		
		if(result.equals("성공"))
			jObject.put("messages", "success");
		else
			jObject.put("messages", "fail");
		
		logger.info("jobject = "+jObject.toString());
		
		return jObject.toString();
	}
	/**
	 * 회원가입 인증 페이지
	 */
	@RequestMapping(value = "/accounts/signup_verify", method = RequestMethod.GET)
	public String MainController_signup_verify_get(HttpServletRequest request,
 			HttpServletResponse response) {
		logger.info("signup_verify get Page");
		
		
		return "/accounts/signup_verify";
	}
	/**
	 * 회원가입 인증 페이지
	 */
	@RequestMapping(value = "/accounts/signup_verify", method = RequestMethod.POST)
	public ModelAndView MainController_signup_verify_post(HttpServletRequest request,
 			HttpServletResponse response,
 			ModelAndView mv,
			 @RequestParam("verification") String verification) {
		logger.info("signup_verify Post Page");
		
		logger.info("verification = "+verification);
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null){mv.setViewName("redirect:/accounts/login");return mv;}
		
		String return_val = "";
		if(account.getAuthorization_key().equals(verification.trim()))
		{
			accountDao.updateAuthorized(account.getPk(), 1);
			account.setAuthorized(1);
			mv.addObject("messages","이메일 인증에 성공하셨습니다.");
			
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
		}
		else
		{
			mv.addObject("messages","이메일 인증에 실패했습니다.");
		}
		
		return mv;
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
		
		if(account.getAuthorized() == 0)
		{
			return_val = "/accounts/signup_verify";
		}
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
			AccountInfo account = accountDao.select(id);
			
			//헤딩 아이디가 존재하는 경우
			if(account != null)
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
			AccountInfo account = accountDao.select_email(email);
			//해당 이메일이 존재하는 경우
			if(account != null)
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
			
			AccountInfo account = accountDao.select(id);		

			Random random = new Random();
	        int f = random.nextInt(1000);
	        
	        String key = accountDao.updateAuthenticationKey(account.getPk(),account.getEmail()+f);
	        
	        account.setAuthorization_key(key);
	        logger.info("key = "+key);
			String result = sendMail("admin@wjm.com","gksthf1611@gmail.com","인증코드는 "
					+key+" 입니다.", "외주몬 회원가입 인증 메일입니다.");
			logger.info("메일 : "+result);
			
			if(result.equals("성공"))
			{
				request.getSession().setAttribute("account", account);
				mv.addObject("messages","회원가입에 성공하셨습니다. 이메일 인증을 해주세요.");
				mv.setViewName("/accounts/signup_verify");
			}
			
		}
		
		return mv;
	}
	
	/**
	 * 비밀번호 변경 페이지
	 */
	@RequestMapping(value = "/accounts/password/change", method = RequestMethod.GET)
	public String AccountController_password_change_get(HttpServletRequest request) {
		logger.info("/accounts/password/change Get Page");
		
		return "/accounts/password/change";
	}
	/**
	 * 비밀번호 변경 처리 페이지
	 */
	@RequestMapping(value ="/accounts/password/change", method = RequestMethod.POST)
	public ModelAndView AccountController_password_change_post(HttpServletRequest request,
 			ModelAndView mv,
			HttpServletResponse response,
			 @RequestParam("new_password1") String password,
			 @RequestParam("new_password2") String password_confirm
			) {
		logger.info("/accounts/password/change Post Page");
	
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null){mv.setViewName("redirect:/accounts/login");return mv;}
		
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

		//패스워드 체크
		if(password == null)
		{
			logger.info("패스워드 X");
			mv.addObject("messages", "패스워드를 입력해주세요.");
			return mv;
		}
		else if(password.isEmpty())
		{
			logger.info("패스워드 X");
			mv.addObject("messages", "패스워드를 입력해주세요.");
			return mv;
		}
		else if(password.length()<8 || password.length()>32)
		{			
			mv.addObject("messages","비밀번호는 8자 이상 32자 이하로 입력해 주세요.");
			return mv;
		}
		
		//패스워드 체크
		if(password_confirm == null)
		{
			logger.info("패스워드 X");
			mv.addObject("messages", "확인 패스워드를 입력해주세요.");
			return mv;
		}
		else if(password_confirm.isEmpty())
		{
			logger.info("패스워드 X");
			mv.addObject("messages", "확인 패스워드를 입력해주세요.");
			return mv;
		}
		else if(password.length()<8 || password.length()>32)
		{			
			mv.addObject("messages","확인 비밀번호는 8자 이상 32자 이하로 입력해 주세요.");
			return mv;
		}
		
		if(password.equals(password_confirm))
		{
			if(accountDao.change_password(account.getPk(), password))
			{
			mv.addObject("messages","비밀번호가 안전하게 변경되었습니다.");
			mv.setViewName("/accounts/settings/relogin");
			
			}
			else
			{
				mv.addObject("messages","비밀번호 변경에 실패했습니다.");
			}
			
		}
		else
		{
			mv.addObject("messages","패스워드가 일치하지 않습니다.");
		}
		
		return mv;
	}
				
	/**
	 * 계좌 등록 페이지
	 */
	@RequestMapping(value = "/accounts/settings/bank_account", method = RequestMethod.GET)
	public ModelAndView AccountController_bank_account_get(HttpServletRequest request,
			ModelAndView mv) {
		logger.info("bank_account Get Page");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null){mv.setViewName("redirect:/accounts/login");return mv;}
		
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));
		
		if(accountInformationDao.hasAccount(account.getPk()))
		{
			mv.addObject("hasAccount","true");
			logger.info("hasAccount : true");
			AccountInformationInfo accountinfo = accountInformationDao.select(account.getPk());

			String bank_name = accountinfo.getBank_name();
			String account_holder = accountinfo.getAccount_holder();
			String account_number = accountinfo.getAccount_number();

			mv.addObject("bank_name",bank_name);
			mv.addObject("bank_id",bankDao.select_name(bank_name));
			mv.addObject("account_holder",account_holder);
			mv.addObject("account_number",account_number);

		}
		else
		{
			mv.addObject("hasAccount","false");
			logger.info("hasAccount : false");
		}

		
		return mv;
	}
	
	/**
	 * 계좌 등록 처리 페이지
	 */
	@RequestMapping(value = "/accounts/settings/bank_account", method = RequestMethod.POST)
	public ModelAndView AccountController_bank_account_get(HttpServletRequest request,
 			HttpServletResponse response,
			 @RequestParam("bank") String bank,
			 @RequestParam("account_holder") String account_holder,
			 @RequestParam("account_number") String account_number,

			ModelAndView mv) {
		logger.info("bank_account Post Page");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		String bank_name = "";
		
		if(account == null){mv.setViewName("redirect:/accounts/login");return mv;}
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

		//은행명
		if(bank == null)
		{
			mv.addObject("messages","은행명을 선택해주세요.");
			return mv;
		}
		else if(bank.isEmpty())
		{
			mv.addObject("messages","은행명을 선택해주세요.");
			return mv;
		}
		else if(Validator.isDigit(bank))
		{
			bank_name = bankDao.select_pk(Integer.parseInt(bank));
			logger.info("은행명 : "+bank_name);
			mv.addObject("bank_name", bank_name);
			mv.addObject("bank_id", bank);
		}
		else
		{
			mv.addObject("messages","은행명을 올바르게 선택해주세요.");
			return mv;
		}
		
		//예금주
		if(account_holder == null)
		{
			mv.addObject("messages","예금주를 입력해주세요.");
			return mv;
		}
		else if(account_holder.isEmpty())
		{
			mv.addObject("messages","예금주를 입력해주세요.");
			return mv;
		}
		else if(Validator.isValidLength(account_holder, 1, 20) )
		{
			logger.info("예금주 : "+account_holder);
			mv.addObject("account_holder", account_holder);
		}
		else
		{
			mv.addObject("messages","예금주를 정상적으로 입력해주세요.");
			return mv;
		}
		
		
		//예금주
		if(account_number == null)
		{
			mv.addObject("messages","계좌번호를 입력해주세요.");
			return mv;
		}
		else if(account_number.isEmpty())
		{
			mv.addObject("messages","계좌번호를 입력해주세요.");
			return mv;
		}
		else if(!Validator.isDigit(account_number))
		{
			mv.addObject("messages","계좌번호는 '-'를 제외한 숫자만 가능합니다");
			return mv;
		}
		else if(Validator.isValidLength(account_number, 1, 40) )
		{
			logger.info("게좌번호 : "+account_number);
			mv.addObject("account_number", account_number);
		}
		else
		{
			mv.addObject("messages","계좌번호를 정상적으로 입력해주세요.");
			return mv;
		}
		
		accountInformationDao.updateBank(bank_name, account_holder, account_number, account.getPk());
		logger.info("정상적으로 게좌 등록");
		
		return mv;
	}
	/**
	 * 회원가입 페이지
	 */
	@RequestMapping(value = "/accounts/settings/profile", method = RequestMethod.GET)
	public ModelAndView AccountController_profile_get(HttpServletRequest request, ModelAndView mv,
			 @RequestParam(value = "msg", required = false, defaultValue = "") String msg
			) {
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
					logger.info("기본정보존재");
					mv.addObject("hasBasicInfo","true");
				}
				if(accountInformationDao.hasPhoneNum(account.getPk()))
				{
					logger.info("연락처정보존재");
					mv.addObject("hasPhoneNum","true");
				}
				if(account.getEmail()!=null)
				{
					logger.info("이메일존재");
					mv.addObject("hasEmail","true");
				}
				

				mv.addObject("img_path",accountinfo.getProfile_img());
				mv.addObject("form_of_business",accountinfo.getForm());
				mv.addObject("full_name",accountinfo.getName());
				mv.addObject("company_name",accountinfo.getCompany_name());
				mv.addObject("representative",accountinfo.getCompany_representative());
				mv.addObject("gender",accountinfo.getSex());
				
				
				String[] list = {"","",""};
				
				if(accountinfo.getBirth_date() != null)
					if(!accountinfo.getBirth_date().isEmpty())
						list = accountinfo.getBirth_date().split("-");
				
				mv.addObject("date_of_birth_year",list[0]);
				mv.addObject("date_of_birth_month",list[1]);
				mv.addObject("date_of_birth_day",list[2]);
				
				mv.addObject("address_sido",accountinfo.getRegionl());
				mv.addObject("sigungu",accountinfo.getRegionm());
				mv.addObject("address_detail",accountinfo.getRegionr());

				list[0]="";list[1]="";list[2]="";
				if(accountinfo.getCellphone_num() != null)
					if(!accountinfo.getCellphone_num().isEmpty())
						list = accountinfo.getCellphone_num().split("-");
				
				mv.addObject("cell_phone_number_code",list[0]);
				mv.addObject("cell_phone_number_middle",list[1]);
				mv.addObject("cell_phone_number_end",list[2]);
				
				String[] list2 = {"",""};

				if(accountinfo.getTelephone_num() != null)
					if(!accountinfo.getTelephone_num().isEmpty())
						list2 = accountinfo.getTelephone_num().split("-");

				mv.addObject("phone_number_code",list2[0]);
				mv.addObject("phone_number_entered",list2[1]);
				
				mv.addObject("fax_number",accountinfo.getFax_num());
				mv.addObject("email_subscription",accountinfo.getSubscription());
				mv.addObject("msg",msg);
			}
		}
		else
		{
			accountinfo = null;
			mv.setViewName("redirect:/accounts/login");
		}
			
		
		return mv;
	}
	
	/**
	 * 기본정보 수정
	 */
	
	@RequestMapping(value = "/accounts/settings/profile/base", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String AccountController_profile_post(HttpServletRequest request,
 			HttpServletResponse response,
 			@RequestParam(value = "image", required = false) MultipartFile image,
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
			 @RequestParam("submit_type") String submit_type
			) throws IOException, FileUploadException, ParseException  {
		logger.info("profile Base Post Page");
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");

		logger.info("image = "+image);
		logger.info("form_of_business = "+form_of_business);
		logger.info("full_name = "+full_name);
		logger.info("company_name = "+company_name);
		logger.info("representative = "+representative);
		logger.info("gender = "+gender);
		logger.info("date_of_birth_year = "+date_of_birth_year);
		logger.info("date_of_birth_month = "+date_of_birth_month);
		logger.info("date_of_birth_day = "+date_of_birth_day);
		logger.info("address_sido = "+address_sido);
		logger.info("sigungu = "+sigungu);
		logger.info("address_detail = "+address_detail);
		logger.info("submit_type = "+submit_type);
		
		if(account == null)
		{
			response.sendRedirect("redirect:/accounts/login");
		}
	    JSONObject jObject = new JSONObject();
		AccountInformationInfo accountinfo = accountInformationDao.select(account.getPk());
		
		if(accountinfo == null)
		{
			accountInformationDao.create(account.getPk());
			accountinfo = accountInformationDao.select(account.getPk());
		}
		if(submit_type.equals("base"))
		{
			try{
				String pre_img_path = accountinfo.getProfile_img();
			String msg = accountInformationDao.updateBase(image,pre_img_path,form_of_business,full_name,
					company_name,representative,gender,date_of_birth_year,date_of_birth_month,
					date_of_birth_day,address_sido,sigungu,address_detail,accountinfo.getPk(),
					request.getRealPath("") + "\\", account.getId());
				if(msg.equals("성공"))
				{
					jObject.put("msg","success");

				}
				else
				{
					jObject.put("msg",msg);
					return jObject.toString();
				}
			}
			catch(Exception e)
			{
				jObject.put("msg","에러가 발생했습니다.");
				return jObject.toString();
			}
			
		}
		else
		{
			jObject.put("msg","올바르지 않은 접근입니다");
			return jObject.toString();
		}
		

		if(accountInformationDao.hasBasicInfo(account.getPk()))
		{
			jObject.put("hasBasicInfo","true");
		}
		
		jObject.put("accountinfo", accountInformationDao.select(account.getPk()));
		logger.info("jObject = "+jObject.toString());

		return jObject.toString();
		
	}
	
	@RequestMapping(value = "/accounts/settings/profile/connect", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String AccountController_profile_connect(HttpServletRequest request,
 			HttpServletResponse response,
 			 @RequestParam(value = "cell_phone_number_code", required = false, defaultValue = "") String cell_phone_number_code,
			 @RequestParam(value = "cell_phone_number_middle", required = false, defaultValue = "") String cell_phone_number_middle,
			 @RequestParam(value = "cell_phone_number_end", required = false, defaultValue = "") String cell_phone_number_end,
			 @RequestParam(value = "phone_number_code", required = false, defaultValue = "") String phone_number_code,
			 @RequestParam(value = "phone_number_entered", required = false, defaultValue = "") String phone_number_entered,
			 @RequestParam(value = "fax_number", required = false, defaultValue = "") String fax_number,
			 @RequestParam("submit_type") String submit_type
			) throws IOException, FileUploadException, ParseException  {
		logger.info("profile connect Post Page");
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");

		logger.info("cell_phone_number_code = "+cell_phone_number_code);
		logger.info("cell_phone_number_middle = "+cell_phone_number_middle);

		logger.info("cell_phone_number_end = "+cell_phone_number_end);

		logger.info("phone_number_code = "+phone_number_code);
		logger.info("phone_number_entered = "+phone_number_entered);
		logger.info("fax_number = "+fax_number);
		logger.info("submit_type = "+submit_type);
		
		if(account == null)
		{
			response.sendRedirect("redirect:/accounts/login");
		}
	    JSONObject jObject = new JSONObject();
		AccountInformationInfo accountinfo = accountInformationDao.select(account.getPk());
		
		if(accountinfo == null)
		{
			accountInformationDao.create(account.getPk());
			accountinfo = accountInformationDao.select(account.getPk());
		}
		
		if(submit_type.equals("connect"))
		{
			String msg = accountInformationDao.updateConnect(cell_phone_number_code, cell_phone_number_middle, cell_phone_number_end,
					phone_number_code, phone_number_entered, fax_number, accountinfo.getPk());
			if(msg.equals("성공"))
			{
				jObject.put("msg","success");
			}
			else
			{
				jObject.put("msg",msg);
				return jObject.toString();
			}
		}
		else
		{
			jObject.put("msg","올바르지 않은 접근입니다");
			return jObject.toString();
		}

		if(accountInformationDao.hasPhoneNum(account.getPk()))
		{
			jObject.put("hasPhoneNum","true");
		}

		jObject.put("accountinfo", accountInformationDao.select(account.getPk()));
		logger.info("jObject = "+jObject.toString());

		return jObject.toString();
		
		
	}
	@RequestMapping(value = "/accounts/settings/profile/email", method = RequestMethod.POST, produces = "text/json; charset=utf8")
	@ResponseBody
	public String AccountController_profile_post(HttpServletRequest request,
 			HttpServletResponse response,
			 @RequestParam(value = "email_subscription", required = false, defaultValue = "") String email_subscription,
			 @RequestParam("submit_type") String submit_type
			) throws IOException, FileUploadException, ParseException  {
		logger.info("profile email Post Page");
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");

		logger.info("email_subscription = "+email_subscription);
		logger.info("submit_type = "+submit_type);
		
		if(account == null)
		{
			response.sendRedirect("redirect:/accounts/login");
		}
	    JSONObject jObject = new JSONObject();
		AccountInformationInfo accountinfo = accountInformationDao.select(account.getPk());
		
		if(accountinfo == null)
		{
			accountInformationDao.create(account.getPk());
			accountinfo = accountInformationDao.select(account.getPk());
		}
		
		if(submit_type.equals("email"))
		{
			String msg = accountInformationDao.updateEmail(email_subscription, accountinfo.getPk());
			if(msg.equals("성공"))
			{		
				jObject.put("msg","success");
			}
			else
			{
				jObject.put("msg",msg);
				return jObject.toString();
			}
		}
		else
		{
			jObject.put("msg","올바르지 않은 접근입니다");
			return jObject.toString();
		}
		
		jObject.put("accountinfo", accountInformationDao.select(account.getPk()));

		logger.info("jObject = "+jObject.toString());
		
		return jObject.toString();
		
		
	}
	/**
	 * 재로그인 페이지
	 */
	@RequestMapping(value = "/accounts/settings/relogin", method = RequestMethod.GET)
	public ModelAndView AccountController_relogin_get(HttpServletRequest request,ModelAndView mv) {
		logger.info("relogin Get Page");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null){mv.setViewName("redirect:/accounts/login");return mv;}

		AccountInformationInfo accountinfo = accountInformationDao.select(account.getPk());
		
		mv.addObject("name",accountinfo.getName());
		
		return mv;
	}
	/**
	 * 재로그인 처리 페이지
	 */
	@RequestMapping(value = "/accounts/settings/relogin", method = RequestMethod.POST)
	public ModelAndView AccountController_relogin_post(HttpServletRequest request
			,ModelAndView mv,
 			HttpServletResponse response,
			 @RequestParam("password") String password) {
		logger.info("relogin POST Page");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		String email = "";
		if(account == null){mv.setViewName("redirect:/accounts/login");return mv;}
		else email = account.getEmail();

		//이메일 체크
		if(email == null)
		{
			mv.addObject("messages", "이메일을 입력해주세요.");
			return mv;
		}
		else if(email.isEmpty())
		{
			mv.addObject("messages", "이메일을 입력해주세요.");
			return mv;
		}
		if(!Validator.isEmail(email))
		{			
			mv.addObject("messages", "이메일을 올바르게 입력해주세요.");
			return mv;
		}

		//패스워드 체크
		if(password == null)
		{
			logger.info("패스워드 X");
			mv.addObject("messages", "패스워드를 입력해주세요.");
			return mv;
		}
		else if(password.isEmpty())
		{
			logger.info("패스워드 X");
			mv.addObject("messages", "패스워드를 입력해주세요.");
			return mv;
		}
		else if(password.length()<8 || password.length()>32)
		{			
			mv.addObject("messages","비밀번호는 8자 이상 32자 이하로 입력해 주세요.");
			return mv;
		}
		
		//로그인 체크
		account = (AccountInfo)accountDao.login_email(email, password);
		//로그인 실패
		if(account == null)
		{
			mv.addObject("messages", "비밀번호를 확인하세요.");
			return mv;
		}
		else
		{
			mv = new ModelAndView();
			mv.setViewName("redirect:/accounts/password/change");
			return mv;
		}
	}
	/**
	 * 신원 인증
	 */
	@RequestMapping(value = "/accounts/settings/verify_identity", method = RequestMethod.GET)
	public ModelAndView AccountController_verify_identity_get(HttpServletRequest request,
			ModelAndView mv) {
		logger.info("verify_identity Get Page");

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null){mv.setViewName("redirect:/accounts/login");return mv;}

		AccountInformationInfo accountinfo = accountInformationDao.select(account.getPk());
		mv.addObject("accountinfo",accountinfo);
		
		if(accountInformationDao.hasBasicInfo(account.getPk()))
		{
			logger.info("기본정보 가지고 있음");
			mv.addObject("hasBasicInfo","true");
			
			//신원 인증 정보 가져옴
			AuthenticationInfo authenticaitoninfo = authenticationDao.select(account.getPk());
			
			logger.info("email_for_tax : "+ authenticaitoninfo.getEmail_for_tax() );
			
			if(authenticaitoninfo.getIdentity_doc() != null)
			{
				mv.addObject("authenticatoninfo",authenticaitoninfo);
				logger.info("인증 정보 가지고 잇음");
				if(accountinfo.getIdentity_authentication().equals("검수중") )
				{
					logger.info("인증 상태 : 검수중");
					mv.addObject("hasAuthentication","true");
					mv.addObject("messages","신원 인증 처리중입니다.");
				}
				else if(accountinfo.getIdentity_authentication().equals("인증완료") )
				{
					logger.info("인증 상태 : 인증완료");
					mv.addObject("hasAuthentication","true");
					mv.addObject("messages","신원 인증이 완료되었습니다.");
				}
				else if(accountinfo.getIdentity_authentication().equals("인증실패") )
				{
					logger.info("인증 상태 : 인증실패");
					mv.addObject("messages","신원 인증에 실패했습니다. 관리자에게 문의해주세요.");
				}
				else
				{
					logger.info("인증 상태 : 미인증");
				}
			}
				
		}
		else
			mv.addObject("messages","기본 정보를 입력하지 않았습니다. 기본 정보 입력 후에 인증 신청이 가능합니다. <a class='alert-link'"+
						"href='/wjm/accounts/settings/profile/'>[기본정보입력하기]</a>");
		
		return mv;
	}
	
	/**
	 * 신원 인증 처리
	 * @throws IOException 
	 */
	@RequestMapping(value = "/accounts/settings/verify_identity", method = RequestMethod.POST)
	public ModelAndView AccountController_verify_identity_post(HttpServletRequest request
			,ModelAndView mv,
 			HttpServletResponse response,
			 @RequestParam(value = "user_type", required = false, defaultValue = "") String user_type
			 ,@RequestParam("image") MultipartFile image
			 ,@RequestParam("representer_name") String representer_name
			 ,@RequestParam("address_detail") String address_detail
			 ,@RequestParam("email_for_tax") String email_for_tax
			 ,@RequestParam(value = "identify_number", required = false, defaultValue = "") String identify_number
			 ,@RequestParam(value = "company_name", required = false, defaultValue = "") String company_name
			) throws FileUploadException, IOException{
			logger.info("verify_identity POST Page");


			
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		if(account == null){mv.setViewName("redirect:/accounts/login");return mv;}

		AccountInformationInfo accountinfo = accountInformationDao.select(account.getPk());
		if(accountinfo == null){mv.setViewName("redirect:/accounts/login");return mv;}
		
		mv.addObject("accountinfo",accountinfo);
		mv.addObject("hasBasicInfo","true");

		
		String form = accountinfo.getForm();

		String real_path = request.getRealPath(File.separator);

		try{
			String msg = authenticationDao.updateIdentity_authentication(form,user_type,image,real_path,account.getId(),representer_name,address_detail,email_for_tax,identify_number,company_name,account.getPk());
			if(msg.equals("성공"))
			{

				accountInformationDao.updateIdentity_authentication(account.getPk(),"검수중");

				mv.addObject("messages","정상적으로 등록되었습니다.");
				mv.addObject("hasAuthentication","true");
				mv.addObject("authenticatoninfo", authenticationDao.select(account.getPk()));
				return mv;
			}
			else
			{
				mv.addObject("user_type",user_type);
				mv.addObject("representer_name",representer_name);
				mv.addObject("address_detail",address_detail);
				mv.addObject("email_for_tax",email_for_tax);
				mv.addObject("identify_number",identify_number);
				mv.addObject("company_name",company_name);
				
				mv.addObject("messages",msg);
				return mv;
			}
		}
		catch(Exception e)
		{
			mv.addObject("messages","에러가 발생했습니다.");
			return mv;
		}
	
	}

	/** 로그아웃 */
	@RequestMapping(value = "/accounts/logout", method = RequestMethod.GET)
	public ModelAndView AccountController_logout(HttpServletRequest request, ModelAndView mv) {
		logger.info("logout Page");
		
		request.getSession().invalidate();
		
		mv.addObject("messages", "로그아웃 되었습니다.");
		mv.setViewName("redirect:/accounts/login");
		
		return mv;
	}

}
