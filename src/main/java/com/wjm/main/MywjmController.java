package com.wjm.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wjm.dao.AccountDao;
import com.wjm.dao.AccountInformationDao;
import com.wjm.dao.AdditionDao;
import com.wjm.dao.ApplicantDao;
import com.wjm.dao.ContractDao;
import com.wjm.dao.NoticeDao;
import com.wjm.dao.ProjectDao;
import com.wjm.models.AccountInfo;
import com.wjm.models.AdditionInfo;
import com.wjm.models.ApplicantInfo;
import com.wjm.models.ContractInfo;
import com.wjm.models.NoticeInfo;
import com.wjm.models.ProjectInfo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MywjmController {
	
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
	private NoticeDao noticeDao;

	@Autowired
	private AdditionDao additionDao;
	
	@Autowired
	private ContractDao contractDao;
	/**
	 * 클라이언트 마이페이지
	 */
	@RequestMapping(value = "/mywjm/client", method = RequestMethod.GET)
	public ModelAndView MywjmController_mywjm_client(HttpServletRequest request, ModelAndView mv) {
		logger.info("mywjm client Page");
		
		AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
		
		List<ProjectInfo> projectlist;
		
		if(account != null)
			projectlist = projectDao.select(account.getPk());
		else
		{
			mv.setViewName("redirect:/accounts/login");
			return mv;
		}
		

		List<NoticeInfo> notice = noticeDao.select_limit(3);
		mv.addObject("notice",notice);
		
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

		mv.addObject("projectlist",projectlist);

		//결제 대기중인 추가요청
		List<AdditionInfo> additionlist = additionDao.selectStatusClient(account.getPk(), "결제대기중");
		mv.addObject("additionlist",additionlist);

		//결제 대기중인 프로젝트
		List<ContractInfo> waitlist = contractDao.selectReadyClient(account.getPk(),"결제대기중");
		mv.addObject("waitlist",waitlist);
		
		//진행중인 프로젝트
		List<ContractInfo> contractlist = contractDao.selectProgressClient(account.getPk(),"진행중");
		mv.addObject("contractlist",contractlist);
		
		//완료한 프로젝트
		contractlist = contractDao.selectCompletedClient(account.getPk(),"완료한프로젝트");
		int total = 0;
		
		if(contractlist != null)
		{
			for(int i=0;i<contractlist.size();i++)
			{
				logger.info("budget"+i+" : "+contractlist.get(i).getBudget());
				total += contractlist.get(i).getBudget();
			}
		}
		mv.addObject("total",total);
		return mv;
	}

	/**
	 * 지원자 마이페이지
	 */
	@RequestMapping(value = "/mywjm/partners", method = RequestMethod.GET)
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
			mv.setViewName("/error/404error");
			return mv;
		}
		
		List<NoticeInfo> notice = noticeDao.select_limit(3);
		mv.addObject("notice",notice);
		
		mv.addObject("profile",accountInformationDao.getProfileImg(account.getPk()));

		List<ProjectInfo> interest = applicantDao.getInterestProject(account.getPk());
		List<ApplicantInfo> apply = applicantDao.select_applicant(account.getPk(), "지원중");
		
		//진행중인 프로젝트
		List<ContractInfo> contractlist = contractDao.selectProgressPartners(account.getPk(),"진행중");

		mv.setViewName("/mywjm/partners");
		mv.addObject("interest",interest);
		mv.addObject("apply",apply);
		mv.addObject("contractlist",contractlist);
		
		mv.addObject("applynum", applicantDao.select_applicant_num(account.getPk()));
		mv.addObject("contractnum", contractDao.getPartnersContractCount(account.getPk(), "완료"));
		
		int total = 0;
		
		List<ContractInfo> completelist = contractDao.selectCompletedPartners(account.getPk(), "완료한프로젝트");
		if(completelist != null)
		{
			mv.addObject("completenum", completelist.size());

			for(int i=0;i<completelist.size();i++)
			{
				total += completelist.get(i).getBudget();
			}
		}
		else
			mv.addObject("completenum",0);
		
		mv.addObject("total",total);
		
		return mv;
	}
	/**
	 * 공지사항 보기 페이지
	 */
	@RequestMapping(value = "/mywjm/notice/preview/{pk}", method = RequestMethod.GET)
	public ModelAndView AdminController_notice_preview(HttpServletRequest request, ModelAndView mv,
			@PathVariable("pk") int pk) {
		logger.info("/mywjm/notice/preview/{pk} Page");
		
		NoticeInfo notice = noticeDao.select(pk);
		
		if(notice == null)
		{
			mv.setViewName("redirect:/index");
			return mv;
		}
		
		mv.addObject("notice",notice);
		
		
		mv.setViewName("/mywjm/notice/preview");
		return mv;
	}
}
