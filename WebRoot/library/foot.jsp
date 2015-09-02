<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'foot.jsp' starting page</title>
    
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
    		<div class="row-fluid">
					<div id="footer" class="span12">
						版权所有:是陕西省文化厅 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 维护:全国文化信息资源共享工程陕西省分中心  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   制作:陕西省公共数字文化服务联合实验室 
					</div>
			</div>
  </body>
</html>
