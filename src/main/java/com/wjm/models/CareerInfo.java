package com.wjm.models;

import java.sql.Timestamp;

public class CareerInfo {
	private int pk;
	private int account_pk;
	private String company_name;
	private String department;
	private String position;
	private String start_date;
	private String end_date;
	public CareerInfo(int pk, int account_pk, String company_name, String department, String position,
			String start_date, String end_date) {
		super();
		this.pk = pk;
		this.account_pk = account_pk;
		this.company_name = company_name;
		this.department = department;
		this.position = position;
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
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
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
