<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="com.library.vo.VolunteerVo"%>

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
	
	<script>
		var flag="true";
		$(function(){
			$('#dd').dialog({
				
				buttons:[{
					text:'我已了解',
					iconCls:'icon-ok',
					handler:function(){
					
						close();
						return null;
					}
				}]
			});


		});
		function open(){
			$('#dd').dialog('open');
		}
		
		function close(){
			$('#dd').dialog('close');
		}
		function doTijiao(){
			var title=document.getElementById("articleTitle").value;
			
			var flag="true";
			
			if(title==""){
				alert("题目不能为空");
				flag="false";
				return null;
			
			}
			if(title.length>=25) {
				alert("题目字数太长");
				flag="false";
				return null;
			}
			
			
		
		}
	
	</script>
	
	
	
  </head>
  
   <body>
			    <div class="topbox">
				<div class="wel">i您好，欢迎光临陕西志愿者网站！~</div>
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
				<a href="../front/addVolunteer.jsp" >加入志愿者</a>
				<a href="../front/login.jsp" class="on">登录</a>
			</div>
			<div>
			
			
			 <form action="../servlet/addArticleServlet" method="post" id="form"> 
			      <br />
			       	<br />
			
			 <ul>
					      
				<div align="center">
					           <font size="3"> 文章标题:</font><input type="text" style="width:200px;" id="articleTitle" name="articleTitle" />
				</div>	        
				</ul>
				
			    	<br />
			       	<br />
			       <br />
			       	<br />
			       	<div align="center">
			        <textarea rows="40" cols="50" id="articleContent" name="articleContent"></textarea>
			      </div>
			       <br />
			    
					            <div align="center">
					            	
					            &nbsp;&nbsp;&nbsp;	<input type="image" onclick="doTijiao()" src="../front/images/submit.jpg" height="40px" width="80px" class="input6" />
					            </div>
					
							
			      </form>
			
		</div>
			    
			  
			    
			    <div class="clear"></div>
			
			
			
			
			  <br />
			  
			 
			
			<br />
			<jsp:include page="foot.jsp"></jsp:include>
			
	<div id="dd" icon="icon-save" style="padding:5px;width:600px;height:300px;" title="提示">
		<div align="left">
		
		<div align="center">关于志愿者互联网行为规范的法律要求</div>
		<br />
		陕西文化志愿者心声栏目展现文化志愿者服务风采，倾听分享文化志愿者服务心得。
		<br  />
		根据《中华人民共和国宪法》和相关法律法规规定，在保护公民合法言论自由的同时，禁止利用互联网、通讯工具、媒体以及其他方式从事以下行为：　
		<br  />
		一、组织、煽动抗拒、破坏宪法和法律、法规实施的。
		<br  />
		二、捏造或者歪曲事实，散布谣言，妨害社会管理秩序的。
		<br  />
		三、组织、煽动非法集会、游行、示威、扰乱公共场所秩序的。
		<br  />
		四、从事其他侵犯国家、社会、集体利益和公民合法权益的。
		<br  />
		管理部门将依法严加监管上述行为并予以处理；对构成犯罪的，司法机关将追究刑事责任。
		特别提示：志愿上网的记录将按法律规定保存和备查，请勿存在侥幸心理。
			
			
		</div>	
			
	</div>
			
  </body>
</html>
