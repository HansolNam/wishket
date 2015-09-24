package com.wjm.main.function;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Time {
	static public String toString1(Date date){
		SimpleDateFormat sd1 = new SimpleDateFormat ( "yyyy-MM-dd");
		return sd1.format(date);
	}

	static public String toString2(Date date){
		SimpleDateFormat sd2 = new SimpleDateFormat ( "yyyy년 MM월 dd일 E요일");
		return sd2.format(date);
	}
	
	static public String toString3(Timestamp timestamp){
		
		SimpleDateFormat sd2 = new SimpleDateFormat ( "yyyy년 MM월 dd일");
		Date date = new Date(timestamp.getTime());
		return sd2.format(date);
	}
	static public String toString4(Timestamp timestamp){
		SimpleDateFormat sd2 = new SimpleDateFormat ( "yyyy_MM_dd_hh_mm_ss");
		Date date = new Date(timestamp.getTime());
		return sd2.format(date);
	}
	static public String toString5(Timestamp timestamp){
		SimpleDateFormat sd2 = new SimpleDateFormat ( "yyyy년 MM월");
		Date date = new Date(timestamp.getTime());
		return sd2.format(date);
	}
	
	
	static public Date nextDate(int iDay)
	{
		Date next = new Date();
		next.setTime(next.getTime() + ((long)1000*60*60*24*iDay));
		
		return next;
	}
	
	static public Timestamp dateToTimestamp(String today) throws ParseException
	{
		SimpleDateFormat sd1 = new SimpleDateFormat ( "yyyy-MM-dd");
		Date date = sd1.parse(today);
		Timestamp timestamp = new java.sql.Timestamp(date.getTime());
		
		return timestamp;
	}

	static public Timestamp dateToTimestamp3(String today) throws ParseException
	{
		SimpleDateFormat sd1 = new SimpleDateFormat ( "yyyy년 MM월 dd일");
		Date date = sd1.parse(today);
		Timestamp timestamp = new java.sql.Timestamp(date.getTime());
		
		return timestamp;
	}
	static public Timestamp dateToTimestamp5(String today) throws ParseException
	{
		SimpleDateFormat sd1 = new SimpleDateFormat ( "yyyy년 MM월");
		Date date = sd1.parse(today);
		Timestamp timestamp = new java.sql.Timestamp(date.getTime());
		
		return timestamp;
	}
	
	static public int remainDate(Timestamp deadline, Timestamp now)
	{
		long remain_long = (deadline.getTime() - now.getTime())/((long)1000*60*60*24);
		
		return (int)remain_long;
	}
	
	static public String remainWeekDate(int remainDate)
	{	
		int week = remainDate / 7;
		int day = remainDate % 7;
		
		if(week == 0)
			return day+"일";
		else
			return week+"주 "+day+"일";
	}
	
	static public String TimestampToString(Timestamp timestamp)
	{
		SimpleDateFormat sd1 = new SimpleDateFormat ( "yyyy-MM-dd");
		Date date = new Date(timestamp.getTime());
		
		return sd1.format(date);
		
	}
	
	static public Timestamp getCurrentTimestamp()
	{
		long now = System.currentTimeMillis();
		
		return new Timestamp(now);
	}
	
	static public boolean isCompare(Timestamp a, Timestamp b)
	{
		if(a.getTime()<=b.getTime())
			return true;
		else
			return false;
	}
	
}
