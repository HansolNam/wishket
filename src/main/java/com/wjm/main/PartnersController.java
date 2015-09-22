package com.wjm.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PartnersController {
	
	private static final Logger logger = LoggerFactory.getLogger(PartnersController.class);

	private static final boolean Available = false;
	
	/**
	 * 내 프로필 보기
	 */
	@RequestMapping(value = "/partners/p/{id}", method = RequestMethod.GET)
	public ModelAndView PartnersController_p(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("index Page");
		
		
		return mv;
	}
	/**
	 * 자기소개 보기
	 */
	@RequestMapping(value = "/partners/p/{id}/introduction", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_introduction(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("index Page");
		
		
		return mv;
	}
	
	/**
	 * 포트폴리오 보기
	 */
	@RequestMapping(value = "/partners/p/{id}/portfolio", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_portfolio(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("index Page");
		
		
		return mv;
	}
	
	
	/**
	 * 보유기술 보기
	 */
	@RequestMapping(value = "/partners/p/{id}/skill", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_skill(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("index Page");
		
		
		return mv;
	}
	
	/**
	 * 경력, 학력, 자격증 보기
	 */
	@RequestMapping(value = "/partners/p/{id}/background", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_background(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("index Page");
		
		
		return mv;
	}
	
	/**
	 * 평가 보기
	 */
	@RequestMapping(value = "/partners/p/{id}/evaluation", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_evaluation(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("index Page");
		
		
		return mv;
	}
	
	/**
	 * history 보기
	 */
	@RequestMapping(value = "/partners/p/{id}/history", method = RequestMethod.GET)
	public ModelAndView PartnersController_p_history(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("index Page");
		
		
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
		
		
		return mv;
	}


	/**
	 * 자기소개 정보 관리
	 */
	@RequestMapping(value = "/partners/p/{id}/introduction/update", method = RequestMethod.GET)
	public ModelAndView PartnersController_introductionupdate(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/introduction/update Page");
		
		
		return mv;
	}

	/**
	 * 자기소개 정보 추가
	 */
	@RequestMapping(value = "/partners/p/{id}/introduction/update/add", method = RequestMethod.GET)
	public ModelAndView PartnersController_introductionupdateadd(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/introduction/update/add Page");
		
		
		return mv;
	}
	
	/**
	 * 포트폴리오 관리
	 */
	@RequestMapping(value = "/partners/p/{id}/porfolio/update", method = RequestMethod.GET)
	public ModelAndView PartnersController_porfoliopdate(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/porfolio/update Page");
		
		
		return mv;
	}
	

	/**
	 * 포트폴리오 추가
	 */
	@RequestMapping(value = "/partners/p/{id}/porfolio/update/add", method = RequestMethod.GET)
	public ModelAndView PartnersController_porfolioupdateadd(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/porfolio/update/add Page");
		
		
		return mv;
	}
	
	/**
	 * 보유기술 관리
	 */
	@RequestMapping(value = "/partners/p/{id}/skill/update", method = RequestMethod.GET)
	public ModelAndView PartnersController_skillpdate(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/skill/update Page");
		
		
		return mv;
	}
	

	/**
	 * 보유기술 추가
	 */
	@RequestMapping(value = "/partners/p/{id}/skill/update/add", method = RequestMethod.GET)
	public ModelAndView PartnersController_skillupdateadd(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/skill/update/add Page");
		
		
		return mv;
	}
	
	/**
	 * 경력, 학력, 자격 정보 관리
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update", method = RequestMethod.GET)
	public ModelAndView PartnersController_backgroundupdate(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/info/update Page");
		
		
		return mv;
	}

	/**
	 * 경력 정보 추가
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update/add/employ", method = RequestMethod.GET)
	public ModelAndView PartnersController_backgroundupdateaddemploy(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/info/update/add/employ Page");
		
		
		return mv;
	}
	/**
	 * 자격증 정보 추가
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update/add/certify", method = RequestMethod.GET)
	public ModelAndView PartnersController_backgroundupdateaddcertify(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/info/update/add/certify Page");
		
		
		return mv;
	}
	/**
	 * 프로필 정보 추가
	 */
	@RequestMapping(value = "/partners/p/{id}/background/update/add/edu", method = RequestMethod.GET)
	public ModelAndView PartnersController_backgroundupdateaddedu(HttpServletRequest request, ModelAndView mv,
			@PathVariable("id") String id) {
		logger.info("/partners/p/{id}/info/update/add/edu Page");
		
		
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
