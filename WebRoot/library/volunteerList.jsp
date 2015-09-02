<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.library.vo.VolunteerVo"%>
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
    
    <title>My JSP 'tables.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="陕西省文化厅">
	<title>陕西省文化厅</title>
	
	<meta charset="UTF-8" />
	 
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="library/css/bootstrap.min.css" />
		<link rel="stylesheet" href="library/css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="library/css/uniform.css" />
		<link rel="stylesheet" href="library/css/select2.css" />		
		<link rel="stylesheet" href="library/css/unicorn.main.css" />
		<link rel="stylesheet" href="library/css/unicorn.grey.css" class="skin-color" />	
	  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
   
      
      <script src="library/js/jquery.min.js"></script>
            <script src="library/js/jquery.ui.custom.js"></script>
            <script src="library/js/bootstrap.min.js"></script>
            <script src="library/js/jquery.uniform.js"></script>
            <script src="library/js/select2.min.js"></script>
            <script src="library/js/jquery.dataTables.min.js"></script>
            <script src="library/js/unicorn.js"></script>
            <script src="library/js/unicorn.tables.js"></script>
    <script type="text/javascript">
	
	//修改
	function doPreUpdate(volunteerId){
		window.location.href="/Library/servlet/updateVolunteerServlet?type=pre&&volunteerId="+volunteerId;
	}
	
	function doVolunteerDetail(volunteerId){
		window.location.href="/Library/servlet/volunteerDetailServlet?volunteerId="+volunteerId;
	}
	//批准
	var shenheVolunteerId;
	
	function doPreShenhe(volunteerId){
		shenheVolunteerId=volunteerId;
		
		$("#confirmShenhe").modal();	
	}
	
	function doShenhe(){
		window.location.href="/Library/servlet/volunteerShenheServlet?volunteerId="+shenheVolunteerId;
	}
	
	
	//删除
	var deleteVolunteerId;
	
	function doPreDelete(volunteerId){
	
		deleteVolunteerId=volunteerId;
		
		$("#confirmDelete").modal();	
	}
	
	function doDelete(){
		window.location.href="/Library/servlet/deleteVolunteerServlet?volunteerId="+deleteVolunteerId;
	}
	
	
	function doSearchSubmit(){
	    
	    var bigAge=document.getElementById("bigAge").value.trim();
	    var littleAge=document.getElementById("littleAge").value.trim();
	    
	    if((!isNaN(bigAge))&&(!isNaN(littleAge))){
   			document.getElementById("searchForm").submit();	
		}else{
			alert("搜索年龄请输入数字");
		}
	    
		
	}
	
	
	
	
	
	//高级搜索
	
	function doPreHighSearch(){

		$("#highSearch").modal();	
	}
	
</script>
    
    
  </head>
  
  <body>
  	   <jsp:include  page="left.jsp"/>
		
		<div id="content">
			<div id="content-header">
				<h1>志愿者管理</h1>
				<div class="btn-group">
				
					
				</div>
			</div>
			
			 
			
			<div id="breadcrumb">
				<a  class="tip-bottom"><i class="icon-home"></i> Home</a>
				<a href="servlet/volunteerList" class="current">志愿者</a>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						
			
						
						<div class="widget-box">
							<div class="widget-title">
							
								
								<h5>    <form name="searchForm" id="searchForm" action="/Library/servlet/searchVolunteerServlet"  method="post"> 特长： <input name="volunteerSpeciality"  style="width:300px" type="text" >    年龄:  <input id="littleAge" name="littleAge"  style="width:50px" type="text" >- <input id="bigAge" name="bigAge"  style="width:50px" type="text" >  常用住址： <input name="commonAddress"  style="width:230px" type="text" > <a href="javascript:void(0)" onclick=doSearchSubmit() class="btn btn-primary btn-mini">搜索</a> <a href="javascript:void(0)" onclick=doPreHighSearch() class="btn btn-primary btn-mini">高级搜索</a> </form></h5> 
							</div>                                                      
							<div class="widget-content nopadding">
								<table class="table table-bordered data-table">
									<thead>
									<tr>
									<th>志愿者姓名</th>
									
									<th>性别</th>
									<th>年龄</th>
									<th>地址</th>
									<th>联系电话</th>
									<th>注册单位</th>
									<th>基本操作</th>
									</tr>
									</thead>
									<tbody>
									 <% 
          	List volunteerList=(ArrayList)request.getAttribute("volunteerList");
          	
          	for(int i=0;i<volunteerList.size();i++){
          	VolunteerVo vo=(VolunteerVo)volunteerList.get(i);
          	
          %>
          <tr>
          
            <td ><div align="center"><%=vo.getVolunteerName() %></div></td>
           
            <td ><div align="center"><%=vo.getSex() %></div></td>
            <td ><div align="center"><%=vo.getAge() %></div></td>
            <td ><div align="center"><%=vo.getSheng()+" "+vo.getShi()+" "+vo.getXian() %></div></td>
            <td ><div align="center"><%=vo.getTel() %></div></td>
            <td ><div align="center">
            		<%=vo.getRegistOrganization() %>
            	</div>
            </td>
            
            <td ><div align="center"> <span> 
           
            
            
            <a href="javascript:void(0)" onclick='doVolunteerDetail("<%=vo.getVolunteerId() %>")' class="btn btn-primary btn-mini">查看</a>&nbsp; &nbsp;
             
            <a href="javascript:void(0)" onclick='doPreUpdate("<%=vo.getVolunteerId() %>")' class="btn btn-primary btn-mini">修改</a>&nbsp; &nbsp;
            
            <a href="javascript:void(0)" onclick='doPreDelete("<%= vo.getVolunteerId()%>")' class="btn btn-danger btn-mini">删除</a>
            
            
            </span></span></div></td>           
          		
          	 
        
          
          </tr>
          
          <% 
              }
          %>
								
							
								
									</tbody>
									</table>  
							</div>
						</div>
					</div>
				</div>
				
				<jsp:include page="foot.jsp"></jsp:include>
				
			</div>
		</div>
		
		<!-- 隐藏的审核确认框  -->
		 <div class="modal fade" id="confirmShenhe" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  				<div class="modal-dialog">
    					<div class="modal-content">
							       <div class="modal-header">
							          <button type="button" data-dismiss="modal" aria-hidden="true" class="close">&times;</button>
							          <h3>确认审核</h3>
							      </div>
      							 <div class="modal-body">
       		                    
                                        <label class="control-label">确定批准该志愿者吗？</label>                                  
                              
 								 </div>        
   										<div class="modal-footer"><a href="#" data-dismiss="modal" class="btn">关闭</a>
  											 <a href="javascript:void{0}" onclick="doShenhe()" data-dismiss="modal" class="btn btn-primary">确定</a>
                                        </div>
  
  						</div>
 				 </div>
  			</div>
		
				<!-- 隐藏的删除确认框  -->
		 <div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  				<div class="modal-dialog">
    					<div class="modal-content">
							       <div class="modal-header">
							          <button type="button" data-dismiss="modal" aria-hidden="true" class="close">&times;</button>
							          <h3>确认删除</h3>
							      </div>
      							 <div class="modal-body">
       		                    
                                        <label class="control-label">确定删除该志愿者吗？</label>                                  
                              
 								 </div>        
   										<div class="modal-footer"><a href="#" data-dismiss="modal" class="btn">关闭</a>
  											 <a href="javascript:void{0}" onclick="doDelete()" data-dismiss="modal" class="btn btn-primary">确定</a>
                                        </div>
  
  						</div>
 				 </div>
  			</div>
		
		<!-- 隐藏的详细搜索框  -->
		
		<div class="modal fade" id="highSearch" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  				<div class="modal-dialog">
    					<div class="modal-content">
    					    <div class="widget-title">
								<span class="icon">
									<i class="icon-align-justify"></i>									
								</span>
								<h5>高级搜索</h5>
							</div>
							  <div class="widget-content nopadding">
								<form id="highSearch" action="/Library/servlet/highSearchServlet" method="post" class="form-horizontal" />
								   
									<div class="control-group">
										<label class="control-label">志愿者姓名</label>
										<div class="controls">
											<input type="text" name="volunteerName" />
										</div>
									</div>
									
									<div class="control-group">
										<label class="control-label">注册单位</label>
										<div class="controls">
											<input  type="text" name="registOrganization" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">手机号</label>
										<div class="controls">
											<input  type="text" name="tel" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">身份证</label>
										<div class="controls">
											<input  type="text" name="volunteerIdCard" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">证书号</label>
										<div class="controls">
											<input  type="text" name="cardNumber" />
											
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">特长</label>
										<div class="controls">
											<input  type="text" name="volunteerSpeciality" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">常用地址</label>
										<div class="controls">
											<input  type="text" name="commonAddress" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">年龄</label>
										<div class="controls">
											下限：<input  type="text" name="littleAge" style="IME-MODE: disabled; WIDTH: 50px" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="5" size="14" name="littleAge" type="text" />
									 	          上限：<input  type="text" name="bigAge" style="IME-MODE: disabled; WIDTH: 50px" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="5" size="14" name="littleAge" type="text"  />
										</div>
									</div>
									
									
									
									<div class="form-actions">
										
										<div class="modal-footer"><button type="submit" class="btn btn-primary">Save</button><a href="#" data-dismiss="modal" class="btn">关闭</a>
									</div>
								</form>
							</div>
  
  						</div>
 				 </div>
  			</div>
		
  </body>
</html>
