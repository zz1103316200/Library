<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page contentType="text/html;charset=utf-8"%>
<%@page import="com.library.vo.ManageAccountVo"%>
<%

ManageAccountVo userVo=(ManageAccountVo)session.getAttribute("userVo");
	
	if(userVo==null){
		response.sendRedirect("../front/login.jsp");
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
				
			<script src="library/js/jquery.validate.js"></script>
    		<script src="library/js/manageAccountValidate.js"></script>	
				
			<script type="text/javascript">
				
			</script>
	

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
				<a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a>
				<a href="/Library/library/addManageAccount.jsp" class="tip-bottom">管理员添加</a>
				
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-align-justify"></i>									
								</span>
								<h5>添加管理员账户</h5>
							</div>
							<div class="widget-content nopadding">
								<form id="manageAccount" method="post" class="form-horizontal" action="/Library/servlet/addManageAccountServlet" />
								
									
									<div class="control-group">
										<label class="control-label">管理员用户名：</label>
										<div class="controls">
											<input name="accountUserName" id="accountUserName"  style="width:300px" type="text" >
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">管理员密码：</label>
										<div class="controls">
											<input name="accountPassWord" id="accountPassWord" style="width:300px" type="password" >
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">确认密码：</label>
										<div class="controls">
											<input name="confirmPassWord" id="confirmPassWord" style="width:300px" type="password" >
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">管理员等级：</label>
										<div class="controls">
											<select name="level">
												<option value="1" >省级</option>
												<option value="2" >市级</option>
												<option value="3">县级</option>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">管理员区域：</label>
										<div class="controls">
											<select name="companyLocation" id ="companyLocation" style="width:100px"></select>
											<select name="city" id = "city"style="width:100px"></select>
											<select name="county" id ="county" style="width:100px"></select>
										</div>
									</div>
									
									<div class="form-actions">
										<button  type="submit" class="btn btn-primary">Save</button>
									</div>
								</form>
							</div>
						</div>						
					</div>
				</div>
		
		</div>
  </body>
</html>
