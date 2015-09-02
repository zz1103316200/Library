<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	
	function doUpdate(accountId){
		window.location.href="/Library/servlet/updateManageAccountServlet?type=preUpdate&accountId="+accountId;
	}
	
	function doDelete(accountId){
	
				    
	    window.location.href="/Library/servlet/deleteManageAccountServlet?accountId="+accountId;
	
	}
	

	
	
	
</script>
    
    
  </head>
  
  <body>
  	   <jsp:include  page="left.jsp"/>
		
		<div id="content">
			<div id="content-header">
				<h1>系统管理员</h1>
				<div class="btn-group">
					<a class="btn btn-large tip-bottom" title="ADD" href="/Library/library/addManageAccount.jsp">添加</a>
					
				</div>
			</div>
			
			 
			
			<div id="breadcrumb">
				<a  title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a>
				<a  class="current">管理员</a>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						
			
						
						<div class="widget-box">
							<div class="widget-title">
							
								<h5>管理员列表</h5>
							</div>
							<div class="widget-content nopadding">
								<table class="table table-bordered data-table">
									<thead>
									<tr>
									<th>用户名</th>
									<th>等级</th>
									<th>所在区域</th>
									<th>基本操作</th>
									</tr>
									</thead>
									<tbody>
									 <% 
          	List manageAccountList=(ArrayList)request.getAttribute("manageAccountList");
          	
          	for(int i=0;i<manageAccountList.size();i++){
          	ManageAccountVo account=(ManageAccountVo)manageAccountList.get(i);
          	if(account.getAccountUserName().equals("super")){
          		continue;
          	}
          %>
          <tr>
               
            <td ><span align="center"><%=account.getAccountUserName() %></span></td>
            <td ><span align="center"> 
            <%
            	String level= account.getAccountLevel().trim(); 
            	
            	if(level.equals("1")){
            		
            	%>
            		<%="省级" %>
            	<% 	
            	}
            	if(level.equals("2")){
            	%>
            		<%="市级" %>
            	<% 	
            	}
            	if(level.equals("3")){
            	%>
            		<%="县级" %>
            	<%
            	}
            	%>
            	</span>
            </td>
            <td ><div align="center"><%=account.getAddress() %></div></td>
            <td ><div align="center"> <span> <a href="javascript:void(0)" onclick='doUpdate("<%=account.getAccountId() %>")' class="btn btn-primary btn-mini">编辑</a>&nbsp; &nbsp;<a href="javascript:void(0)" onclick='doDelete("<%= account.getAccountId()%>")' class="btn btn-danger btn-mini">删除</a></span></span></div></td>           
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
  </body>
</html>
