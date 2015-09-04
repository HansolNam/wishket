package com.wjm.models;

public class AssessmentInfo {
	private int pk;
	private int project_pk;
	private int account_pk;
	private int professionalism;
	private int satisfaction;
	private int schedule_observance;
	private int activeness;
	private int communication;
	private String recommendation;
	
	public AssessmentInfo(int pk, int project_pk, int account_pk, int professionalism, int satisfaction,
			int schedule_observance, int activeness, int communication, String recommendation) {
		super();
		this.pk = pk;
		this.project_pk = project_pk;
		this.account_pk = account_pk;
		this.professionalism = professionalism;
		this.satisfaction = satisfaction;
		this.schedule_observance = schedule_observance;
		this.activeness = activeness;
		this.communication = communication;
		this.recommendation = recommendation;
	}

	public int getPk() {
		return pk;
	}

	public void setPk(int pk) {
		this.pk = pk;
	}

	public int getProject_pk() {
		return project_pk;
	}

	public void setProject_pk(int project_pk) {
		this.project_pk = project_pk;
	}

	public int getAccount_pk() {
		return account_pk;
	}

	public void setAccount_pk(int account_pk) {
		this.account_pk = account_pk;
	}

	public int getProfessionalism() {
		return professionalism;
	}

	public void setProfessionalism(int professionalism) {
		this.professionalism = professionalism;
	}

	public int getSatisfaction() {
		return satisfaction;
	}

	public void setSatisfaction(int satisfaction) {
		this.satisfaction = satisfaction;
	}

	public int getSchedule_observance() {
		return schedule_observance;
	}

	public void setSchedule_observance(int schedule_observance) {
		this.schedule_observance = schedule_observance;
	}

	public int getActiveness() {
		return activeness;
	}

	public void setActiveness(int activeness) {
		this.activeness = activeness;
	}

	public int getCommunication() {
		return communication;
	}

	public void setCommunication(int communication) {
		this.communication = communication;
	}

	public String getRecommendation() {
		return recommendation;
	}

	public void setRecommendation(String recommendation) {
		this.recommendation = recommendation;
	}
	
	

}
