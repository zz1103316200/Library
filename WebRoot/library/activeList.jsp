<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.library.vo.ActiveVo"%>
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
    
    <title>My JSP 'tables.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="陕西省文化厅">
	<title>陕西省文化厅</title>
	
	<meta charset="UTF-8" />
	  <title>陕西省文化厅</title>
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
	
	function doUpdate(activeId){
		window.location.href="/Library/servlet/updateActiveServlet?type=preUpdate&activeId="+activeId;
	}
	function doActiveDetail(activeId){
		window.location.href="/Library/servlet/activeDetailServlet?activeId="+activeId;
	}
	
	var globalActiveId;
	
	function doPreDelete(activeId){
		
		globalActiveId=activeId;
		
		$("#confirmDelete").modal();		    
	
	
	}
	
	function doDelete(){
		    window.location.href="/Library/servlet/deleteActiveServlet?activeId="+globalActiveId;
	}
	

	
	
</script>
    
    
  </head>
  
  <body>
  	   <jsp:include  page="left.jsp"/>
		
		<div id="content">
			<div id="content-header">
				<h1>专题活动</h1>
				<div class="btn-group">
					<a class="btn btn-large tip-bottom" title="ADD" href="library/addActive.jsp">添加</a>
					
				</div>
			</div>
			
			 
			
			<div id="breadcrumb">
				<a  class="tip-bottom"><i class="icon-home"></i> 活动管理</a>
				
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
									<th>发布时间</th>
									<th>发布者</th>
									<th>操作</th>
									</tr>
									</thead>
									<tbody>
									 <% 
          	List activeList=(ArrayList)request.getAttribute("activeList");
          	
          	for(int i=0;i<activeList.size();i++){
          	ActiveVo vo=(ActiveVo)activeList.get(i);
          	
          %>
          <tr>
          
            <td ><div align="center"><a href="javascript:void(0)" onclick='doActiveDetail("<%=vo.getActiveId() %>")'><%=vo.getActiveTitle() %></a></div></td>
            <td ><div align="center"><%=vo.getActivePublishTime() %></div></td>
            <td ><div align="center"><%=vo.getActivePublisher() %></div></td>
            <td ><div align="center">  <a href="javascript:void(0)" onclick='doUpdate("<%=vo.getActiveId() %>")' class="btn btn-primary btn-mini">编辑</a>&nbsp; &nbsp;<a href="javascript:void(0)" onclick='doPreDelete("<%= vo.getActiveId()%>")' class="btn btn-danger btn-mini">删除</a></div></td>           
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
		
  </body>
</html>
