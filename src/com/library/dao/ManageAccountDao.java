package com.library.dao;

import java.util.List;

import com.library.db.DbManager;
import com.library.irowmapper.ManageAccountRowMapper;
import com.library.irowmapper.VolunteerRowMapper;

public class ManageAccountDao implements IDAO {

	public boolean add(Object[] obj) {
		String sql = "insert into manageAccount" +
		" (accountUserName,accountPassWord," +
		"accountLevel,address) " +
		"values (?,?,?,?) ";
		DbManager db = new DbManager();
		
		return db.execute(sql, obj);
	}
	
	public List selectByUserNameAndPassWord(String userName,String passWord){
		String sql="select * from manageAccount where accountUserName='"+userName+"' and accountPassWord='"+passWord+"'";
		DbManager db = new DbManager();
		return db.select(sql, null, new ManageAccountRowMapper());
	}
	public List selectByUserName(String userName){
		String sql="select * from manageAccount where accountUserName='"+userName+"'";
		// TODO Auto-generated method stub
		DbManager db=new DbManager();
		return db.select(sql, null, new ManageAccountRowMapper());
	}
	
	
	
	public Object selectByName(String userName){
		String sql="select * from manageAccount where accountUserName='"+userName+"'";
		// TODO Auto-generated method stub
		
		DbManager db=new DbManager();
		
		Object obj[]=new Object[]{};
		
		return db.selectById(sql,obj, new ManageAccountRowMapper());
	}
	
	public Object selectById(String id) {
		String sql="select * from manageAccount where accountId="+id;
		// TODO Auto-generated method stub
		
		DbManager db=new DbManager();
		
		Object obj[]=new Object[]{};
		
		return db.selectById(sql,obj, new ManageAccountRowMapper());
	}
	
	
	public boolean delete(Object[] obj) {
		// TODO Auto-generated method stub
		
		String sql="delete from manageAccount where accountId=?";
		DbManager db=new DbManager();
		
		return db.execute(sql, obj);
	}
	
	public List select(Object[] obj) {
		// TODO Auto-generated method stub
		String sql="select * from manageAccount order by accountId desc";
		DbManager db=new DbManager();
		return db.select(sql, null, new ManageAccountRowMapper());
		
		
	}
	
	public List select(String sql, Object[] obj) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public int selectCount(Object[] obj) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public boolean update(Object[] obj) {
		// TODO Auto-generated method stub
		String sql = "update manageAccount set accountUserName=?, accountPassWord=?,accountLevel=?,address=? " +
		"where accountId=?";
		DbManager db = new DbManager();
		return db.execute(sql, obj);
		
		
	}
	

	public boolean updatePassWord(String passWord,String id) {
		// TODO Auto-generated method stub
		String sql = "update manageAccount set  accountPassWord='"+passWord+"' where accountId='"+id+"'";
		DbManager db = new DbManager();
		
		return db.execute(sql, null);
		
		
	}
	
	
}
