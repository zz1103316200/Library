<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="com.library.vo.VolunteerVo"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
VolunteerVo vo=(VolunteerVo)session.getAttribute("volunteerVo");
if(vo!=null){
	request.getRequestDispatcher("../servlet/volunteerLoginServlet?userName="+vo.getVolunteerIdCard()+"&&passWord="+vo.getVolunteerPassWord()).forward(request,response);
}

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<title>陕西省志愿者</title>
    <link href="../front/css/shou.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../front/js/yao.js"></script>
	<link type="text/css" rel="stylesheet" href="../front/css/style.css" />
	
	<link rel="stylesheet" type="text/css" href="../front/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../front/icon/icon.css">
	<script type="text/javascript" src="../front/js/jquery-1.4.3.min.js"></script>
	<script type="text/javascript" src="../front/js/jquery.easyui.min.js"></script>
	
	<script type="text/javascript" src="../front/js/css.js"></script>
	
	<script type="text/javascript">
		
		
		
		function doCheck(){
			
			var userName=document.getElementById("userName").value;
    		var passWord=document.getElementById("passWord").value;
    		
    		if(userName==""||passWord==""){
    			$.messager.alert('提示','<font color="black">用户名或密码不能为空，请重新输入</font>','info');
    			return;
    		}
    		
    		  var cbx = document.getElementsByName("shenfen");   
                var shenfen="";   
                for(var i=0;i<cbx.length;i++){   
	                if (cbx[i].checked)   {  
	               	 shenfen=cbx[i].value; break; 
	                }    
                }  
       		
       		
             if(shenfen=="管理员"){
       			document.login.action="../servlet/manageAccountLoginServlet"; 	
             	$.post("../servlet/selectUserNameServlet",{userName:userName,passWord:passWord,type:shenfen},function(result){
             	
             		
    				if(result=="false"){
    				
    					
    					$.messager.alert('提示','<font color="black">管理员用户名或密码错误，请重新输入</font>','info');
    				}else{
    					document.getElementById("login").submit();
    				}	
    		 	});
             		
             }else{
             	
             	document.login.action="../servlet/volunteerLoginServlet"; 	
             	$.post("../servlet/selectUserNameServlet",{userName:userName,passWord:passWord,type:shenfen},function(result){
             	
             		
    				if(result=="false"){
    					$.messager.alert('提示','<font color="black">志愿者用户名或密码错误，请重新输入</font>','info');
    				}else{
    					document.getElementById("login").submit();
    				}	
    		 	});
             
             }   
    		 
		
			//$.messager.alert('My Title','Here is a info message!','info');
		}
		
	</script>
		<STYLE type=text/css>BODY {
	FONT-SIZE: 12px; COLOR: #ffffff; FONT-FAMILY: 宋体
}
TD {
	FONT-SIZE: 12px; COLOR: #ffffff; FONT-FAMILY: 宋体
}
</STYLE>
	
	
  </head>
  
   <body>
			    <div class="topbox">
				<div class="wel">您好，欢迎光临陕西志愿者网站！~</div>
			    <div class="toplink">
			    	
			    </div>
			</div>
			
			<div class="head">
			  <div class="fl">
				<img src="../front/images/logo1.jpg"  width="100%" height="105px" />
			  </div>
			    
			</div>
			
			<div class="nav">
				<a href="../servlet/showFrontServlet">首页</a>
				<a href="../servlet/frontNewsListServlet"  >焦点新闻</a>
				<a href="../servlet/frontVolunteerListServlet">志愿者风采</a>
				<a href="../servlet/frontTrainListServlet" >志愿者培训</a>
				<a href="../servlet/frontActiveListServlet">专题活动</a>
				<a href="addVolunteer.jsp" >加入志愿者</a>
				<a href="../front/login.jsp" class="on">登陆</a>
			</div>
			
			
			
			
			  <br />
			  
			 
			
			<br />
		
		
			
			
			
			
			<form  id="login" method="post" name="login" >
			
			<DIV>
			<TABLE cellSpacing=0 cellPadding=0 width=900 align=center border=0>
			  <TBODY>
			  <TR>
			    <TD></TD></TR>
			  <TR>
			    <TD background=../front/login_files/login_2.jpg height=300>
			      <TABLE height=300 cellPadding=0 width=900 border=0>
			        <TBODY>
			        <TR>
			          <TD colSpan=2 height=35></TD></TR>
			        <TR>
			          <TD width=360></TD>
			          <TD>
			            <TABLE cellSpacing=0 cellPadding=2 border=0>
			              <TBODY>
			               <TR>
			                <TD style="HEIGHT: 28px" width=80></TD>
			                <TD style="HEIGHT: 28px" width=150></TD>
			                <TD style="HEIGHT: 28px" width=370></TD></TR>
			              <TR>
			              <TR>
			                <TD style="HEIGHT: 28px" width=80>用户名：</TD>
			                <TD style="HEIGHT: 28px" width=150><INPUT id="userName"  name="userName" 
			                  style="WIDTH: 130px" ></TD>
			                <TD style="HEIGHT: 28px" width=370></TD>
			              </TR>
			              <TR>
			                <TD style="HEIGHT: 28px">登录密码：</TD>
			                <TD style="HEIGHT: 28px"><INPUT  style="WIDTH: 130px" 
			                  type=password  id="passWord"  type="password" name="passWord" ></TD>
			                <TD style="HEIGHT: 28px"></TD></TR>
			              <TR>
			              
			                <TD style="HEIGHT: 28px" colspan="3">
			                
			                		<input type="radio"  name="shenfen" value="志愿者" checked > 志愿者
					               
					                <input type="radio"  name="shenfen" value="管理员" > 管理员
			                
			                </TD>
			   </form>           
			             </TR>
			              <TR>
			                <TD style="HEIGHT: 18px"></TD>
			                <TD style="HEIGHT: 18px"></TD>
			                <TD style="HEIGHT: 18px"></TD></TR>
			              <TR>
			                <TD></TD>
			                <TD>
			                
			             
			                
			                <input type="button" style="background:url(login_files/login_button.gif) no-repeat; border:none; width:105px;height:35px"  onclick="doCheck()" />  
			                  
			              </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
			  <TR>
			    <TD></TD></TR></TBODY></TABLE></DIV></DIV>
					<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
