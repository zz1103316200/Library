<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.library.vo.ManageAccountVo"%>
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
	<meta http-equiv="description" content="陕西省文化厅">
	<title>陕西省文化厅</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
            <div>
			<h1><img src="library/img/彩色logo.png" style="width:150px;margin-top:10px"></h1>		
		</div>
		<div id="sidebar">
			
		
			<ul>
				
				<%
					ManageAccountVo userVo=(ManageAccountVo)session.getAttribute("userVo");
					String level=userVo.getAccountLevel();
					if(level.equals("0")||level.equals("1")){
						
				 %>
				
				<li class="submenu">
					<a href="#"><i class="icon icon-list-4""></i> <span>管理员</span> <span class="label">2</span></a>
					<ul>
						<li class="active"><a href="/Library/servlet/manageAccountListServlet">管理员列表</a></li>
						<li><a href="/Library/library/addManageAccount.jsp">添加管理员</a></li>
					
					</ul>
				</li>
				<%
					}
				 %>
			   <li class="submenu">
				     <a href="#"><i class="icon icon-list-4"></i> <span>志愿者</span> <span class="label">1</span></a>
				     <ul>
				     	<li><a href="/Library/servlet/volunteerList">志愿者列表</a></li>
				     	<li><a href="/Library/library/addVolunteer.jsp">添加志愿者</a></li>
				     	
					</ul>
				</li>
				<li class="submenu">
				     <a href="#"><i class="icon icon-list-4"></i> <span>活动管理</span> <span class="label">2</span></a>
				     <ul>
				     	
				     	<li><a href="/Library/servlet/activeListServlet">活动列表</a></li>
					 		<li><a href="/Library/library/addActive.jsp">添加活动</a></li>	
					</ul>
				</li>
				<li class="submenu">
				     <a href="#"><i class="icon icon-list-4"></i> <span>新闻管理</span> <span class="label">2</span></a>
				     <ul>
				     	
				     	<li><a href="/Library/servlet/newsListServlet">新闻列表</a></li>
					 		<li><a href="/Library/library/addNews.jsp">添加新闻</a></li>	
					</ul>
				</li>
				<li class="submenu">
				     <a href="#"><i class="icon icon-list-4"></i> <span>培训管理</span> <span class="label">2</span></a>
				     <ul>
				     	
				     	<li><a href="/Library/servlet/trainListServlet">培训列表</a></li>
					 		<li><a href="/Library/library/uploadTrain.jsp">添加培训材料</a></li>	
					</ul>
				</li>
			
				<li><a href="/Library/library/updatePassWord.jsp"><i  class="icon icon-list-4"></i><span>&nbsp;&nbsp;修改密码</span></a></li>
				<li><a href="/Library/servlet/logOutServlet"><i  class="icon icon-user"></i><span>&nbsp;&nbsp;退出登录</span></a></li>
			</ul>
		</div>
		
		
  </body>
</html>
