package com.library.irowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.library.vo.ManageAccountVo;
import com.library.vo.VolunteerVo;

public class VolunteerRowMapper implements IrowMapper {
	
	public Object mapper(ResultSet rs) {
		VolunteerVo vo=new VolunteerVo();
		
		try {
			vo.setAge(rs.getInt("age"));
			vo.setCommonAddress(rs.getString("commonAddress"));
			vo.setGetCardData(rs.getString("getCardData"));
			vo.setLevel(rs.getString("level"));
			vo.setPicturePath(rs.getString("picturePath"));
			vo.setRegistOrganization(rs.getString("registOrganization"));
			vo.setSex(rs.getString("sex"));
			vo.setSheng(rs.getString("sheng"));
		
			vo.setShi(rs.getString("shi"));
			vo.setXian(rs.getString("xian"));
			vo.setTel(rs.getString("tel"));
			vo.setVolunteerId(rs.getInt("volunterId"));
			vo.setVolunteerIdCard(rs.getString("volunteerIdCard"));
			vo.setVolunteerName(rs.getString("volunteerName"));
			vo.setVolunteerPassWord(rs.getString("volunteerPassWord"));
			vo.setVolunteerSpeciality(rs.getString("volunteerSpeciality"));
			vo.setVolunteerUserName(rs.getString("volunteerUserName"));
			vo.setCardNumber(rs.getString("cardNumber"));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
}
