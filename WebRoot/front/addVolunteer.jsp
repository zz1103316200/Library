<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="com.library.vo.ActiveVo"%>
<%@page import="com.library.vo.FenyeVo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<title>����ʡ�Ļ���</title>
    <link href="../front/css/shou.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../front/js/yao.js"></script>
	<link type="text/css" rel="stylesheet" href="../front/css/style.css" />
	
	
	
	
	<script type="text/javascript" src="../front/js/Calendar2.js"></script>
	<script type="text/javascript" src="../front/js/page.js"></script>
	<script type="text/javascript" src="../front/js/jquery-1.4.3.min.js"></script>
	<script type="text/javascript" src="../front/js/css.js"></script>
	<script type="text/javascript" src="../front/js/jilian.js"></script>
	<script type="text/javascript" src="../front/js/volunteerValidate.js"></script>
	<script type="text/javascript" src="../front/js/jquery.validate.js"></script>
	
	
	
	<style type="text/css">
        body
        {
            font-family:Arial, Sans-Serif;
            font-size:0.85em;
        }
        img 
        {
            border:none;
        }
        ul, ul li
        {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }
        ul li.first
        {
            border-top: 1px solid #DFDFDF;
        }
        ul li.last
        {
            border: none;
        }
        ul p
        {
            float: left;
            margin: 0;
            width: 310px;
        }
        ul h3
        {
            float: left;
            font-size: 14px;
            font-weight: bold;
            margin: 5px 0 0 0;
            width: 200px;
            margin-left:20px;
        }
        ul li
        {
            border-bottom: 1px solid #DFDFDF;
            padding: 15px 0;
            width:600px;
            overflow:hidden;
        }
        ul input[type="text"], ul input[type="password"],ul textarea,ul select
        {
            width:300px;
            padding:5px;
            position:relative;
            border:solid 1px #666;
            -moz-border-radius:5px;
            -webkit-border-radius:5px;
        }
        ul input.required 
        {
            border: solid 1px #f00;
        }
    </style>
	
  </head>
  
   <body onload="setup()">
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
			
				<a href="addVolunteer.jsp" class="on">����־Ը��</a>
				<a href="../front/login.jsp">��¼</a>
			</div>
			
			
			
			
			<div class="main mt">
				
					     <div class="companybox fl " align="left">
					    	
					<img src="../front/images/addVolunteer.jpg"  width="900px" height="540px" />
					    
					    <br />
					    <!--  
					    <form action="../servlet/addVolunteerServlet" id="volunteer" method="post" enctype="multipart/form-data">
					    <ul>
					        <li >
					            <h3>��ʵ����</h3>
					            <p class="first">
					
					                <input type="text"  id="volunteerName"  name="volunteerName" /></p>
					        </li>
					        <li >
					            <h3>�ֻ���</h3>
					            <p class="first">
					                <input type="text" id="tel"  name="tel"  /></p>
					        </li>
					         <li >
					            <h3>ע����֯</h3>
					            <p class="first">
					                <input type="text" id="registOrganization"  name="registOrganization"  /></p>
					        </li>
					        <li >
					            <h3>���֤��</h3>
					            <p class="first">
					                <input type="text" id="volunteerIdCard"  name="volunteerIdCard"  /></p>
					        </li>
					        
					         <li >
					            <h3>��֤����</h3>
					            <p class="first">
					               <input id="getCardData" type="text" name="getCardData"  onfocus="setday(this) " />
					                
					                </p>
					        </li>
					        <li >
					            <h3>����סַ</h3>
					            <p class="first">
					               <input id="commonAddress" type="text" name="commonAddress"   />
					                
					                </p>
					        </li>
					         <li >
					        		<h3>����</h3>
									
									<P class="first">
										<select name="age">
											<option value=18>20������</option>
											<option value="23" selected >20-25��</option>
											<option value="27">26-30��</option>
											<option value="32">31-35��</option>
											<option value="40">35������</option>
										</select>
									</p>
										
					        </li>
					          <li >
					            <h3> �������� </h3>
					            <p class="first">
					            	<select name="sheng" id ="companyLocation" class="cform-select" style="width:100px"></select>
									<select name="shi" id = "city"style="width:100px"></select>
									<select name="xian" id ="county" style="width:100px"></select>
					            
					            </p>
					
					        </li>
					         <li >
					            <h3>�ϴ���Ƭ</h3>
					            <p class="first">
					                <input type="file" name="file" ></p>
					
					        </li>
					        
					       
					        
					        <li class="first">
								<h3>�Ա�</h3>
						<p style="width:50%"><input type="radio" name="sex" value="��" checked />&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="Ů" />&nbsp;&nbsp;Ů</p>
								      
					       
					        </li>
					       
					        
					        
					       
					          <li>
					            <h3>�س�</h3>
					            <p class="first">
					                <textarea id="volunteerSpeciality" name="volunteerSpeciality"  cols="40" rows="10" title="�س�"></textarea>
					            </p>
					
					        </li>
					        <li class="last">
					            <div align="right">
					            	<button  type="submit" class="btn btn-primary">�ύ</button>
					            	
					            </div>
					
					        </li>
					    </ul>
					    	</form>
						-->
					    
					 
					 
					      
					     


<br />

					  
					    
					  
					   </div>
				
			</div>
			    
			  
			    
			    <div class="clear"></div>
			
			
			
			
			  <br />
			  
			 
			
			<br />
			<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
