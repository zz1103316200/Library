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
	<title>����ʡ�Ļ���</title>
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
				<a href="showFrontServlet">��ҳ</a>
				<a href="frontNewsListServlet"  >��������</a>
				<a href="frontVolunteerListServlet">־Ը�߷��</a>
				<a href="frontTrainListServlet" class="on">־Ը����ѵ</a>
				<a href="frontActiveListServlet">ר��</a>
				<a href="../front/addVolunteer.jsp">����־Ը��</a>
				<a href="../front/login.jsp">��¼</a>
			</div>
			
			
			<div class="main mt">
				
			    <div class="cat1 fl">
			    	<div class="path" align="left" >
			        	<strong>����λ�ã�</strong><a href="showFrontServlet">��ҳ</a>&nbsp;&gt;&nbsp;<a  href="frontTrainListServlet">��������</a>
			        </div>
			        <div class="downlist mt border">
			        	<div class="h">
			            	<div class="a">����</div>
			            	<div class="b">�ļ�����</div>
			            	<div class="c">�ļ���С</div>
			            	
			            	<div class="d">�ϴ�����</div>
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
						                ú̿�������׹���ϵͳ��Ȩί���飬����Ҫ�Ŀͻ����������أ�
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
					 hhtPage1.indexHeight = "20";   //ҳ�뷽���
					 hhtPage1.indexWidth = "25";    //ҳ�뷽���
					 hhtPage1.fontSize = "13";    //�����С
			        </script>
			        
			        
			        
			        
			        
			    </div>
			    
				
				
			</div>
			    
			  
			    
			    <div class="clear"></div>
			
			
		<br>
</body>
</html>