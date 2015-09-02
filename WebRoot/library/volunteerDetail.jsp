<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page contentType="text/html;charset=utf-8"%>
<%@page import="com.library.vo.VolunteerVo"%>
<%@page import="com.library.vo.ActiveVo"%>
<%@page import="com.library.vo.VolunteerActiveVo"%>
<%@page import="com.library.vo.ManageAccountVo"%>
<%@page import="com.library.vo.ArticleVo"%>

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
	
	<link rel="stylesheet" href="library/css/datepicker.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        
		<link rel="stylesheet" href="library/css/bootstrap.min.css" />
		<link rel="stylesheet" href="library/css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="library/css/uniform.css" />
		<link rel="stylesheet" href="library/css/select2.css" />		
		<link rel="stylesheet" href="library/css/unicorn.main.css" />
		<link rel="stylesheet" href="library/css/unicorn.grey.css" class="skin-color" />	
		<link rel="stylesheet" href="library/css/datepicker.css" />
		<link rel="stylesheet" href="library/css/colorpicker.css" />
		
	    
	  
   
            <script src="library/js/bootstrap-datepicker.js"></script>
            <script src="library/js/jquery.min.js"></script>
            <script src="library/js/jquery.ui.custom.js"></script>
            <script src="library/js/bootstrap.min.js"></script>
            <script src="library/js/jquery.uniform.js"></script>
            <script src="library/js/select2.min.js"></script>
            <script src="library/js/jquery.dataTables.min.js"></script>
            <script src="library/js/unicorn.js"></script>
            <script src="library/js/unicorn.tables.js"></script>
    		
	        <script src="library/js/bootstrap-datepicker.js"></script>
            <script src="library/js/unicorn.form_common.js"></script>
			
			
			<script type="text/javascript">
			
			   var globalActiveId;
			   var globalVolunteerId;
			           
				function doPreDelete(activeId,volunteerId){
				    globalActiveId=activeId;
				    globalVolunteerId=volunteerId;
					$("#confirmDelete").modal();
				}
				function doDelete(){
				  
					window.location.href="/Library/servlet/deleteActiveVolunteerServlet?activeId="+globalActiveId+"&volunteerId="+globalVolunteerId;
				}
				
				
				//删除文章
				
				var globalArticleId;
				
				function doPreDeleteArticle(articleId,volunteerId){
					globalArticleId=articleId;
				    globalVolunteerId=volunteerId;
					$("#deleteArticle").modal();
				}
				
				function doDeleteArticle(){
					
					window.location.href="/Library/servlet/deleteArticleServlet?articleId="+globalArticleId+"&volunteerId="+globalVolunteerId;
				}
				
				
				function doPreUpdate(activeId,volunteerId){
				  
				
					 $.post("/Library/servlet/selectActiveVolunteerInAjaxServlet",{activeId:activeId,volunteerId:volunteerId},function(result){
    						var obj=result.split("**");
    						document.getElementById("preUpdateActiveTitle").innerHTML=obj[0];
    						document.getElementById("preUpdateActiveId").value=activeId;
    						document.getElementById("preUpdateVolunteerId").value=volunteerId;
    						document.getElementById("preUpdateActiveHours").value=obj[1];
    						document.getElementById("preUpdateActiveDate").value=obj[2];
    						document.getElementById("preUpdateConfirmPeople").value=obj[3];
    						document.getElementById("preUpdateActiveContent").value=obj[4];
    						
    						var objItemText=obj[5];
    						
    						//var objSelect=document.getElementById("preUpdateEvaluation");
    						
    						//for(var i=0;i<objSelect.options.length;i++) {
					        //    alert(objSelect.options[i].value);
					        //    if(objSelect.options[i].value == objItemText) {
					        //       objSelect.options[i].selected =true;
					        //       break;
					            	
					        //    }
					        //}
    						
    						 $("#preUpdate").modal();
    						
 					 });
					// $("#preUpdate").modal();
					
					
					
				}
				
				
			</script>
	

  </head>
  
  <body>
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
		<%
								VolunteerVo vo=(VolunteerVo)request.getAttribute("VolunteerVo");
							
							
							 %>
    
			<div id="breadcrumb">
				<a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a>
				<a href="servlet/volunteerDetailServlet?volunteerId=<%=vo.getVolunteerId() %>" class="tip-bottom">志愿者</a>
				
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-align-justify"></i>									
								</span>
								<h5>志愿者详情</h5>
							</div>
							<div class="widget-content nopadding">
							
								<form  method="post" class="form-horizontal" action="servlet/updateManageAccountServlet" />
								    <div class="control-group">
										<div class="controls">
											<img alt="" src="<%=vo.getPicturePath() %>"></img>			
										</div>
										
									</div>
									<!--  
									<div class="control-group">
										<label class="control-label">志愿者姓名：</label>
										<div class="controls">
												<%=vo.getVolunteerName() %>
										</div>
										
									</div>
									-->
									
								<div class="widget-box">
							<div class="widget-title">
								<span class="icon"><i class="icon-time"></i></span>
								<h5>基本信息</h5>
								<span class="label label-info"></span>
							</div>
							<div class="widget-content nopadding">
								<table class="table table-striped table-bordered">
                                       
                                        <tbody>
                                            <tr>
                                                <td class="taskDesc"><i class="icon-info-sign"></i> 志愿者姓名：</td>
                                                <td class="taskStatus"><span class="in-progress"><%=vo.getVolunteerName() %></span></td>
                                                <td class="taskDesc"><i class="icon-info-sign"></i> 联系电话：</td>
                                                <td class="taskStatus"><span class="in-progress"><%=vo.getTel() %></span></td>
                                            </tr>
                                            <tr>
                                                <td class="taskDesc"><i class="icon-plus-sign"></i> 身份证：</td>
                                                 <td class="taskStatus"><span class="in-progress"><%=vo.getVolunteerIdCard() %></span></td>
                                                 <td class="taskDesc"><i class="icon-plus-sign"></i> 年龄：</td>
                                                 <td class="taskStatus"><span class="in-progress"><%=vo.getAge() %></span></td>
                                            </tr>
                                             <tr>
                                                <td class="taskDesc"><i class="icon-plus-sign"></i> 所在区域：</td>
                                                 <td class="taskStatus"><span class="in-progress"><%=vo.getSheng()+" "+vo.getShi()+" "+vo.getXian() %></span></td>
                                                 <td class="taskDesc"><i class="icon-plus-sign"></i> 常用地址：</td>
                                                <td class="taskStatus"><span class="in-progress"><%=vo.getCommonAddress() %></span></td>
                                            </tr>
                                              <tr>
                                                <td class="taskDesc"><i class="icon-plus-sign"></i> 注册单位：</td>
                                                 <td class="taskStatus"><span class="in-progress"><%=vo.getRegistOrganization() %></span></td>
                                                 <td class="taskDesc"><i class="icon-plus-sign"></i> 证书号：</td>
                                                <td class="taskStatus"><span class="in-progress"><%=vo.getCardNumber() %></span></td>
                                            </tr>
                                            <tr>
                                                <td class="taskDesc"><i class="icon-ok-sign"></i> 特长</td>
                                                 <td class="taskStatus" colspan="3"><span class="in-progress"><%=vo.getVolunteerSpeciality() %></span></td>
                                                
                                            </tr>
                                        </tbody>
                                    </table>
							</div>
						</div>	
									
							
								
								
									
								
								</form>
							</div>
						</div>						
					</div>
				</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						
			
						
						<div class="widget-box">
							<div class="widget-title">
							
								<h5>文章列表</h5>
							</div>
							<div class="widget-content nopadding">
								<table class="table table-bordered data-table">
									<thead>
									<tr>
									<th>文章名称</th>
									<th>发表日期</th>
									<th>操作</th>
									</tr>
									</thead>
									<tbody>
									 <% 
          	List articleList=(ArrayList)request.getAttribute("articleList");
          	
          	for(int i=0;i<articleList.size();i++){
          	ArticleVo articleVo=(ArticleVo)articleList.get(i);
          	
          %>
          <tr>
          
            <td ><div align="center"><%=articleVo.getArticleTitle() %></div></td>
            <td ><div align="center"><%=articleVo.getArticleTime() %></div></td>
          
            <td ><div align="center"> <span> <a href="servlet/articleDetailServlet?articleId=<%=articleVo.getArticleId() %>") class="btn btn-primary btn-mini">查看</a>&nbsp; &nbsp;<a href="javascript:void(0)" onclick='doPreDeleteArticle("<%=articleVo.getArticleId()%>","<%=vo.getVolunteerId() %>")' class="btn btn-danger btn-mini">删除</a></span></span></div></td>           
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
			</div>	
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						
			
						
						<div class="widget-box">
							<div class="widget-title">
							
								<h5>活动列表</h5>
							</div>
							<div class="widget-content nopadding">
								<table class="table table-bordered data-table">
									<thead>
									<tr>
									<th>活动名称</th>
									<th>活动日期</th>
									<th>服务时数</th>
									<th>个人评价</th>
									<th>操作</th>
									</tr>
									</thead>
									<tbody>
									 <% 
          List volunteerActiveList=(ArrayList)request.getAttribute("volunteerActiveList");
          	
          	for(int i=0;i<volunteerActiveList.size();i++){
          	VolunteerActiveVo volunteerActiveVo=(VolunteerActiveVo)volunteerActiveList.get(i);
          	
          %>
          <tr>
          
            <td ><div align="center"><%=volunteerActiveVo.getActiveTitle() %></div></td>
            <td ><div align="center"><%=volunteerActiveVo.getActiveDate() %></div></td>
            <td ><div align="center"><%=volunteerActiveVo.getActiveHours() %></div></td>
            <td ><div align="center"><%=volunteerActiveVo.getEvaluation() %></div></td>
            <td ><div align="center"> <span> <a href="javascript:void(0)" onclick='doPreUpdate("<%=volunteerActiveVo.getActiveId() %>","<%=vo.getVolunteerId() %>")' class="btn btn-primary btn-mini">编辑</a>&nbsp; &nbsp;<a href="javascript:void(0)" onclick='doPreDelete("<%=volunteerActiveVo.getActiveId() %>","<%=volunteerActiveVo.getVolunteerId() %>")' class="btn btn-danger btn-mini">删除</a></span></span></div></td>           
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
			</div>	
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-align-justify"></i>									
								</span>
								<h5>添加活动信息</h5>
							</div>
							<div class="widget-content nopadding">
								<form id="activeVolunteer" action="servlet/addVolunteerActiveServlet" method="post" class="form-horizontal" />
								   <div class="control-group">
										<label class="control-label">选择活动</label>
										<div class="controls">
											<select name="active" style="width:150px">
												<%
													List activeList=(ArrayList)request.getAttribute("activeList");
													for(int i=0;i<activeList.size();i++){
													    if(i>10){
													    	break;
													    }
														ActiveVo activeVo=(ActiveVo)activeList.get(i);
															
													%>
													<option value="<%=activeVo.getActiveId() %>"><%=activeVo.getActiveTitle() %></option>
											     <%
													}
												 %>
											</select>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">活动日期</label>
										<div class="controls">
											<input type="text" name="activeDate"  data-date-format="dd-mm-yyyy" />
										</div>
									</div>
									<input type="hidden" name="volunteerId" value="<%=vo.getVolunteerId() %>" />
									<div class="control-group">
										<label class="control-label">服务时数</label>
										<div class="controls">
											<input type="text" name="activeHours" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">确认者</label>
										<div class="controls">
											<input type="text" name="confirmPeople" />
											
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">个人评价:</label>
										<div class="controls">
											
											<select  name="evaluation" style="width:100px">
												<option value="满意" selected="selected">满意</option>
												<option value="一般">一般</option>
												<option value="不满意">不满意</option>
											</select>
											
											
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">服务内容</label>
										<div class="controls">
											<textarea name="activeContent" rows="9"></textarea> 
											
										</div>
									</div>
									
									<div class="form-actions">
										<button type="submit" class="btn btn-primary">Save</button>
									</div>
								</form>
							</div>
						</div>						
					</div>
				</div>
		</div>
		
				<!-- 隐藏的确认框  -->
		 <div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  				<div class="modal-dialog">
    					<div class="modal-content">
							       <div class="modal-header">
							          <button type="button" data-dismiss="modal" aria-hidden="true" class="close">&times;</button>
							          <h3>确认删除</h3>
							      </div>
      							 <div class="modal-body">
       		                    
                                        <label class="control-label">确定删除吗？</label>                                  
                              
 								 </div>        
   										<div class="modal-footer"><a href="#" data-dismiss="modal" class="btn">关闭</a>
  											 <a href="javascript:void{0}" onclick="doDelete()" data-dismiss="modal" class="btn btn-primary">确定</a>
                                        </div>
  
  						</div>
 				 </div>
  			</div>
  			
  				<!-- 隐藏的删除文章的确认框  -->
		 <div class="modal fade" id="deleteArticle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  				<div class="modal-dialog">
    					<div class="modal-content">
							       <div class="modal-header">
							          <button type="button" data-dismiss="modal" aria-hidden="true" class="close">&times;</button>
							          <h3>确认删除</h3>
							      </div>
      							 <div class="modal-body">
       		                    
                                        <label class="control-label">确定删除吗？</label>                                  
                              
 								 </div>        
   										<div class="modal-footer"><a href="#" data-dismiss="modal" class="btn">关闭</a>
  											 <a href="javascript:void{0}" onclick="doDeleteArticle()" data-dismiss="modal" class="btn btn-primary">确定</a>
                                        </div>
  
  						</div>
 				 </div>
  			</div>
  			
  			
  			<!-- 隐藏的预修改  -->
		 <div class="modal fade" id="preUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  				<div class="modal-dialog">
    					<div class="modal-content">
    					    <div class="widget-title">
								<span class="icon">
									<i class="icon-align-justify"></i>									
								</span>
								<h5>修改活动信息</h5>
							</div>
							  <div class="widget-content nopadding">
								<form id="activeVolunteer" action="servlet/updateVolunteerActiveServlet" method="post" class="form-horizontal" />
								   <div class="control-group">
										<label class="control-label">活动名称</label>
										<div class="controls">
											<span id="preUpdateActiveTitle"></span>
											<input type="hidden" name="activeId" id="preUpdateActiveId" />
											<input type="hidden" name="volunteerId" id="preUpdateVolunteerId" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">活动日期</label>
										<div class="controls">
											<input id="preUpdateActiveDate" type="text" name="activeDate"  data-date-format="dd-mm-yyyy"  class="datepicker" />
										</div>
									</div>
									<input type="hidden" name="volunteerId" value="<%=vo.getVolunteerId() %>" />
									<div class="control-group">
										<label class="control-label">服务时数</label>
										<div class="controls">
											<input id="preUpdateActiveHours" type="text" name="activeHours" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">确认者</label>
										<div class="controls">
											<input id="preUpdateConfirmPeople" type="text" name="confirmPeople" />
											
										</div>
									</div>
										
									
									<div class="control-group">
										<label class="control-label">服务内容</label>
										<div class="controls">
											<textarea id="preUpdateActiveContent" name="activeContent" rows="9"></textarea> 
											
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
