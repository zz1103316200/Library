package com.library.dao;

import java.util.List;

import com.library.db.DbManager;
import com.library.irowmapper.VolunteerActiveRowMapper;

public class VolunteerActiveDao implements IDAO {

	public boolean add(Object[] obj) {
		// TODO Auto-generated method stub
		String sql = "insert into volunteerActive" +
		" (activeId,volunteerId," +
		"activeDate,activeContent,activeHours,confirmPeople,evaluation) " +
		"values (?,?,?,?,?,?,?) ";
		DbManager db = new DbManager();
		
		return db.execute(sql, obj);
		
		
	}
	
	public List selectActiveFromVolunteerId(String volunteerId){
		String sql="select active.activeId,volunteerActive.volunteerId,activeTitle,activeHours,activeDate,confirmPeople,volunteerActive.activeContent,volunteerActive.evaluation from active inner join volunteerActive on active.activeId=volunteerActive.activeId where volunteerId="+volunteerId;
		DbManager db = new DbManager();
		
		return db.select(sql, null, new VolunteerActiveRowMapper());
	}
	
	public List selectByDoubleId(String volunteerId,String activeId){
		String sql="select active.activeId,volunteerActive.volunteerId,activeTitle,activeHours,activeDate,confirmPeople,volunteerActive.activeContent,volunteerActive.evaluation from active inner join volunteerActive on active.activeId=volunteerActive.activeId where volunteerId="+volunteerId+" and active.activeid="+activeId;
	  
		DbManager db = new DbManager();
		
		return db.select(sql, null, new VolunteerActiveRowMapper());
	}
	
	public boolean delete(Object[] obj) {
		// TODO Auto-generated method stub
		System.out.println(obj[0]+"  "+obj[1]);
		String sql="delete from volunteerActive where activeId=? and volunteerId=? ";
		
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
		return null;
	}

	public int selectCount(Object[] obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	public boolean update(Object[] obj) {
		// TODO Auto-generated method stub
		
		// "update active set activeTitle=?,activeContent=?,activePublisher=? where activeId=?";
		
		//String sql = "update volunteerActive set activeDate='?',activeContent='?',activeHours=?,confirmPeople='?' where activeId=? and volunteerId=?" ;

		String sql="update volunteerActive set activeDate=?,activeContent=?,activeHours=?,confirmPeople=?,evaluation=? where activeId=? and volunteerId=?";
		
		DbManager db = new DbManager();
		
		return db.execute(sql, obj);
	}

}
