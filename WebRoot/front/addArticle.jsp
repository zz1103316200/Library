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
	<title>����ʡ�Ļ���</title>
    <link href="../front/css/shou.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../front/js/yao.js"></script>
	<link type="text/css" rel="stylesheet" href="../front/css/style.css" />
	
	<link rel="stylesheet" type="text/css" href="../front/default/easyui.css">
	
	
	<!-- �����￪ʼ���ı��༭��  -->
	
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
<!-- ���ı��༭������ -->
	
	<script type="text/javascript" src="../front/js/jquery-1.4.3.min.js"></script>
	<script type="text/javascript" src="../front/js/jquery.easyui.min.js"></script>
	
	<script type="text/javascript" src="../front/js/css.js"></script>
	
	<script>
		var flag="true";
		$(function(){
			$('#dd').dialog({
				
				buttons:[{
					text:'�����˽�',
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
				alert("��Ŀ����Ϊ��");
				flag="false";
				return null;
			
			}
			if(title.length>=25) {
				alert("��Ŀ����̫��");
				flag="false";
				return null;
			}
			
			
		
		}
	
	</script>
	
	
	
  </head>
  
   <body>
			    <div class="topbox">
				<div class="wel">i���ã���ӭ��������־Ը����վ��~</div>
			    <div class="toplink">
			    	
			    </div>
			</div>
			
			<div class="head">
			  <div class="fl">
				<img src="../front/images/logo1.jpg"  width="100%" height="105px" />
			  </div>
			    
			</div>
			
			<div class="nav">
				<a href="../servlet/showFrontServlet">��ҳ</a>
				<a href="../servlet/frontNewsListServlet"  >��������</a>
				<a href="../servlet/frontVolunteerListServlet">־Ը�߷��</a>
				<a href="../servlet/frontTrainListServlet" >־Ը����ѵ</a>
				<a href="../servlet/frontActiveListServlet">ר��</a>
				<a href="../front/addVolunteer.jsp" >����־Ը��</a>
				<a href="../front/login.jsp" class="on">��¼</a>
			</div>
			<div>
			
			
			 <form action="../servlet/addArticleServlet" method="post" id="form"> 
			      <br />
			       	<br />
			
			 <ul>
					      
				<div align="center">
					           <font size="3"> ���±���:</font><input type="text" style="width:200px;" id="articleTitle" name="articleTitle" />
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
			
	<div id="dd" icon="icon-save" style="padding:5px;width:600px;height:300px;" title="��ʾ">
		<div align="left">
		
		<div align="center">����־Ը�߻�������Ϊ�淶�ķ���Ҫ��</div>
		<br />
		�����Ļ�־Ը��������Ŀչ���Ļ�־Ը�߷����ɣ����������Ļ�־Ը�߷����ĵá�
		<br  />
		���ݡ��л����񹲺͹��ܷ�������ط��ɷ���涨���ڱ�������Ϸ��������ɵ�ͬʱ����ֹ���û�������ͨѶ���ߡ�ý���Լ�������ʽ����������Ϊ����
		<br  />
		һ����֯��ɿ�����ܡ��ƻ��ܷ��ͷ��ɡ�����ʵʩ�ġ�
		<br  />
		�����������������ʵ��ɢ��ҥ�ԣ���������������ġ�
		<br  />
		������֯��ɿ���Ƿ����ᡢ���С�ʾ�������ҹ�����������ġ�
		<br  />
		�ġ����������ַ����ҡ���ᡢ��������͹���Ϸ�Ȩ��ġ�
		<br  />
		�����Ž������ϼӼ��������Ϊ�����Դ����Թ��ɷ���ģ�˾�����ؽ�׷���������Ρ�
		�ر���ʾ��־Ը�����ļ�¼�������ɹ涨����ͱ��飬������ڽ�������
			
			
		</div>	
			
	</div>
			
  </body>
</html>
