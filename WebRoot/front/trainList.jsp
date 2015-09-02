<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="com.library.vo.NewsVo"%>
<%@page import="com.library.vo.FenyeVo"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	
	<script type="text/javascript" src="../front/js/jquery-1.4.3.min.js"></script>
	<script type="text/javascript" src="../front/js/css.js"></script>
	<script type="text/javascript" src="../front/js/page.js"></script>
	<script>
		function doDownload(id){
		   
		  
			document.getElementById("form"+id).submit();
		}
	</script>
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
				<a href="frontNewsListServlet"  >焦点新闻</a>
				<a href="frontVolunteerListServlet">志愿者风采</a>
				<a href="frontTrainListServlet" class="on">志愿者培训</a>
				<a href="frontActiveListServlet">专题活动</a>
				<a href="../front/addVolunteer.jsp">加入志愿者</a>
				<a href="../front/login.jsp">登录</a>
			</div>
			
			
			<div class="main mt">
				
			    <div class="cat1 fl">
			    	<div class="path" align="left" >
			        	<strong>您的位置：</strong><a href="showFrontServlet">首页</a>&nbsp;&gt;&nbsp;<a  href="frontTrainListServlet">下载中心</a>
			        </div>
			        <div class="downlist mt border">
			        	<div class="h">
			            	<div class="a">下载</div>
			            	<div class="b">文件名称</div>
			            	<div class="c">文件大小</div>
			            	
			            	<div class="d">上传日期</div>
			            </div>
			            
			            <%
			            	FenyeVo vo=(FenyeVo)request.getAttribute("fenyeVo");
			             	List fileList=vo.getCurrentList();
			             	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
			                for(int i=0;i<fileList.size();i++){
			                	File file=(File)fileList.get(i);
			                	
			                	%>
			            			<div class="l">
						            	<div class="a"><img src="../front/images/down_ico2.png" /></div>
						            	<div class="b"><a href="javascript:void(0)" onclick="doDownload('<%=i %>')"><%=file.getName() %></a></div>
						            		<form action="downloadTrainServlet" id="form<%=i %>" method="post">
						            		
						            			<textarea style="display:none" name="fileName"><%=file.getName() %></textarea>
						            		</form>
						            	<div class="c">
						            	
						            	<% 
						            			if(file.length()>1024*1024){
						            	%>
						            			<%=file.length()/(1024*1024) %>M
						            	<% 
						            			}else{
						            			%>
						            			<%=file.length()/1024 %>kb
						            			
						            			<%
						            			}
						            	 %>
						            	 
						            	 
						            	 </div>
						            	
						            	<div class="d"><%
						            	Calendar cal = Calendar.getInstance();   
						            	long time = file.lastModified();   
                                             
						            	cal.setTimeInMillis(time);     
						            	%>
						            	<%=formatter.format(cal.getTime()) %>
						            	</div>
						                <div class="info">
						                煤炭订货交易管理系统授权委托书，有需要的客户请自行下载！
						                </div>
						            </div>    	
			                	
			                	<% 
			                }
			             %>
			            
			        	
			        	
			        	
			        </div>
			    	
			        	<script type="text/javascript" src="../front/js/page.js"></script>
			    	<div id="hhtPage1Div" class="mt"></div>
			        <script type="text/javascript">
			          var hhtPage1 = new HHTPage1(<%=vo.getTotalCount() %>,<%=vo.getCurrentPage()%>,<%=vo.getTotalPage() %>);
			         var URL = "frontTrainListServlet?currentPage=";
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
			
			
		<br>
</body>
</html>