package com.wjm.models;

import java.sql.Timestamp;

public class AccountInformationInfo {
	private int pk;
	private int account_pk;
	private String profile_img;
	private String form;
	private String company_name;
	private String company_representative;
	private String name;
	private String sex;
	private String birth_date;
	private String regionl;
	private String regionm;
	private String regionr;
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
	public AccountInformationInfo(int pk, int account_pk, String profile_img, String form, String company_name,
			String company_representative, String name, String sex, String birth_date, String regionl, String regionm,
			String regionr, String cellphone_num, String telephone_num, String fax_num, int subscription,
			String identity_authentication, String identity_doc, String bank_name, String account_holder,
			String account_number, String introduction) {
		super();
		this.pk = pk;
		this.account_pk = account_pk;
		this.profile_img = profile_img;
		this.form = form;
		this.company_name = company_name;
		this.company_representative = company_representative;
		this.name = name;
		this.sex = sex;
		this.birth_date = birth_date;
		this.regionl = regionl;
		this.regionm = regionm;
		this.regionr = regionr;
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
	public int getAccount_pk() {
		return account_pk;
	}
	public void setAccount_pk(int account_pk) {
		this.account_pk = account_pk;
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
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getCompany_representative() {
		return company_representative;
	}
	public void setCompany_representative(String company_representative) {
		this.company_representative = company_representative;
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
	public String getBirth_date() {
		return birth_date;
	}
	public void setBirth_date(String birth_date) {
		this.birth_date = birth_date;
	}
	public String getRegionl() {
		return regionl;
	}
	public void setRegionl(String regionl) {
		this.regionl = regionl;
	}
	public String getRegionm() {
		return regionm;
	}
	public void setRegionm(String regionm) {
		this.regionm = regionm;
	}
	public String getRegionr() {
		return regionr;
	}
	public void setRegionr(String regionr) {
		this.regionr = regionr;
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
