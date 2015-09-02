package com.library.irowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.library.vo.VolunteerActiveVo;
import com.library.vo.VolunteerVo;

public class VolunteerActiveRowMapper implements IrowMapper {

	public Object mapper(ResultSet rs) {
		// TODO Auto-generated method stub
		VolunteerActiveVo vo=new VolunteerActiveVo();
		
		try {
			vo.setVolunteerId(rs.getInt("volunteerId"));
			vo.setActiveId(rs.getInt("activeId"));
			vo.setActiveTitle(rs.getString("activeTitle"));
			vo.setActiveDate(rs.getString("activeDate"));
			vo.setActiveHours(rs.getString("activeHours"));
			vo.setConfirmPeople(rs.getString("confirmPeople"));
			vo.setActiveContent(rs.getString("activeContent"));
			vo.setEvaluation(rs.getString("evaluation"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

}
