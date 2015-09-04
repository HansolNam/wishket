package com.wjm.models;

import java.sql.Timestamp;

public class AccountInfo {
	private int pk;
	private String email;
	private String id;
	private String password;
	private String account_type;
	private int authorized;
	private Timestamp reg_date;
	private String profile_img;
	private String form;
	private String name;
	private String sex;
	private Timestamp birth_date;
	private String regionL;
	private String regionM;
	private String regionR;
	private String cellphone_num;
	private String telephone_num;
	private String fax_num;
	private int subscription;
	private String identity_authentication;
	private String identity_doc;
	private String bank_name;
	private String account_holder;
	private String account_number;
	private String introduction;
	
	public AccountInfo(int pk, String email, String id, String password, String account_type, int authorized,
			Timestamp reg_date, String profile_img, String form, String name, String sex, Timestamp birth_date,
			String regionL, String regionM, String regionR, String cellphone_num, String telephone_num, String fax_num,
			int subscription, String identity_authentication, String identity_doc, String bank_name,
			String account_holder, String account_number, String introduction) {
		this.pk = pk;
		this.email = email;
		this.id = id;
		this.password = password;
		this.account_type = account_type;
		this.authorized = authorized;
		this.reg_date = reg_date;
		this.profile_img = profile_img;
		this.form = form;
		this.name = name;
		this.sex = sex;
		this.birth_date = birth_date;
		this.regionL = regionL;
		this.regionM = regionM;
		this.regionR = regionR;
		this.cellphone_num = cellphone_num;
		this.telephone_num = telephone_num;
		this.fax_num = fax_num;
		this.subscription = subscription;
		this.identity_authentication = identity_authentication;
		this.identity_doc = identity_doc;
		this.bank_name = bank_name;
		this.account_holder = account_holder;
		this.account_number = account_number;
		this.introduction = introduction;
	}

	public int getPk() {
		return pk;
	}

	public void setPk(int pk) {
		this.pk = pk;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAccount_type() {
		return account_type;
	}

	public void setAccount_type(String account_type) {
		this.account_type = account_type;
	}

	public int getAuthorized() {
		return authorized;
	}

	public void setAuthorized(int authorized) {
		this.authorized = authorized;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

	public String getForm() {
		return form;
	}

	public void setForm(String form) {
		this.form = form;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Timestamp getBirth_date() {
		return birth_date;
	}

	public void setBirth_date(Timestamp birth_date) {
		this.birth_date = birth_date;
	}

	public String getRegionL() {
		return regionL;
	}

	public void setRegionL(String regionL) {
		this.regionL = regionL;
	}

	public String getRegionM() {
		return regionM;
	}

	public void setRegionM(String regionM) {
		this.regionM = regionM;
	}

	public String getRegionR() {
		return regionR;
	}

	public void setRegionR(String regionR) {
		this.regionR = regionR;
	}

	public String getCellphone_num() {
		return cellphone_num;
	}

	public void setCellphone_num(String cellphone_num) {
		this.cellphone_num = cellphone_num;
	}

	public String getTelephone_num() {
		return telephone_num;
	}

	public void setTelephone_num(String telephone_num) {
		this.telephone_num = telephone_num;
	}

	public String getFax_num() {
		return fax_num;
	}

	public void setFax_num(String fax_num) {
		this.fax_num = fax_num;
	}

	public int getSubscription() {
		return subscription;
	}

	public void setSubscription(int subscription) {
		this.subscription = subscription;
	}

	public String getIdentity_authentication() {
		return identity_authentication;
	}

	public void setIdentity_authentication(String identity_authentication) {
		this.identity_authentication = identity_authentication;
	}

	public String getIdentity_doc() {
		return identity_doc;
	}

	public void setIdentity_doc(String identity_doc) {
		this.identity_doc = identity_doc;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

	public String getAccount_holder() {
		return account_holder;
	}

	public void setAccount_holder(String account_holder) {
		this.account_holder = account_holder;
	}

	public String getAccount_number() {
		return account_number;
	}

	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
}
