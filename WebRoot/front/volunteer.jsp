<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="com.library.vo.ActiveVo"%>
<%@page import="com.library.vo.FenyeVo"%>
<%@page import="com.library.vo.VolunteerVo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<title>陕西省文化厅</title>
    <link href="../front/css/shou.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../front/js/yao.js"></script>
	<link type="text/css" rel="stylesheet" href="../front/css/style.css" />
	<script type="text/javascript" src="../front/js/page.js"></script>
	<script type="text/javascript" src="../front/js/jquery-1.4.3.min.js"></script>
	<script type="text/javascript" src="../front/js/css.js"></script>
	<script type="text/javascript" src="../front/js/jilian.js"></script>
  	<script type="text/javascript">
  		function doSearch(){
  			
  			document.getElementById("search").submit();
  		
  		}
  	
  	</script>
  
  </head>
  
  <body onload="setup()">
			    <div class="topbox">
				<div class="wel">您好，欢迎光临陕西志愿者网站！~</div>
			    <div class="toplink">
			    	
			    </div>
			</div>
			
			<div class="head">
			  <div class="fl">
				<img src="../front/images/logo1.jpg"  width="100%" height="105px" />
			  </div>
			    
			</div>
			
			<div class="nav">
				<a href="showFrontServlet">首页</a>
				<a href="frontNewsListServlet"  >焦点新闻</a>
				<a href="frontVolunteerListServlet" class="on">志愿者风采</a>
				<a href="frontTrainListServlet" >志愿者培训</a>
				<a href="frontActiveListServlet">专题活动</a>
				<a href="../front/addVolunteer.jsp">加入志愿者</a>
				<a href="../front/login.jsp">登录</a>
			</div>

			
			<div class="main mt">
	<%
		List list=(ArrayList)request.getAttribute("volunteerList");
	 %>
	 	<form action="../servlet/frontSearchServlet" method="post" id="search">
	      <div class="pictxt4">
	      	<b>按地域查找：</b>		
	      	<select name="sheng" id ="companyLocation" class="cform-select" style="width:100px"></select>
			<select name="shi" id = "city"style="width:100px"></select>
			<select name="xian" id ="county" style="width:100px"></select>
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>条件查找:</b>
	         <input type="checkbox" id="search" name="search" value="time" />&nbsp;&nbsp;按照时间顺序  <input type="checkbox" id="search" name="search" value="active" />&nbsp;&nbsp;按照活跃程度        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onclick="doSearch()">执行查找</a>
	     </form>
	     
	      <br />
	       <br />
	       
					<table >
						
						<% 
							for(int i=0;i<list.size();i++){
						%>
						
						<tr>
							<% 
							    int flag=0;
								while(i<list.size()){
									flag++;
									VolunteerVo vo=(VolunteerVo)list.get(i);
									
							%>
							<td >
								<div class="pic">
									<img src="../<%=vo.getPicturePath() %>" width="100" />
									<div class="ttext" style="" ><font color="white"><a href="../servlet/sampleVolunteerDetailServlet?volunteerId=<%=vo.getVolunteerId() %>" class="bai" <%=vo.getVolunteerName() %>" target="_blank">志愿者:<%=vo.getVolunteerName() %></a></font></div>
										
								</div>
							
							</td>
							<% 
							   
								if(flag==6){
								   break;
								}else{
									i++;
								}
								
								
								}
							%>
							
						</tr>
					<% 
						}
					
					%>
					</table>
					
					
           
           </div>
			
		
	</div>
		
			    
			  
			    
			    <div class="clear"></div>
			
			
			
			
			  <br />
			  
			 
			
			<br />
			<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
