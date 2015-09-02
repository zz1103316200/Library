<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="com.library.vo.NewsVo"%>
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
	<script type="text/javascript" src="../front/js/page.js"></script>
	<script type="text/javascript" src="../front/js/jquery-1.4.3.min.js"></script>
	<script type="text/javascript" src="../front/js/css.js"></script>
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
				<a href="showFrontServlet">首页</a>
				<a href="frontNewsListServlet" class="on"  >焦点新闻</a>
				<a href="frontVolunteerListServlet">志愿者风采</a>
				<a href="frontTrainListServlet">志愿者培训</a>
				<a href="frontActiveListServlet">专题活动</a>
				<a href="../front/addVolunteer.jsp">加入志愿者</a>
				<a href="../front/login.jsp">登录</a>
			</div>
			
			
			
			<div class="main mt">
				
			    <div class="companybox fl">
			    	<div class="path" align="left">
			        	<strong>您的位置：</strong><a href="showFrontServlet">首页</a>&nbsp;&gt;&nbsp;<a  href="frontNewsListServlet">焦点新闻</a>
			        </div>
			    	<div class="list mt">
			    		<%
			    			FenyeVo vo=(FenyeVo)request.getAttribute("fenyeVo");
			    			List newsList=vo.getCurrentList();
			    			for(int i=0;i<newsList.size();i++){
			    				NewsVo newsVo=(NewsVo) newsList.get(i);
			    		%>
			    			  <div align="left">&middot;<a href="frontNewsDetailServlet?newsId=<%=newsVo.getNewsId() %>"><%=newsVo.getNewsTitle() %></a>&nbsp;&nbsp;&nbsp;<%=newsVo.getNewsPublisher() %>&nbsp;&nbsp;&nbsp;&nbsp;<%=newsVo.getNewsPublishTime() %></div>
			    			  <% 
			    			  if(i%5==0&&i!=0){
			    			  	%>
			    			  			<br />
			    			  	<%
			    			  }
			    			  
			    			  %>
			    			  
			    		<%	
			    			}
			    		 %>
			    	
			        	
			        </div>
			    	
			    	<div id="hhtPage1Div" class="mt"></div>
			        <script type="text/javascript">
			         //var hhtPage1 = new HHTPage1(100,2,4);
			         
			         var hhtPage1 = new HHTPage1(<%=vo.getTotalCount() %>,<%=vo.getCurrentPage()%>,<%=vo.getTotalPage() %>);
			         var URL = "frontNewsListServlet?currentPage=";
					 URL = encodeURI(encodeURI(URL));
					 var basePath = "";
					 hhtPage1.init();
					 hhtPage1.leave=7;
					 hhtPage1.indexHeight = "20";   //页码方框高
					 hhtPage1.indexWidth = "25";    //页码方框宽
					 hhtPage1.fontSize = "13";    //字体大小
			        </script>
			        
			   </div>
				
			</div>
			    
			  
			    
			    <div class="clear"></div>
			
			
			
			
			  <br />
			  
			 
			
			<br />
			<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
