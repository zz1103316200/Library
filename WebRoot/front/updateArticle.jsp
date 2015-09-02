<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="com.library.vo.VolunteerVo"%>
<%@page import="com.library.vo.ArticleVo"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
VolunteerVo volunteerVo=(VolunteerVo)session.getAttribute("volunteerVo");
if(volunteerVo==null){
	response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<title>陕西省文化厅</title>
    <link href="../front/css/shou.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../front/js/yao.js"></script>
	<link type="text/css" rel="stylesheet" href="../front/css/style.css" />
	
	<link rel="stylesheet" type="text/css" href="../front/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../front/icon/icon.css">
	
	<!-- 从这里开始富文本编辑器  -->
	
			<link rel="stylesheet" href="../themes/default/default.css" />
	<link rel="stylesheet" href="../plugins/code/prettify.css" />
	<script charset="gbk" src="../kindeditor.js"></script>
	<script charset="gbk" src="../lang/zh_CN.js"></script>
	<script charset="gbk" src="../plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="articleContent"]', {
				cssPath : '../plugins/code/prettify.css',
				uploadJson : '../jsp/upload_json.jsp',
				fileManagerJson : '../jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
<!-- 富文本编辑器结束 -->
	
	<script type="text/javascript" src="../front/js/jquery-1.4.3.min.js"></script>
	<script type="text/javascript" src="../front/js/jquery.easyui.min.js"></script>
	
	<script type="text/javascript" src="../front/js/css.js"></script>
	<script type="text/javascript">
		
		function doSubmit(){
		var title=document.getElementById("articleTitle").value.trim();
			if(title==""){
				alert("题目不能为空");
				return;
				nengbu
			}
			if(title.length>=25) {
				alert("题目字数太长");
				return;
			}
			document.getElementById("").submit();
		}
		
		
	</script>
	
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
      
        ul input[type="text"]
        {
            width:300px;
            padding:5px;
            position:relative;
            border:solid 1px #666;
            -moz-border-radius:5px;
            -webkit-border-radius:5px;
        }
       
    </style>
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
				<a href="../servlet/showFrontServlet">首页</a>
				<a href="../servlet/frontNewsListServlet"  >焦点新闻</a>
				<a href="../servlet/frontVolunteerListServlet">志愿者风采</a>
				<a href="../servlet/frontTrainListServlet" >志愿者培训</a>
				<a href="../servlet/frontActiveListServlet">专题活动</a>
				<a href="addVolunteer.jsp" >加入志愿者</a>
				<a href="../front/login.jsp" class="on">登录</a>
			</div>
			
			
			 <form action="../servlet/frontUpdateArticleServlet" method="post" id="form"> 
			      <br />
			       	<br />
			<%
				ArticleVo articleVo=(ArticleVo)request.getAttribute("articleVo");
			
			 %>
			 <ul>
					        <li >
					            <h3>文章标题:</h3>
					            <p >
							
					                <input type="text" id="articleTitle" name="articleTitle" value="<%=articleVo.getArticleTitle() %>" /></p>
					        		
					        		<input type="hidden" name="articleId" value="<%=articleVo.getArticleId() %>" />
					        
					        </li>
					        
					        
				</ul>
				
			    	<br />
			       	<br />
			       <br />
			       	<br />
			        <textarea rows="40" cols="50" id="articleContent" name="articleContent"><%=articleVo.getArticleContent() %></textarea>
			      
			       <br />
			    
					            <div align="center">
					            	
					            &nbsp;&nbsp;&nbsp;	<input type="image" onclick="doSubmit()" src="../front/images/submit.jpg" height="40px" width="80px" class="input6" />
					            </div>
					
							
			      </form>
			
		
			    
			  
			    
			    <div class="clear"></div>
			
			
			
			
			  <br />
			  
			 
			
			<br />
			<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
