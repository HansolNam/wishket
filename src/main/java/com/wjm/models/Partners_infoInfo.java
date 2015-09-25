package com.wjm.models;

import java.sql.Timestamp;

public class Partners_infoInfo {
	private int pk;
	private int account_pk;
	private String job;
	private String job_subcategory_develop;
	private String job_subcategory_design;
	private String availability;
	private Timestamp reg_date;
	public Partners_infoInfo(int pk, int account_pk, String job, String job_subcategory_develop,
			String job_subcategory_design, String availability, Timestamp reg_date) {
		super();
		this.pk = pk;
		this.account_pk = account_pk;
		this.job = job;
		this.job_subcategory_develop = job_subcategory_develop;
		this.job_subcategory_design = job_subcategory_design;
		this.availability = availability;
		this.reg_date = reg_date;
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
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getJob_subcategory_develop() {
		return job_subcategory_develop;
	}
	public void setJob_subcategory_develop(String job_subcategory_develop) {
		this.job_subcategory_develop = job_subcategory_develop;
	}
	public String getJob_subcategory_design() {
		return job_subcategory_design;
	}
	public void setJob_subcategory_design(String job_subcategory_design) {
		this.job_subcategory_design = job_subcategory_design;
	}
	public String getAvailability() {
		return availability;
	}
	public void setAvailability(String availability) {
		this.availability = availability;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
}
