package com.library.irowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.library.vo.ActiveVo;
import com.library.vo.ArticleVo;

public class ActiveRowMapper implements IrowMapper{

	public Object mapper(ResultSet rs) {
		// TODO Auto-generated method stub
		ActiveVo vo=new ActiveVo();
		
		try {
			
			vo.setActiveId(rs.getInt("activeId"));
			vo.setActiveTitle(rs.getString("activeTitle"));
			vo.setActiveContent(rs.getString("activeContent"));
			vo.setActivePublisher(rs.getString("activePublisher"));
			vo.setActivePublishTime(rs.getString("activePublishTime"));
			vo.setManageId(rs.getString("manageId"));
			
			return vo;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	
	}
		
	
	
}
