package com.wjm.models;

import java.sql.Timestamp;

public class PortfolioInfo {
	private int pk;
	private int account_pk;
	private int representative;
	private String name;
	private String categoryL;
	private String categoryM;
	private String description;
	private Timestamp start_date;
	private Timestamp end_date;
	private int participation_rate;
	private String img0;
	private String explanation0;
	private String img1;
	private String explanation1;
	private String img2;
	private String explanation2;
	private String tag;
	public PortfolioInfo(int pk, int account_pk, int representative, String name, String categoryL, String categoryM,
			String description, Timestamp start_date, Timestamp end_date, int participation_rate, String img0,
			String explanation0, String img1, String explanation1, String img2, String explanation2, String tag) {
		super();
		this.pk = pk;
		this.account_pk = account_pk;
		this.representative = representative;
		this.name = name;
		this.categoryL = categoryL;
		this.categoryM = categoryM;
		this.description = description;
		this.start_date = start_date;
		this.end_date = end_date;
		this.participation_rate = participation_rate;
		this.img0 = img0;
		this.explanation0 = explanation0;
		this.img1 = img1;
		this.explanation1 = explanation1;
		this.img2 = img2;
		this.explanation2 = explanation2;
		this.tag = tag;
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
	public int getRepresentative() {
		return representative;
	}
	public void setRepresentative(int representative) {
		this.representative = representative;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Timestamp getStart_date() {
		return start_date;
	}
	public void setStart_date(Timestamp start_date) {
		this.start_date = start_date;
	}
	public Timestamp getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Timestamp end_date) {
		this.end_date = end_date;
	}
	public int getParticipation_rate() {
		return participation_rate;
	}
	public void setParticipation_rate(int participation_rate) {
		this.participation_rate = participation_rate;
	}
	public String getImg0() {
		return img0;
	}
	public void setImg0(String img0) {
		this.img0 = img0;
	}
	public String getExplanation0() {
		return explanation0;
	}
	public void setExplanation0(String explanation0) {
		this.explanation0 = explanation0;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getExplanation1() {
		return explanation1;
	}
	public void setExplanation1(String explanation1) {
		this.explanation1 = explanation1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getExplanation2() {
		return explanation2;
	}
	public void setExplanation2(String explanation2) {
		this.explanation2 = explanation2;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	
	
	
}
