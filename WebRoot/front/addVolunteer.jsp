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
	<title>陕西省文化厅</title>
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
			
				<a href="addVolunteer.jsp" class="on">加入志愿者</a>
				<a href="../front/login.jsp">登录</a>
			</div>
			
			
			
			
			<div class="main mt">
				
					     <div class="companybox fl " align="left">
					    	
					<img src="../front/images/addVolunteer.jpg"  width="900px" height="540px" />
					    
					    <br />
					    <!--  
					    <form action="../servlet/addVolunteerServlet" id="volunteer" method="post" enctype="multipart/form-data">
					    <ul>
					        <li >
					            <h3>真实姓名</h3>
					            <p class="first">
					
					                <input type="text"  id="volunteerName"  name="volunteerName" /></p>
					        </li>
					        <li >
					            <h3>手机号</h3>
					            <p class="first">
					                <input type="text" id="tel"  name="tel"  /></p>
					        </li>
					         <li >
					            <h3>注册组织</h3>
					            <p class="first">
					                <input type="text" id="registOrganization"  name="registOrganization"  /></p>
					        </li>
					        <li >
					            <h3>身份证号</h3>
					            <p class="first">
					                <input type="text" id="volunteerIdCard"  name="volunteerIdCard"  /></p>
					        </li>
					        
					         <li >
					            <h3>发证日期</h3>
					            <p class="first">
					               <input id="getCardData" type="text" name="getCardData"  onfocus="setday(this) " />
					                
					                </p>
					        </li>
					        <li >
					            <h3>常用住址</h3>
					            <p class="first">
					               <input id="commonAddress" type="text" name="commonAddress"   />
					                
					                </p>
					        </li>
					         <li >
					        		<h3>年龄</h3>
									
									<P class="first">
										<select name="age">
											<option value=18>20岁以下</option>
											<option value="23" selected >20-25岁</option>
											<option value="27">26-30岁</option>
											<option value="32">31-35岁</option>
											<option value="40">35岁以上</option>
										</select>
									</p>
										
					        </li>
					          <li >
					            <h3> 所在区域： </h3>
					            <p class="first">
					            	<select name="sheng" id ="companyLocation" class="cform-select" style="width:100px"></select>
									<select name="shi" id = "city"style="width:100px"></select>
									<select name="xian" id ="county" style="width:100px"></select>
					            
					            </p>
					
					        </li>
					         <li >
					            <h3>上传照片</h3>
					            <p class="first">
					                <input type="file" name="file" ></p>
					
					        </li>
					        
					       
					        
					        <li class="first">
								<h3>性别</h3>
						<p style="width:50%"><input type="radio" name="sex" value="男" checked />&nbsp;&nbsp;男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="女" />&nbsp;&nbsp;女</p>
								      
					       
					        </li>
					       
					        
					        
					       
					          <li>
					            <h3>特长</h3>
					            <p class="first">
					                <textarea id="volunteerSpeciality" name="volunteerSpeciality"  cols="40" rows="10" title="特长"></textarea>
					            </p>
					
					        </li>
					        <li class="last">
					            <div align="right">
					            	<button  type="submit" class="btn btn-primary">提交</button>
					            	
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
