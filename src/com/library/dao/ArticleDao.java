package com.library.dao;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.List;

import com.library.db.DbManager;
import com.library.irowmapper.ActiveRowMapper;
import com.library.irowmapper.ArticleRowMapper;

public class ArticleDao implements IDAO {
	
	
	
	public boolean add(Object[] obj) {
		// TODO Auto-generated method stub
		
		String sql = "insert into article"+
		"(articleTitle,articleContent,articleTime,volunteerId)"+
		"values"+
		"(?,?,?,?)";
		DbManager db = new DbManager();
		
		return db.execute(sql, obj);
	
	}

	public boolean delete(Object[] obj) {
		// TODO Auto-generated method stub
		
		String sql="delete from article where articleId=?";
		DbManager db = new DbManager();
		
		return db.execute(sql, obj);
		
		
	}

	public List select(Object[] obj) {
		// TODO Auto-generated method stub
		return null;
	}

	public List select(String sql, Object[] obj) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object selectById(String id) {
		// TODO Auto-generated method stub
		String sql="select * from article where articleId = "+id;
		
		DbManager db=new DbManager();
		
		
		return db.selectById(sql,null, new ArticleRowMapper());
		
	}

	public int selectCount(Object[] obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	public boolean update(Object[] obj) {
		String sql = "update article set articleTitle=?,articleContent=? where articleId=?";

	
		DbManager db = new DbManager();
				
		return db.execute(sql, obj);
	}
	
	//”√volunteerId≤È—Ø
	public List selectByVolunteerId(String volunteerId){
		String sql="select * from article where volunteerId="+volunteerId+" order by articleId desc";
	    DbManager db=new DbManager();
	    return db.select(sql, null, new ArticleRowMapper());
	}
	
}
