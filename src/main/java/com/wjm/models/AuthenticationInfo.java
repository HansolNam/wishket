package com.wjm.models;

import java.sql.Timestamp;

public class AuthenticationInfo {
	private int pk;
	private int account_pk;
	private String user_type;
	private String identity_doc;
	private String representer_name;
	private String address_detail;
	private String email_for_tax;
	private String identify_number;
	private String company_name;
	private Timestamp reg_date;
	public AuthenticationInfo(int pk, int account_pk, String user_type, String identity_doc, String representer_name,
			String address_detail, String email_for_tax, String identify_number, String company_name,
			Timestamp reg_date) {
		super();
		this.pk = pk;
		this.account_pk = account_pk;
		this.user_type = user_type;
		this.identity_doc = identity_doc;
		this.representer_name = representer_name;
		this.address_detail = address_detail;
		this.email_for_tax = email_for_tax;
		this.identify_number = identify_number;
		this.company_name = company_name;
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
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public String getIdentity_doc() {
		return identity_doc;
	}
	public void setIdentity_doc(String identity_doc) {
		this.identity_doc = identity_doc;
	}
	public String getRepresenter_name() {
		return representer_name;
	}
	public void setRepresenter_name(String representer_name) {
		this.representer_name = representer_name;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public String getEmail_for_tax() {
		return email_for_tax;
	}
	public void setEmail_for_tax(String email_for_tax) {
		this.email_for_tax = email_for_tax;
	}
	public String getIdentify_number() {
		return identify_number;
	}
	public void setIdentify_number(String identify_number) {
		this.identify_number = identify_number;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
