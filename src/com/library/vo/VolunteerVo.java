package com.library.vo;

public class VolunteerVo {
	
	int volunteerId;
	String volunteerUserName;
	String volunteerPassWord;
	String picturePath;
	//志愿者真实姓名
	String volunteerName;
	
	//注册组织
	String registOrganization;
	//身份证
	String volunteerIdCard;
	//发证日期
	String getCardData;
	
	int age;
	String sex;
	//特长
	String volunteerSpeciality;

	String tel;
	String sheng;
	String shi;
	String xian;
	
	String commonAddress;
	String level;   //0 为未审核 1为审核通过 往后2 3 4 5可能代表各个等级
	String cardNumber;//发证日志
	
	
	
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public int getVolunteerId() {
		return volunteerId;
	}
	public void setVolunteerId(int volunteerId) {
		this.volunteerId = volunteerId;
	}
	public String getVolunteerUserName() {
		return volunteerUserName;
	}
	public void setVolunteerUserName(String volunteerUserName) {
		this.volunteerUserName = volunteerUserName;
	}
	public String getVolunteerPassWord() {
		return volunteerPassWord;
	}
	public void setVolunteerPassWord(String volunteerPassWord) {
		this.volunteerPassWord = volunteerPassWord;
	}
	public String getPicturePath() {
		return picturePath;
	}
	public void setPicturePath(String picturePath) {
		this.picturePath = picturePath;
	}
	public String getVolunteerName() {
		return volunteerName;
	}
	public void setVolunteerName(String volunteerName) {
		this.volunteerName = volunteerName;
	}
	public String getRegistOrganization() {
		return registOrganization;
	}
	public void setRegistOrganization(String registOrganization) {
		this.registOrganization = registOrganization;
	}
	public String getVolunteerIdCard() {
		return volunteerIdCard;
	}
	public void setVolunteerIdCard(String volunteerIdCard) {
		this.volunteerIdCard = volunteerIdCard;
	}
	public String getGetCardData() {
		return getCardData;
	}
	public void setGetCardData(String getCardData) {
		this.getCardData = getCardData;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getVolunteerSpeciality() {
		return volunteerSpeciality;
	}
	public void setVolunteerSpeciality(String volunteerSpeciality) {
		this.volunteerSpeciality = volunteerSpeciality;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getSheng() {
		return sheng;
	}
	public void setSheng(String sheng) {
		this.sheng = sheng;
	}
	public String getShi() {
		return shi;
	}
	public void setShi(String shi) {
		this.shi = shi;
	}
	public String getXian() {
		return xian;
	}
	public void setXian(String xian) {
		this.xian = xian;
	}
	public String getCommonAddress() {
		return commonAddress;
	}
	public void setCommonAddress(String commonAddress) {
		this.commonAddress = commonAddress;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
   
	 

}

