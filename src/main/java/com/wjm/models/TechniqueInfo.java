package com.wjm.models;

import java.sql.Timestamp;

public class TechniqueInfo {
	private int pk;
	private int account_pk;
	private String name;
	private String experience;
	private String skill;
	private int representative;
	public TechniqueInfo(int pk, int account_pk, String name, String experience, String skill, int representative) {
		super();
		this.pk = pk;
		this.account_pk = account_pk;
		this.name = name;
		this.experience = experience;
		this.skill = skill;
		this.representative = representative;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public int getRepresentative() {
		return representative;
	}
	public void setRepresentative(int representative) {
		this.representative = representative;
	}
	
	
}
