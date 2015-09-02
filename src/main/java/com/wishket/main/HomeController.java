package com.wishket.main;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wishket.dao.ActivityDao;
import com.wishket.models.ActivityInfo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	   
	@Autowired
	private ActivityDao activityDao;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		/*
		List<ActivityInfo> aaa= activityDao.select(1);
		
		for(int i=0;i<aaa.size();i++)
			logger.info(i+" : "+aaa.get(i).getActivity_name());*/
		
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}
	

	@RequestMapping(value = "/test_1", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	public String MainController_test_1(HttpServletRequest request) {
		logger.info("test_1 Page");
		
		return "test_1";
	}
	
}
