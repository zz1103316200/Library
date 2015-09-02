<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'logIn.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="陕西省文化厅">
	<title>陕西省文化厅</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	  <title>陕西志愿者服务平台</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="library/css/bootstrap.min.css" />
		<link rel="stylesheet" href="library/css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="library/css/unicorn.login.css" />
       
    	
    	 <script src="library/js/bootstrap-datepicker.js"></script>
            <script src="library/js/jquery.min.js"></script>
            <script src="library/js/jquery.ui.custom.js"></script>
            <script src="library/js/bootstrap.min.js"></script>
            <script src="library/js/jquery.uniform.js"></script>
        	<script src="library/js/unicorn.login.js"></script> 
    	
    	<script type="text/javascript">
    		function doCheck(){
    			var userName=document.getElementById("username").value;
    			var passWord=document.getElementById("password").value;
    			 $.post("servlet/selectUserNameServlet",{userName:userName,passWord:passWord},function(result){
    				if(result=="false"){
    					$("#alertError").modal();	
    				}else{
    					document.getElementById("loginform").submit();
    				}	
    						
    						
 			    });
 			   
    		}
    	
    	</script>
    	
  </head>
  
  <body>
    <div id="logo">
          <div id="logo">
            <img src="library/img/黑白logo.png" alt="" />
        </div>
        <div id="loginbox">            
            <form id="loginform" class="form-vertical" action="servlet/manageAccountLoginServlet" />
				<p>欢迎来到志愿者平台管理系统</p>
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-user"></i></span><input type="text" style="height:30px" id="username" placeholder="Username" name="userName" />
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-lock"></i></span><input style="height:30px" id="password" type="password" placeholder="Password" name="passWord" />
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                   
                    <span class="pull-right"><input type="button" onclick="doCheck()" class="btn btn-inverse" value="登陆" /></span>
                </div>
            </form>
            <form id="recoverform" action="#" class="form-vertical" />
				<p>Enter your e-mail address below and we will send you instructions how to recover a password.</p>
				<div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-envelope"></i></span><input type="text" placeholder="E-mail address" />
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <span class="pull-left"><a href="#" class="flip-link" id="to-login">&lt; Back to login</a></span>
                    <span class="pull-right"><input type="button"  class="btn btn-inverse" value="Recover" /></span>
                </div>
            </form>
        </div>
        
     
     <!-- 隐藏的提示 -->
		 <div class="modal fade" id="alertError" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  				<div class="modal-dialog">
    					<div class="modal-content">
							       <div class="modal-header">
							          <button type="button" data-dismiss="modal" aria-hidden="true" class="close">&times;</button>
							          <h3>提示信息</h3>
							      </div>
      							 <div class="modal-body">
       		                    
                                        <label class="control-label">用户名或密码错误 请重新填写</label>                                  
                              
 								 </div>        
   										<div class="modal-footer"><a href="#" data-dismiss="modal" class="btn btn-primary">关闭</a>
  											 
                                        </div>
  
  						</div>
 				 </div>
  			</div>
		
   
  </body>
</html>
