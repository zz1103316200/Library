<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page contentType="text/html;charset=utf-8"%>
<%@page import="com.library.vo.ManageAccountVo"%>
<%
ManageAccountVo userVo=(ManageAccountVo)session.getAttribute("userVo");
	
	if(userVo==null){
		response.sendRedirect("/Library/front/login.jsp");
		return;
	}
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    

  
	<style type="text/css">
	<!--
	body {
		margin-top: 0px;
	}
	.style1 {color: #0066FF}
	-->
	</style>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="陕西省文化厅">
	<title>陕西省文化厅</title>
	
	
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="library/css/bootstrap.min.css" />
		<link rel="stylesheet" href="library/css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="library/css/uniform.css" />
		<link rel="stylesheet" href="library/css/select2.css" />		
		<link rel="stylesheet" href="library/css/unicorn.main.css" />
		<link rel="stylesheet" href="library/css/unicorn.grey.css" class="skin-color" />	
	  
	  
   
      
           <script src="library/js/jquery.min.js"></script>
            <script src="library/js/jquery.ui.custom.js"></script>
            <script src="library/js/bootstrap.min.js"></script>
            <script src="library/js/jquery.uniform.js"></script>
            <script src="library/js/select2.min.js"></script>
            <script src="library/js/jquery.dataTables.min.js"></script>
            <script src="library/js/unicorn.js"></script>
            <script src="library/js/unicorn.tables.js"></script>
    		<script src="library/js/jilian.js"></script>
	
	<!-- 从这里开始富文本编辑器  -->
	
			<link rel="stylesheet" href="themes/default/default.css" />
	<link rel="stylesheet" href="plugins/code/prettify.css" />
	<script charset="gbk" src="kindeditor.js"></script>
	<script charset="gbk" src="lang/zh_CN.js"></script>
	<script charset="gbk" src="plugins/code/prettify.js"></script>

<!-- 富文本编辑器结束 -->
  </head>
  
  <body onload="setup()">
   <jsp:include  page="left.jsp"/>
		
		<div id="content">
			<div id="content-header">
				<h1>志愿者系统后台管理</h1>
		<!-- 
				
				<div class="btn-group">
					<a class="btn btn-large tip-bottom" title="Manage Files"><i class="icon-file"></i></a>
					<a class="btn btn-large tip-bottom" title="Manage Users"><i class="icon-user"></i></a>
					<a class="btn btn-large tip-bottom" title="Manage Comments"><i class="icon-comment"></i><span class="label label-important">5</span></a>
					<a class="btn btn-large tip-bottom" title="Manage Orders"><i class="icon-shopping-cart"></i></a>
				</div>
		 -->
			</div>
		
    
			<div id="breadcrumb">
				<a class="tip-bottom"><i class="icon-home"></i> Home</a>
				<a class="tip-bottom">上传培训材料</a>
				
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-align-justify"></i>									
								</span>
								<h5>上传材料</h5>
							</div>
							<div class="widget-content nopadding">
								<form  method="post"  ENCTYPE="multipart/form-data" class="form-horizontal" action="/Library/servlet/uploadTrainServlet" />
									
									       上传文件： <input type="file" name="file"><br/>  
              							<input type="submit" value="提交"/>  
									
								</form>
							</div>
						</div>						
					</div>
				</div>
		
		</div>
  </body>
</html>
