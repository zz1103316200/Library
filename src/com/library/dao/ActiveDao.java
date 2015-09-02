package com.library.dao;

import java.util.List;

import com.library.db.DbManager;
import com.library.irowmapper.ActiveRowMapper;
import com.library.irowmapper.ManageAccountRowMapper;
import com.library.irowmapper.NewsRowMapper;
import com.library.irowmapper.VolunteerRowMapper;
import com.library.vo.FenyeVo;

public class ActiveDao implements IDAO {

	public boolean add(Object[] obj) {
		String sql = "insert into active"+
"(activeTitle,activeContent,activePublisher,activePublishTime,manageId)"+
"values"+
"(?,?,?,?,?)";

// ('username','password','path','name','organization','370781','2012-12-12',15,'男','java','13890000000','陕西','西安','户县','吃葡萄的地方','1');"
		DbManager db = new DbManager();
		
		return db.execute(sql, obj);
	}
	
	public Object selectById(String id) {
		String sql="select * from active where activeId="+id;
		// TODO Auto-generated method stub
		
		DbManager db=new DbManager();
		
		Object obj[]=new Object[]{};
		
		return db.selectById(sql,obj, new ActiveRowMapper());
	}
	
	
	public boolean delete(Object[] obj) {
		// TODO Auto-generated method stub
		
		String sql="delete from active where activeId=?";
		DbManager db=new DbManager();
		//删除中间表    活动-志愿者
		
		String deleteSql="delete from volunteerActive where activeId=?";
		
		 db.execute(sql, obj);
		 return db.execute(deleteSql, obj);
	}
	
	public List select(Object[] obj) {
		// TODO Auto-generated method stub
		String sql="select * from active order by activeId desc";
		DbManager db=new DbManager();
		return db.select(sql, null, new ActiveRowMapper());
		
		
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
		
		
		String sql = "update active set activeTitle=?,activeContent=?,activePublisher=? where activeId=?";

		// ('username','password','path','name','organization','370781','2012-12-12',15,'男','java','13890000000','陕西','西安','户县','吃葡萄的地方','1');"
				DbManager db = new DbManager();
				
				return db.execute(sql, obj);
		
		
	}
	
	public FenyeVo selectByFenye(String currentPage){
		DbManager db = new DbManager();
		FenyeVo vo=new FenyeVo();
		String countSql="select count(*) from active";
		int totalCount=db.executeCount(countSql, null);
		int pageSize=20;
		
		int totalPage=totalCount/pageSize+1;
		
		int targetPage=Integer.parseInt(currentPage)-1;
		if(targetPage<0){
			targetPage=0;
		}
		
		if(targetPage>(totalPage-1)){
			targetPage=totalPage-1;
		}
		
		
		
		
		
		int startRow=targetPage*pageSize-1;
		
		if(startRow<0){
			startRow=0;
		}
		
		
		
		
		
		
		
		String sql="SELECT TOP "+pageSize+" * FROM active WHERE activeId NOT IN(SELECT TOP "+startRow+" activeId FROM active ORDER BY activeId DESC) ORDER BY activeId DESC  ";
		
		
		
		
		List currentList= db.select(sql, null,new ActiveRowMapper());
		
		vo.setCurrentList(currentList);
		vo.setCurrentPage(targetPage+1);
		vo.setTotalCount(totalCount);
		vo.setTotalPage(totalPage);
		
		
		
		return vo;
	}
	
	//前台查询active的语句
	
	public List selectActiveInFront(){
		String sql="SELECT top 200 * FROM active  order by activeId desc";
		DbManager db=new DbManager();
		return db.select(sql, null, new ActiveRowMapper());
	}
	
	//通过管理员id来查询这个管理员创建的id
	public List selectByManageId(String manageId){
		String sql="SELECT * FROM active where manageId="+manageId+" order by activeId desc";
		DbManager db=new DbManager();
		return db.select(sql, null, new ActiveRowMapper());
	}
}
