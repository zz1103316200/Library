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
	<title>����ʡ־Ը��</title>
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
    			$.messager.alert('��ʾ','<font color="black">�û��������벻��Ϊ�գ�����������</font>','info');
    			return;
    		}
    		
    		  var cbx = document.getElementsByName("shenfen");   
                var shenfen="";   
                for(var i=0;i<cbx.length;i++){   
	                if (cbx[i].checked)   {  
	               	 shenfen=cbx[i].value; break; 
	                }    
                }  
       		
       		
             if(shenfen=="����Ա"){
       			document.login.action="../servlet/manageAccountLoginServlet"; 	
             	$.post("../servlet/selectUserNameServlet",{userName:userName,passWord:passWord,type:shenfen},function(result){
             	
             		
    				if(result=="false"){
    				
    					
    					$.messager.alert('��ʾ','<font color="black">����Ա�û����������������������</font>','info');
    				}else{
    					document.getElementById("login").submit();
    				}	
    		 	});
             		
             }else{
             	
             	document.login.action="../servlet/volunteerLoginServlet"; 	
             	$.post("../servlet/selectUserNameServlet",{userName:userName,passWord:passWord,type:shenfen},function(result){
             	
             		
    				if(result=="false"){
    					$.messager.alert('��ʾ','<font color="black">־Ը���û����������������������</font>','info');
    				}else{
    					document.getElementById("login").submit();
    				}	
    		 	});
             
             }   
    		 
		
			//$.messager.alert('My Title','Here is a info message!','info');
		}
		
	</script>
		<STYLE type=text/css>BODY {
	FONT-SIZE: 12px; COLOR: #ffffff; FONT-FAMILY: ����
}
TD {
	FONT-SIZE: 12px; COLOR: #ffffff; FONT-FAMILY: ����
}
</STYLE>
	
	
  </head>
  
   <body>
			    <div class="topbox">
				<div class="wel">���ã���ӭ��������־Ը����վ��~</div>
			    <div class="toplink">
			    	
			    </div>
			</div>
			
			<div class="head">
			  <div class="fl">
				<img src="../front/images/logo1.jpg"  width="100%" height="105px" />
			  </div>
			    
			</div>
			
			<div class="nav">
				<a href="../servlet/showFrontServlet">��ҳ</a>
				<a href="../servlet/frontNewsListServlet"  >��������</a>
				<a href="../servlet/frontVolunteerListServlet">־Ը�߷��</a>
				<a href="../servlet/frontTrainListServlet" >־Ը����ѵ</a>
				<a href="../servlet/frontActiveListServlet">ר��</a>
				<a href="addVolunteer.jsp" >����־Ը��</a>
				<a href="../front/login.jsp" class="on">��½</a>
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
			                <TD style="HEIGHT: 28px" width=80>�û�����</TD>
			                <TD style="HEIGHT: 28px" width=150><INPUT id="userName"  name="userName" 
			                  style="WIDTH: 130px" ></TD>
			                <TD style="HEIGHT: 28px" width=370></TD>
			              </TR>
			              <TR>
			                <TD style="HEIGHT: 28px">��¼���룺</TD>
			                <TD style="HEIGHT: 28px"><INPUT  style="WIDTH: 130px" 
			                  type=password  id="passWord"  type="password" name="passWord" ></TD>
			                <TD style="HEIGHT: 28px"></TD></TR>
			              <TR>
			              
			                <TD style="HEIGHT: 28px" colspan="3">
			                
			                		<input type="radio"  name="shenfen" value="־Ը��" checked > ־Ը��
					               
					                <input type="radio"  name="shenfen" value="����Ա" > ����Ա
			                
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
