<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="com.library.vo.NewsVo"%>
<%@page import="com.library.vo.ArticleVo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <head>
   <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<title>����ʡ�Ļ���</title>
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
			<div class="wel">���ã���ӭ��������־Ը����վ��~</div>
		    <div class="toplink">
		    	
		    </div>
		</div>
		
		<div class="head">
			  <div class="fl" align="left">
				<img src="../front/images/logo1.jpg"  width="100%" height="105px" />
			  </div>
			    
			</div>
			
			<div class="nav">
				<a href="showFrontServlet">��ҳ</a>
				<a href="frontNewsListServlet" >��������</a>
				<a href="frontVolunteerListServlet">־Ը�߷��</a>
				<a href="frontTrainListServlet">־Ը����ѵ</a>
				<a href="frontActiveListServlet">ר��</a>

				<a href="../front/addVolunteer.jsp">����־Ը��</a>
				<a href="../front/login.jsp" class="on" >��¼</a>
			</div>
		
		
		
		<div class="main mt">
			
			   <div class="right2 fl">
					<div class="path">
					<%
						ArticleVo vo=(ArticleVo)request.getAttribute("articleVo");
					 %>
						<strong>����λ�ã�</strong><a href="showFrontServlet">��ҳ</a>&nbsp;&gt;&nbsp;<a >־Ը������</a>
					</div>
					<div class="article mt">
					  <h1 align="center"><%=vo.getArticleTitle() %></h1>
						<div class="info">ʱ�䣺<%=vo.getArticleTime() %>   </div>
						<div class="newstext" align="left">
						 	<%=vo.getArticleContent() %>
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
