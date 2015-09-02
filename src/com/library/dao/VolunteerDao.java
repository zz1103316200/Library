package com.library.dao;

import java.util.List;

import com.library.db.DbManager;
import com.library.irowmapper.ManageAccountRowMapper;
import com.library.irowmapper.VolunteerRowMapper;

public class VolunteerDao implements IDAO {

	public boolean add(Object[] obj) {
	
		String sql = "insert into volunteer "+
"(volunteerUserName,volunteerPassWord,picturePath,volunteerName,registOrganization,volunteerIdCard,getCardData,age,sex,volunteerSpeciality,tel,sheng,shi,xian,commonAddress,level,cardNumber) "+
"values "+
"(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
/*
		String sql = "insert into volunteer "+
		"(volunteerUserName,volunteerPassWord,picturePath,volunteerName,registOrganization,volunteerIdCard,getCardData,age,sex,volunteerSpeciality,tel,sheng,shi,xian,commonAddress,level) "+
		"values (";
		for(int i=0;i<obj.length;i++){
			String str=obj[i].toString();
			sql+=str+",";
		}
		sql=sql.substring(0,sql.length());
		
		sql+=")";
		
		System.out.println(sql);
		*/
// ('username','password','path','name','organization','370781','2012-12-12',15,'��','java','13890000000','����','����','����','�����ѵĵط�','1');"
	
			
		DbManager db = new DbManager();
		
		return db.execute(sql, obj);
		
	}
	public List selectByHoutai(String level,String address){
		String sql="select * from volunteer where ";
		
		if(level.equals("1")){
			sql+="sheng = '"+address+"'";
		}else if(level.equals("2")){
			sql+="shi = '"+address+"'";
		}else if(level.equals("3")){
			sql+="xian = '"+address+"'";
		}else if(level.equals("0")){
			sql+="1=1";
		}
	
		DbManager db=new DbManager();
		return db.select(sql, null, new VolunteerRowMapper());
	}
	
	public Object selectById(String id) {
		String sql="select * from volunteer where volunterId="+id;
		// TODO Auto-generated method stub
		
		DbManager db=new DbManager();
		
		Object obj[]=new Object[]{};
		
		return db.selectById(sql,obj, new VolunteerRowMapper());
	}
	
	//obj˳���� �س� ���䣨������
	public List selectSearch(Object obj[],String level,String address){
		
		//volunteerSpeciality,littleAge,bigAge,commonAddress,volunteerName,tel,registOrganization,cardNumber,volunteerIdCard
		
		
		
		//�س�
		String sql="select * from volunteer where volunteerSpeciality like '%"+obj[0]+"%' " ;
		
		//����סַ
		
		sql+=" and commonAddress like '%"+obj[3]+"%' ";
		
		//����
		sql+=" and volunteerName like '%"+obj[4]+"%' ";
		
		//�绰
		sql+=" and tel like '%"+obj[5]+"%' ";
		
		//ע����֯
		
		sql+=" and registOrganization like '%"+obj[6]+"%' ";
		
		//֤���
		sql+=" and cardNumber like '%"+obj[7]+"%' ";
		
		//���֤
		sql+=" and volunteerIdCard like '%"+obj[8]+"%' ";
		
		if(obj[1].equals("")){
			obj[1]="0";
		}
		if(obj[2].equals("")){
			obj[2]="99";
		}
		sql+=" and age between "+obj[1]+" and "+obj[2];
		
		
		if(level.equals("1")){
			sql+=" and sheng = '"+address+"'";
		}else if(level.equals("2")){
			sql+=" and shi = '"+address+"'";
		}else if(level.equals("3")){
			sql+=" and xian = '"+address+"'";
		}else if(level.equals("0")){
			sql+=" and 1=1";
		}
		
		DbManager db=new DbManager();
	    return db.select(sql,null ,new  VolunteerRowMapper() );
		
		
	}
	
	
	public List easySearch(Object obj[],String level,String address){
		
		//volunteerSpeciality,littleAge,bigAge,commonAddress,volunteerName,tel,registOrganization,cardNumber,volunteerIdCard
		
		
		
		//�س�
		String sql="select * from volunteer where volunteerSpeciality like '%"+obj[0]+"%' " ;
		
		//����סַ
		
		sql+=" and commonAddress like '%"+obj[3]+"%' ";
		
		
		
		if(obj[1].equals("")){
			obj[1]="0";
		}
		if(obj[2].equals("")){
			obj[2]="99";
		}
		sql+=" and age between "+obj[1]+" and "+obj[2];
		
		
		if(level.equals("1")){
			sql+=" and sheng = '"+address+"'";
		}else if(level.equals("2")){
			sql+=" and shi = '"+address+"'";
		}else if(level.equals("3")){
			sql+=" and xian = '"+address+"'";
		}else if(level.equals("0")){
			sql+=" and 1=1";
		}
		
		DbManager db=new DbManager();
	    return db.select(sql,null ,new  VolunteerRowMapper() );
		
		
	}
	
	public boolean delete(Object[] obj) {
		// TODO Auto-generated method stub
		
		String sql="delete from volunteer where volunterId=?";
		DbManager db=new DbManager();
		
		//����ɾ�����¼
		String sql1="delete from volunteerActive where volunteerId=? ";
		
		db.execute(sql, obj);
		return db.execute(sql1, obj);
	}
	
	public List select(Object[] obj) {
		// TODO Auto-generated method stub
		String sql="select * from volunteer order by volunterId desc";
		DbManager db=new DbManager();
		return db.select(sql, null, new VolunteerRowMapper());
		
		
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
		
		
		String sql = "update volunteer set picturePath=?, volunteerName=?,registOrganization=?,volunteerIdCard=?, " +
		" getCardData=?,age=?,sex=?,volunteerSpeciality=?,tel=?,sheng=?,shi=?,xian=?,commonAddress=?,cardNumber=? "
		+"where volunterId=?";
		
		
		DbManager db = new DbManager();
		return db.execute(sql, obj);
		
		
	}
	
	//��׼һ��־Ը��
	public boolean pizhun(String volunteerId){
		String sql="update volunteer set level='1' where volunterId="+volunteerId;
		DbManager db = new DbManager();
		return db.execute(sql, null);
	}
	
	//ǰ̨չʾ־Ը�� Ĭ��30��
	
	public List selectVolunteerInFront(){
		String sql="SELECT Top 30 * FROM volunteer where level>=1 order by volunterId desc";
		DbManager db=new DbManager();
		return db.select(sql, null, new VolunteerRowMapper());
	}
	
	//ǰ̨ajax���־Ը���û�������ĵط�
	
	public List selectByIdCardAndPassWord(String idCard,String passWord){
		String sql="SELECT  * FROM volunteer where volunteerIdCard='"+idCard+"' and volunteerPassWord='"+passWord+"'";
		DbManager db=new DbManager();
		return db.select(sql, null, new VolunteerRowMapper());
	}
	
	
	//ǰ̨����
	
	public List frontSearch(Object[] obj ){
		
		//ʡ
		String sql="select * from volunteer where sheng like '%"+obj[0]+"%' " ;
		
		//��
		sql+=" and shi like '%"+obj[1]+"%' ";
		
		//��
		sql+=" and xian like '%"+obj[2]+"%' ";
		
		//˳��
		String search=obj[3].toString();
		if(search.equals("")||search.equals("time")){
			
			sql+=" order by  volunterId desc";
			
		}else if(search.equals("both")||search.equals("active")){
			sql="select * from (" +sql+" ) as a  left join ( select volunteerId, count(*) totalCount from volunteerActive group by volunteerId ) as b on a.volunterId=b.volunteerId  order by b.totalCount desc";
		}
		
		
		
		DbManager db=new DbManager();
		return db.select(sql, null, new VolunteerRowMapper());
		
	}
	
	
	//ajax�޸�
	public boolean updatePassWord(String passWord,String volunteerId){
		String sql="update volunteer set volunteerPassWord='"+passWord+"' where volunterId="+volunteerId;
		
	
		DbManager db=new DbManager();
		return  db.execute(sql, null);
	}
}
