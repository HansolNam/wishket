package com.wjm.main.function;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.wjm.dao.ProjectDao;
import com.wjm.main.MywjmController;

@Component
public class Scheduler {
	
	private static final Logger logger = LoggerFactory.getLogger(Scheduler.class);

	@Autowired
	private ProjectDao projectDao;

	/**
	 * 초 분 시 일 월
	 * 00:00:00에 호출이 되는 스케쥴러 
	 */
	@Scheduled(cron = "0 00 00 * * *")
	public void projectScheduler(){
		logger.info("스케쥴러 호출");
		
		projectDao.updateStatusByScheduler();
	}
	
}