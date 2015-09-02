<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
            <div>
			<h1><img src="library/img/logo.png" style="width:150px;margin-top:10px"></h1>		
		</div>
		<div id="sidebar">
			
		
			<ul>
				<li><a href="#"><i class="icon icon-dashboard"></i><span>&nbsp;&nbsp;控制板</span></a></li>
				<li><a href="mainframe.html"><i class="icon icon-screen-2"></i><span>&nbsp;&nbsp;主机</span></a></li>
				<li><a href="#"><i class="icon icon-drive"></i><span>&nbsp;&nbsp;硬盘</span></a></li>
				<li><a href="#"><i class="icon icon-tree"></i><span>&nbsp;&nbsp;网络</span></a></li>
				
				<li><a href="#"><i class="icon icon-insert-template"></i><span>&nbsp;&nbsp;模板</span></a></li>
				
				<li>
					<a href="#"><i class="icon icon-th-list"></i> <span>管理员</span> <span class="label">3</span></a>
					<ul>
						<li class="active"><a href="servlet/manageAccountListServlet">管理员列表</a></li>
						<li><a href="library/addManageAccount.jsp">添加管理员</a></li>
					
					</ul>
				</li>
				<li class="submenu active open">
				     <a href="#"><i class="icon icon-th-list"></i> <span>志愿者</span> <span class="label">3</span></a>
				     <ul>
				     	<li><a href="servlet/volunteerListServlet">志愿者列表</a></li>
				     	<li><a href="library/addActive.jsp">活动列表</a></li>
					 	<li><a href="library/addActive.jsp">添加活动</a></li>
					</ul>
				</li>
				<li><a href="#"><i class="icon icon-earth-2"></i><span>&nbsp;&nbsp;区域</span></a></li>
				<li><a href="events.html"><i class="icon icon-clock-3"></i><span>&nbsp;&nbsp;操作日志</span></a></li>
				<li><a href="account.html"><i  class="icon icon-user"></i><span>&nbsp;&nbsp;我的账户</span></a></li>
			</ul>
		</div>
		
		
  </body>
</html>
