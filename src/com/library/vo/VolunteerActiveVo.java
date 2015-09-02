package com.library.vo;

public class VolunteerActiveVo {
	
	int volunteerActiveId;
	int activeId;
	int volunteerId;
	String activeDate;
	String volunteerContent;
	
	String activeTitle;
	String activeContent;
	String activeStartTime;
	String activeEndTime;
	String activePubliser;
	String activePublishTime;
	
	String evaluation="";
	
	
	
	public String getEvaluation() {
		return evaluation;
	}
	public void setEvaluation(String evaluation) {
		this.evaluation = evaluation;
	}
	public String getActiveTitle() {
		return activeTitle;
	}
	public void setActiveTitle(String activeTitle) {
		this.activeTitle = activeTitle;
	}
	public String getActiveContent() {
		return activeContent;
	}
	public void setActiveContent(String activeContent) {
		this.activeContent = activeContent;
	}
	public String getActiveStartTime() {
		return activeStartTime;
	}
	public void setActiveStartTime(String activeStartTime) {
		this.activeStartTime = activeStartTime;
	}
	public String getActiveEndTime() {
		return activeEndTime;
	}
	public void setActiveEndTime(String activeEndTime) {
		this.activeEndTime = activeEndTime;
	}
	public String getActivePubliser() {
		return activePubliser;
	}
	public void setActivePubliser(String activePubliser) {
		this.activePubliser = activePubliser;
	}
	public String getActivePublishTime() {
		return activePublishTime;
	}
	public void setActivePublishTime(String activePublishTime) {
		this.activePublishTime = activePublishTime;
	}
	String activeHours;
	String confirmPeople;
	
	public String getVolunteerContent() {
		return volunteerContent;
	}
	public void setVolunteerContent(String volunteerContent) {
		this.volunteerContent = volunteerContent;
	}
	public int getVolunteerActiveId() {
		return volunteerActiveId;
	}
	public void setVolunteerActiveId(int volunteerActiveId) {
		this.volunteerActiveId = volunteerActiveId;
	}
	public int getActiveId() {
		return activeId;
	}
	public void setActiveId(int activeId) {
		this.activeId = activeId;
	}
	public int getVolunteerId() {
		return volunteerId;
	}
	public void setVolunteerId(int volunteerId) {
		this.volunteerId = volunteerId;
	}
	public String getActiveDate() {
		return activeDate;
	}
	public void setActiveDate(String activeDate) {
		this.activeDate = activeDate;
	}

	public String getActiveHours() {
		return activeHours;
	}
	public void setActiveHours(String activeHours) {
		this.activeHours = activeHours;
	}
	public String getConfirmPeople() {
		return confirmPeople;
	}
	public void setConfirmPeople(String confirmPeople) {
		this.confirmPeople = confirmPeople;
	}
	
	
}
