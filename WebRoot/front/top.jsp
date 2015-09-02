<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

			<div class="head">
			  <div class="fl">
				<img src="../front/images/logo1.jpg"  width="100%" height="105px" />
			  </div>
			    
			</div>
			
			<div class="nav">
				<a href="showFrontServlet"class="on">首页</a>
				<a href="frontNewsListServlet"  >焦点新闻</a>
				<a href="frontVolunteerListServlet">志愿者风采</a>
				<a href="frontTrainListServlet">志愿者培训</a>
				<a href="frontActiveListServlet">专题活动</a>
				
				<a href="../front/addVolunteer.jsp">加入志愿者</a>
				<a href="../front/login.jsp">登陆</a>
			</div>
