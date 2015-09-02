<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="com.library.vo.NewsVo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <head>
   <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<title>陕西省文化厅</title>
    <link href="../front/css/shou.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../front/js/yao.js"></script>
	<link type="text/css" rel="stylesheet" href="../front/css/style.css" />
	<script type="text/javascript" src="../front/js/page.js"></script>
	<script type="text/javascript" src="../front/js/jquery-1.4.3.min.js"></script>
	<script type="text/javascript" src="../front/js/css.js"></script>
  </head>


  </head>
  
  <body>
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
				<a href="frontNewsListServlet" class="on" >焦点新闻</a>
				<a href="frontVolunteerListServlet">志愿者风采</a>
				<a href="frontTrainListServlet">志愿者培训</a>
				<a href="frontActiveListServlet">专题活动</a>
				<a href="../front/addVolunteer.jsp">加入志愿者</a>
				<a href="../front/login.jsp">登录</a>
			</div>
		
		
		
		<div class="main mt">
			
			   <div class="right2 fl" >
					<div class="path" align="left">
					<%
						NewsVo vo=(NewsVo)request.getAttribute("newsVo");
					 %>
						<strong>您的位置：</strong><a href="showFrontServlet">首页</a>&nbsp;&gt;&nbsp;<a  href="frontNewsListServlet">焦点新闻</a>&nbsp;&gt;&nbsp;<%=vo.getNewsTitle() %>
					</div>
					<div class="article mt">
					  <h1 align="center"><%=vo.getNewsTitle() %></h1>
						<div class="info">时间：<%=vo.getNewsPublishTime() %>    发布者：<%=vo.getNewsPublisher() %></div>
						<div class="newstext" align="left">
						 	<%=vo.getNewsContent() %>
						</div>
				  </div>
				
			</div>
		    
		    <div class="clear"></div>
		</div>
		
		
		
		   
		    	        
		  
		  <div class="clear"></div>
		</div>
		<br />
		
		<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
