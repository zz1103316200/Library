package com.library.dao;

import java.util.List;

import com.library.db.DbManager;
import com.library.irowmapper.ActiveRowMapper;
import com.library.irowmapper.ManageAccountRowMapper;
import com.library.irowmapper.NewsRowMapper;
import com.library.irowmapper.VolunteerRowMapper;
import com.library.vo.FenyeVo;

public class NewsDao implements IDAO {

	public boolean add(Object[] obj) {
		String sql = "insert into news"+
"(newsTitle,newsContent,newsPublisher,newsPublishTime)"+
"values"+
"(?,?,?,?)";

// ('username','password','path','name','organization','370781','2012-12-12',15,'男','java','13890000000','陕西','西安','户县','吃葡萄的地方','1');"
		DbManager db = new DbManager();
		
		return db.execute(sql, obj);
	}
	
	public Object selectById(String id) {
		String sql="select * from news where newsId="+id;
		// TODO Auto-generated method stub
		
		DbManager db=new DbManager();
		
		Object obj[]=new Object[]{};
		
		return db.selectById(sql,obj, new NewsRowMapper());
	}
	
	
	public boolean delete(Object[] obj) {
		// TODO Auto-generated method stub
		
		String sql="delete from news where newsId=?";
		DbManager db=new DbManager();
		
		
		 
		 return db.execute(sql, obj);
	}
	
	public List select(Object[] obj) {
		// TODO Auto-generated method stub
		String sql="select * from news order by newsId desc";
		DbManager db=new DbManager();
		return db.select(sql, null, new NewsRowMapper());
		
		
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
		
		
		String sql = "update news set newsTitle=?,newsContent=?,newsPublisher=? where newsId=?";

		// ('username','password','path','name','organization','370781','2012-12-12',15,'男','java','13890000000','陕西','西安','户县','吃葡萄的地方','1');"
				DbManager db = new DbManager();
				
				return db.execute(sql, obj);
		
		
	}
	
	public FenyeVo selectByFenye(String currentPage){
		DbManager db = new DbManager();
		FenyeVo vo=new FenyeVo();
		String countSql="select count(*) from news";
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
		
		
		
		
		
		
		
		String sql="SELECT TOP "+pageSize+" * FROM news WHERE newsId NOT IN(SELECT TOP "+startRow+" newsId FROM news ORDER BY newsId DESC) ORDER BY newsId DESC  ";
		
		
		
		
		List currentList= db.select(sql, null,new NewsRowMapper());
		
		vo.setCurrentList(currentList);
		vo.setCurrentPage(targetPage+1);
		vo.setTotalCount(totalCount);
		vo.setTotalPage(totalPage);
		
		
		
		return vo;
	}
	
    //前台查询news的语句
	
	public List selectNewsInFront(){
		String sql="SELECT top 200 * FROM news  order by newsId desc";
		DbManager db=new DbManager();
		return db.select(sql, null, new NewsRowMapper());
	}
}
