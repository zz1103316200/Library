package com.library.irowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.library.vo.ActiveVo;
import com.library.vo.NewsVo;

public class NewsRowMapper implements IrowMapper{

	public Object mapper(ResultSet rs) {
		// TODO Auto-generated method stub
		NewsVo vo=new NewsVo();
		
		try {
			
			vo.setNewsContent(rs.getString("newsContent"));
			
			vo.setNewsId(rs.getInt("newsId"));
			vo.setNewsPublisher(rs.getString("newsPublisher"));
			vo.setNewsPublishTime(rs.getString("newsPublishTime"));
			vo.setNewsTitle(rs.getString("newsTitle"));
			
			return vo;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	
	}
		
	
	
}
