package com.library.vo;

import java.util.ArrayList;

public class ActiveVo {
	
	int activeId;
	String activeTitle;
	String activeContent;
	
	String activePublisher;
	String activePublishTime;
	String manageId;
	
	
	public String getManageId() {
		return manageId;
	}
	public void setManageId(String manageId) {
		this.manageId = manageId;
	}
	public int getActiveId() {
		return activeId;
	}
	public void setActiveId(int activeId) {
		this.activeId = activeId;
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
	
	
	public String getActivePublisher() {
		return activePublisher;
	}
	public void setActivePublisher(String activePublisher) {
		this.activePublisher = activePublisher;
	}
	public String getActivePublishTime() {
		return activePublishTime;
	}
	public void setActivePublishTime(String activePublishTime) {
		this.activePublishTime = activePublishTime;
	}
	
	
	
}
