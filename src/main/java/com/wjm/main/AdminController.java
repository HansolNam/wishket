package com.wjm.main;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileUploadException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.wjm.dao.AccountDao;
import com.wjm.dao.AccountInformationDao;
import com.wjm.dao.ApplicantDao;
import com.wjm.dao.AuthenticationDao;
import com.wjm.dao.ContractDao;
import com.wjm.dao.NoticeDao;
import com.wjm.dao.ProjectDao;
import com.wjm.main.function.Fileupload;
import com.wjm.main.function.Validator;
import com.wjm.models.AccountInfo;
import com.wjm.models.AccountInformationInfo;
import com.wjm.models.ContractInfo;
import com.wjm.models.NoticeInfo;
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
	@Autowired
	private ContractDao contractDao;
	@Autowired
	private NoticeDao noticeDao;
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
		
		List<ContractInfo> contractlist = contractDao.selectStatusAdmin("계약진행중");
		mv.addObject("contractlist",contractlist);

		List<ContractInfo> progresslist = contractDao.selectProgressProjectAdmin();
		mv.addObject("progresslist",progresslist);
		
		List<NoticeInfo> noticelist = noticeDao.select_limit(3);
		mv.addObject("noticelist",noticelist);

		mv.setViewName("/admin/home");
		return mv;
	}
	
	////////////////////////////////////////프로젝트 검수//////////////////////////////////////////
	
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
			mv.setViewName("/error/404error");
		
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
			mv.setViewName("/error/404error");
		
		//알림
		
		projectDao.updateStatus(pk,"등록실패");
		
		mv.setViewName("redirect:/admin/home");
		
		return mv;
	}
	
	////////////////////////////////////사용자 계정 정보////////////////////////////////////////
	
	/**
	 * 계정 정보 페이지
	 */
	@RequestMapping(value = "/admin/accounts/profile/{pk}", method = RequestMethod.GET)
	public ModelAndView AdminController_accounts_profile(HttpServletRequest request, 
			ModelAndView mv,
			@PathVariable("pk") int pk) {
		logger.info("/admin/accounts/profile Page");
		
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
	@RequestMapping(value = "/admin/accounts/bank_account/{pk}", method = RequestMethod.GET)
	public ModelAndView AdminController_accounts_bank_account(HttpServletRequest request, ModelAndView mv,
			@PathVariable("pk") int pk) {
		logger.info("/admin/accounts/bank_account Page");

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
	 * 미팅 후 계약 성공
	 */
	@RequestMapping(value = "/admin/contract/success/{project_pk}/{client_pk}/{partners_pk}", method = RequestMethod.GET)
	public ModelAndView AdminController_contract_success(HttpServletRequest request,
			@PathVariable("project_pk") int project_pk, 
			@PathVariable("client_pk") int client_pk, 
			@PathVariable("partners_pk") int partners_pk, 
			ModelAndView mv) {
		logger.info("/admin/contract/success/{project_pk}/{client_pk}/{partners_pk}");
		
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
	 * 미팅 후 계약 성공 처리
	 */
	@RequestMapping(value = "/admin/contract/success/{project_pk}/{client_pk}/{partners_pk}", method = RequestMethod.POST)
	public ModelAndView AdminController_contract_success_post(HttpServletRequest request,
			@PathVariable("project_pk") int project_pk, 
			@PathVariable("client_pk") int client_pk, 
			@PathVariable("partners_pk") int partners_pk, 
			ModelAndView mv,
			 @RequestParam("budget") int budget,
			 @RequestParam("term") int term) {
		logger.info("/admin/contract/success/{project_pk}/{client_pk}/{partners_pk} post page");
		
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
		contractDao.updateRemianContractFail(project_pk);
		
		//해당 파트너스의 지원자 상태 "완료"로 변경
		applicantDao.updateStatusSuccess(partners_pk, "완료");
		
		//나머지 프로젝트의 지원자 상태가 "지원중"이면 "지원종료"로 변경
		applicantDao.updateRemianApplicantFail(project_pk);
		
		//프로젝트의 상태 "진행중"으로 변경
		projectDao.updateStatus(project_pk,"진행중");
		
		mv.setViewName("redirect:/admin/home");
		return mv;
	}

	/**
	 * 승인 후 프로젝트 완료 처리
	 */
	@RequestMapping(value = "/admin/project/complete/success/{project_pk}/{client_pk}/{partners_pk}", method = RequestMethod.GET)
	public ModelAndView AdminController_project__complete_success_post(HttpServletRequest request,
			@PathVariable("project_pk") int project_pk, 
			@PathVariable("client_pk") int client_pk, 
			@PathVariable("partners_pk") int partners_pk, 
			ModelAndView mv) {
		
		logger.info("/admin/project/complete/success/{project_pk}/{client_pk}/{partners_pk} post page");
		
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
		
		//프로젝트의 상태 "완료한프로젝트"로 변경
		projectDao.updateStatus(project_pk,"완료한프로젝트");
		
		mv.setViewName("redirect:/admin/home");
		return mv;
	}
	
	//////////////////////////////////////////공지사항///////////////////////////////////////////
	/**
	 * 공지사항 등록 페이지
	 */
	@RequestMapping(value = "/admin/notice/add", method = RequestMethod.GET)
	public ModelAndView AdminController_notice_add(HttpServletRequest request, ModelAndView mv) {
		logger.info("/admin/notice/add Page");
		
		mv.setViewName("/admin/notice/add");
		return mv;
	}
	/**
	 * 공지사항 보기 페이지
	 */
	@RequestMapping(value = "/admin/notice/preview/{pk}", method = RequestMethod.GET)
	public ModelAndView AdminController_notice_preview(HttpServletRequest request, ModelAndView mv,
			@PathVariable("pk") int pk) {
		logger.info("/admin/notice/preview/{pk} Page");
		
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
			@PathVariable("pk") int pk) {
		logger.info("/admin/notice/add post Page");
		
		logger.info("pk = "+pk);
		logger.info("title = "+title);
		logger.info("editor : "+editor);
		
		NoticeInfo notice = new NoticeInfo(pk, title, editor, null);
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
		noticeDao.update(pk, title, editor);
		
		mv = new ModelAndView();
		mv.setViewName("redirect:/admin/home");
		return mv;
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
