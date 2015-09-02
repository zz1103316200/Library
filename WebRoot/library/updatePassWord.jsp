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
    		
    		<script src="library/js/jquery.validate.js"></script>
    		<script src="library/js/activeValidate.js"></script>
			
			<script type="text/javascript">
				function init(flag){
					if(flag=="null"){
						
						return;
					}
					if(flag=="1"){
						$("#tishi").modal();	
					}
				
				}
			</script>
	
  </head>
  
  <% 
  	String flag=request.getAttribute("flag")+"";
  %>
  <body onload="init('<%=flag %>')">
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
				<a href="/Library/library/updatePassWord.jsp" class="tip-bottom">修改密码</a>
				
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-align-justify"></i>									
								</span>
								<h5>修改密码</h5>
							</div>
							<div class="widget-content nopadding">
								<form id="passWord"  method="post" class="form-horizontal" action="/Library/servlet/updateManagePassWordServlet" />
								
									
									<div class="control-group">
										<label class="control-label">原密码：</label>
										<div class="controls">
											<input name="oldPassWord" id="oldPassWord" type="password" style="width:300px" type="text" >
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">新密码：</label>
										<div class="controls">
											<input name="newPassWord" id="newPassWord" type="password" style="width:300px" type="text" >
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">确认新密码：</label>
										<div class="controls">
											<input name="rePassWord" id="rePassWord" type="password" style="width:300px" type="text" >
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
		<!-- 隐藏的提示框  -->
		 <div class="modal fade" id="tishi" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  				<div class="modal-dialog">
    					<div class="modal-content">
							       <div class="modal-header">
							          <button type="button" data-dismiss="modal" aria-hidden="true" class="close">&times;</button>
							          <h3>提示</h3>
							      </div>
      							 <div class="modal-body">
       		                    
                                        <label class="control-label">
                                        	表单提交有误，可能是:<br />
                                        	 1 原密码不正确，<br />
                                        	 2 格式错误，不能为空或太长，<br />
                                        	 3 两次密码输入不一致
                                        	
                                        </label>                                  
                              
 								 </div>        
   										<div class="modal-footer"><a href="#" data-dismiss="modal" class="btn">确定</a>
  											
                                        </div>
  
  						</div>
 				 </div>
  			</div>
  </body>
</html>
