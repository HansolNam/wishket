package com.wjm.models;

import java.sql.Timestamp;

public class EducationInfo {
	private int pk;
	private int account_pk;
	private String school_name;
	private String major;
	private String level;
	private String state;
	private String start_date;
	private String end_date;
	public EducationInfo(int pk, int account_pk, String school_name, String major, String level, String state,
			String start_date, String end_date) {
		super();
		this.pk = pk;
		this.account_pk = account_pk;
		this.school_name = school_name;
		this.major = major;
		this.level = level;
		this.state = state;
		this.start_date = start_date;
		this.end_date = end_date;
	}
	public int getPk() {
		return pk;
	}
	public void setPk(int pk) {
		this.pk = pk;
	}
	public int getAccount_pk() {
		return account_pk;
	}
	public void setAccount_pk(int account_pk) {
		this.account_pk = account_pk;
	}
	public String getSchool_name() {
		return school_name;
	}
	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	
}
