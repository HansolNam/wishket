package com.wjm.main;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URISyntaxException;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.client.ClientProtocolException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wjm.dao.AccountDao;
import com.wjm.dao.ProjectDao;
import com.wjm.main.function.Validator;
import com.wjm.models.AccountInfo;
import com.wjm.models.ProjectInfo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	   
	@Autowired
	private AccountDao accountDao;

	@Autowired
	private ProjectDao projectDao;

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
	 * index
	 * @throws URISyntaxException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView MainController_index(HttpServletRequest request, ModelAndView mv) throws ClientProtocolException, URISyntaxException, IOException {
		logger.info("index Page");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");

		if(account != null) {
			if(account.getAccount_type().equals("client"))
			{
				mv.setViewName("redirect:/mywjm/client");
				return mv;
			}
			else if(account.getAccount_type().equals("partners"))
			{
				mv.setViewName("redirect:/mywjm/partners");
				return mv;
			}
			else if(account.getAccount_type().equals("admin"))
			{
				mv.setViewName("redirect:/admin/home");
				return mv;
			}
		}
		
		int projectnum = projectDao.countAll();
		int projectbudget = projectDao.getAllBudget();
		int partnersnum = accountDao.getPartnersCount("","");
		
		logger.info("등록된 프로젝트 : "+projectnum);
		logger.info("파트너스 계정 수 : "+partnersnum);
		logger.info("프로젝트 등록 금액 : "+projectbudget);
		
		//최근 프로젝트
		List<ProjectInfo> projectlist = projectDao.selectRecentProject(6);
		
		mv.addObject("projectnum", projectnum);
		mv.addObject("projectbudget", projectbudget);
		mv.addObject("partnersnum" , partnersnum);
		mv.addObject("projectlist", projectlist);
		
		
		return mv;
	}
	/**
	 * download
	 * @throws IOException 
	 */
	@RequestMapping(value = "/Filedownload", method = RequestMethod.GET)
	public ModelAndView MainController_download(HttpServletRequest request, 
			ModelAndView mv,
			@RequestParam("filename") String filename,
			HttpServletResponse response
			) throws IOException  {
		logger.info("download Page");
		
		logger.info("filename = "+filename);

		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");

		if(account == null) {
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		
		if(!Validator.hasValue(filename)){
			mv.setViewName("redirect:/error/error");
			return mv;
		}
		
		String saveDir = request.getRealPath("");
		saveDir += "\\resources\\upload\\file\\";

		File file = new File(saveDir + filename);
		logger.info("saveDir = "+saveDir);
		
		//MIMTYPE 설정
		response.setContentType("application/octet-stream");
		
		//다운로드 파일명 설정
		String downName = null;
		if(request.getHeader("user-agent").indexOf("MSIE") == -1)
		{
			downName = new String(filename.getBytes("UTF-8"), "8859_1");
		}
		else
		{
			downName = new String(filename.getBytes("EUC-KR"), "8859_1");
		}
		
		//무조건 다운로드 하도록 설정
		response.setHeader("Content-Disposition","attachment;filename=\"" + downName + "\";");
		
		// ⑥ 요청된 파일을 읽어서 클라이언트쪽으로 저장한다.
		try{
		FileInputStream fileInputStream = new FileInputStream(file);
		ServletOutputStream servletOutputStream = response.getOutputStream();
		
		byte b [] = new byte[1024];
		int data = 0;
		
		while((data=(fileInputStream.read(b, 0, b.length))) != -1)
		{
			servletOutputStream.write(b, 0, data);
		}
		
		servletOutputStream.flush();
		servletOutputStream.close();
		fileInputStream.close();
		
		}
		catch(Exception e)
		{
			logger.info("에러");
		}
		return null;
	}
	/**
	 * footer ȭ��
	 */
	@RequestMapping(value = "/footer", method = RequestMethod.GET)
	public String MainController_footer(HttpServletRequest request) {
		logger.info("footer Page");
		
		return "footer";
	}
	/**
	 * ������Ʈ ȭ��
	 */
	@RequestMapping(value = "/project", method = RequestMethod.GET)
	public String MainController_project(HttpServletRequest request) {
		logger.info("project Page");
		
		return "project";
	}
	
	/**
	 * ��Ʈ�ʽ� ȭ��
	 */
	@RequestMapping(value = "/partners", method = RequestMethod.GET)
	public ModelAndView MainController_partners(HttpServletRequest request, ModelAndView mv,
			@RequestParam(value = "page", required = false, defaultValue ="1") String page,
			@RequestParam(value = "q", required = false, defaultValue ="") String q,
			@RequestParam(value = "job", required = false, defaultValue ="") String job
			) {
		logger.info("partners Page");
		
		logger.info("page = "+page);
		logger.info("q = "+q);
		logger.info("job = "+job);
		
		if(!Validator.isDigit(page))
		{
			mv.addObject("messages","페이지 번호는 숫자만 가능합니다.");
			return mv;
		}
		
		Integer partnersnum = accountDao.getPartnersCount(q,job);
		
		logger.info("partners 명수 : "+partnersnum);
		List<AccountInfo> partnerslist = accountDao.selectPartners(page,q,job);
		
		mv.addObject("page",Integer.parseInt(page));
		mv.addObject("partnersnum",partnersnum);
		mv.addObject("partnerslist", partnerslist);

		mv.setViewName("/partners");
		return mv;
	}
	/**
	 * 404error
	 */
	@RequestMapping(value = "/error/400error", method = RequestMethod.GET)
	public String MainController_400error(HttpServletRequest request) {
		logger.info("400 error Page");
		
		return "/error/400error";
	}
	/**
	 * 403error
	 */
	@RequestMapping(value = "/error/403error", method = RequestMethod.GET)
	public String MainController_403error(HttpServletRequest request) {
		logger.info("403 error Page");
		
		return "/error/403error";
	}
	/**
	 * 404error
	 */
	@RequestMapping(value = "/error/404error", method = RequestMethod.GET)
	public String MainController_404error(HttpServletRequest request) {
		logger.info("404 error Page");
		
		return "/error/404error";
	}
	/**
	 * 500error
	 */
	@RequestMapping(value = "/error/500error", method = RequestMethod.GET)
	public String MainController_500error(HttpServletRequest request) {
		logger.info("500 error Page");
		
		return "/error/500error";
	}
	/**
	 * 예외 발생
	 */
	@RequestMapping(value = "/error/error", method = RequestMethod.GET)
	public String MainController_error(HttpServletRequest request) {
		logger.info("Exception Page");
		
		return "/error/error";
	}

	/**
	 * ���� �Ұ� ȭ��
	 */
	@RequestMapping(value = "/service-intro", method = RequestMethod.GET)
	public String MainController_serviceintro(HttpServletRequest request) {
		logger.info("service-intro Page");
		
		return "service-intro";
	}

	/**
	 * Ŭ���̾�Ʈ �̿��� ȭ��
	 */
	@RequestMapping(value = "/client-use", method = RequestMethod.GET)
	public String MainController_clientuse(HttpServletRequest request) {
		logger.info("client-use Page");
		
		return "client-use";
	}

	/**
	 * ��Ʈ�ʽ� �̿��� ȭ��
	 */
	@RequestMapping(value = "/partners-use", method = RequestMethod.GET)
	public String MainController_partnersuse(HttpServletRequest request) {
		logger.info("partners-use Page");
		
		return "partners-use";
	}

	/**
	 * �̿��� ȭ��
	 */
	@RequestMapping(value = "/service-fee", method = RequestMethod.GET)
	public String MainController_servicefee(HttpServletRequest request) {
		logger.info("service-fee Page");
		
		return "service-fee";
	}

	/**
	 * ���� ���� ���� ȭ��
	 */
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String MainController_faq(HttpServletRequest request) {
		logger.info("faq Page");
		
		return "faq";
	}
	
	/**
	 * �̿���
	 */
	@RequestMapping(value = "/terms-of-service", method = RequestMethod.GET)
	public String MainController_termsofservice(HttpServletRequest request) {
		logger.info("terms-of-service Page");
		
		return "terms-of-service";
	}
	/**
	 * ����������ȣ
	 */
	@RequestMapping(value = "/privacy", method = RequestMethod.GET)
	public String MainController_privacy(HttpServletRequest request) {
		logger.info("privacy Page");
		
		return "privacy";
	}

	/**
	 * test
	 */
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String MainController_test(HttpServletRequest request) {
		logger.info("test Page");

		return "test";
	}
}
