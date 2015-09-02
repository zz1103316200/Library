<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page contentType="text/html;charset=gbk"%>
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
    		<script src="library/js/Calendar2.js"></script>
    		<script src="library/js/jquery.validate.js"></script>
    		<script src="library/js/volunteerValidate.js"></script>
    		
	
	<!-- 从这里开始富文本编辑器  -->
	
			<link rel="stylesheet" href="themes/default/default.css" />
	<link rel="stylesheet" href="plugins/code/prettify.css" />
	<script charset="gbk" src="kindeditor.js"></script>
	<script charset="gbk" src="lang/zh_CN.js"></script>
	<script charset="gbk" src="plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="activeContent"]', {
				cssPath : 'plugins/code/prettify.css',
				uploadJson : '/Library/jsp/upload_json.jsp?test=liukai',
				fileManagerJson : '/Library/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
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
				<a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a>
				<a href="/Library/library/addVolunteer.jsp" class="tip-bottom">添加</a>
				
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-align-justify"></i>									
								</span>
								<h5>添加志愿者</h5>
							</div>
							<div class="widget-content nopadding">
								<form id="volunteer"  method="post" class="form-horizontal" action="servlet/addVolunteerServlet" enctype="multipart/form-data" />
								
									
									<div class="control-group">
										<label class="control-label">真实姓名：</label>
										<div class="controls">
											<input name="volunteerName" id="volunteerName" style="width:300px" type="text" >
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">手机号：</label>
										<div class="controls">
											<input name="tel" id="tel" style="width:300px" type="text" >
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">注册单位：</label>
										<div class="controls">
											<input name="registOrganization" id="registOrganization" style="width:300px" type="text" >
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">身份证号：</label>
										<div class="controls">
											<input name="volunteerIdCard" id="volunteerIdCard" style="width:300px" type="text" >
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">发证日期：</label>
										<div class="controls">
											<input name="getCardData" id="getCardData" style="width:300px" type="text" onfocus="setday(this) " >
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">证书号：</label>
										<div class="controls">
											<input name="cardNumber" id="cardNumber" style="width:300px" type="text" >
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">常用住址：</label>
										<div class="controls">
											<input name="commonAddress" id="commonAddress" style="width:300px" type="text" >
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">年龄：</label>
										<div class="controls">
										     <input id="age" type="text" name="age" style="width:300px"   />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">所在区域：</label>
										<div class="controls">
												<select name="sheng" id ="companyLocation" class="cform-select" style="width:100px"></select>
												<select name="shi" id = "city"style="width:100px"></select>
												<select name="xian" id ="county" style="width:100px"></select>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">上传照片：</label>
										<div class="controls">
											<input type="file" name="file" >
										</div>
									</div>
									
									
									<div class="control-group">
										<label class="control-label">性别：</label>
										<div class="controls">
											<select name="sex" >
												<option selected="selected">男</option>
												<option>女</option>
											</select>
										</div>
									</div>
									
									<div class="control-group">
										<label class="control-label">特长：</label>
										<div class="controls">
											<textarea id="volunteerSpeciality" name="volunteerSpeciality"  cols="40" rows="10" title="特长"></textarea>
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
