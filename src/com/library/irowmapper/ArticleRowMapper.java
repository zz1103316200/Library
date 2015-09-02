package com.library.irowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.library.vo.ActiveVo;
import com.library.vo.ArticleVo;

public class ArticleRowMapper implements IrowMapper{

	public Object mapper(ResultSet rs) {
		// TODO Auto-generated method stub
		ArticleVo vo=new ArticleVo();
		
		try {
			vo.setArticleId(rs.getInt("articleId"));
			vo.setArticleTitle(rs.getString("articleTitle"));
			vo.setArticleContent(rs.getString("articleContent"));
			vo.setArticleTime(rs.getString("articleTime"));
			vo.setVolunteerId(rs.getString("volunteerId"));
			
			
			return vo;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	
	}
		
	
	
}
