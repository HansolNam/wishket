package com.wjm.models;

import java.sql.Timestamp;

public class ProjectInfo {
	private int pk;
	private int account_pk;
	private String categoryL;
	private String categoryM;
	private int another;
	private String name;
	private int period;
	private String budget;
	private String plan_status;
	private String description;
	private String technique;
	private Timestamp deadline;
	private String meeting_type;
	private String meeting_area;
	private String meeting_area_detail;
	private Timestamp start_date;
	private int managing;
	private String partner_type;
	private String purpose;
	private String status;
	private Timestamp reg_date;
	public ProjectInfo(int pk, int account_pk, String categoryL, String categoryM, int another, String name, int period,
			String budget, String plan_status, String description, String technique, Timestamp deadline,
			String meeting_type, String meeting_area, String meeting_area_detail, Timestamp start_date, int managing,
			String partner_type, String purpose, String status, Timestamp reg_date) {
		super();
		this.pk = pk;
		this.account_pk = account_pk;
		this.categoryL = categoryL;
		this.categoryM = categoryM;
		this.another = another;
		this.name = name;
		this.period = period;
		this.budget = budget;
		this.plan_status = plan_status;
		this.description = description;
		this.technique = technique;
		this.deadline = deadline;
		this.meeting_type = meeting_type;
		this.meeting_area = meeting_area;
		this.meeting_area_detail = meeting_area_detail;
		this.start_date = start_date;
		this.managing = managing;
		this.partner_type = partner_type;
		this.purpose = purpose;
		this.status = status;
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
	public String getCategoryL() {
		return categoryL;
	}
	public void setCategoryL(String categoryL) {
		this.categoryL = categoryL;
	}
	public String getCategoryM() {
		return categoryM;
	}
	public void setCategoryM(String categoryM) {
		this.categoryM = categoryM;
	}
	public int getAnother() {
		return another;
	}
	public void setAnother(int another) {
		this.another = another;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public String getBudget() {
		return budget;
	}
	public void setBudget(String budget) {
		this.budget = budget;
	}
	public String getPlan_status() {
		return plan_status;
	}
	public void setPlan_status(String plan_status) {
		this.plan_status = plan_status;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTechnique() {
		return technique;
	}
	public void setTechnique(String technique) {
		this.technique = technique;
	}
	public Timestamp getDeadline() {
		return deadline;
	}
	public void setDeadline(Timestamp deadline) {
		this.deadline = deadline;
	}
	public String getMeeting_type() {
		return meeting_type;
	}
	public void setMeeting_type(String meeting_type) {
		this.meeting_type = meeting_type;
	}
	public String getMeeting_area() {
		return meeting_area;
	}
	public void setMeeting_area(String meeting_area) {
		this.meeting_area = meeting_area;
	}
	public String getMeeting_area_detail() {
		return meeting_area_detail;
	}
	public void setMeeting_area_detail(String meeting_area_detail) {
		this.meeting_area_detail = meeting_area_detail;
	}
	public Timestamp getStart_date() {
		return start_date;
	}
	public void setStart_date(Timestamp start_date) {
		this.start_date = start_date;
	}
	public int getManaging() {
		return managing;
	}
	public void setManaging(int managing) {
		this.managing = managing;
	}
	public String getPartner_type() {
		return partner_type;
	}
	public void setPartner_type(String partner_type) {
		this.partner_type = partner_type;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	

}
