<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="com.library.vo.NewsVo"%>
<%@page import="com.library.vo.VolunteerVo"%>
<%@page import="com.library.vo.VolunteerActiveVo"%>
<%@page import="com.library.vo.ArticleVo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

VolunteerVo vo=(VolunteerVo)session.getAttribute("volunteerVo");
	if(vo==null){
		response.sendRedirect("login.jsp");
	}

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <head>
   <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
	<title>����ʡ�Ļ���</title>
    
    
	
	 <link href="../front/css/shou.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../front/js/yao.js"></script>
	<link type="text/css" rel="stylesheet" href="../front/css/style.css" />
	
	<link rel="stylesheet" type="text/css" href="../front/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../front/icon/icon.css">
	<script type="text/javascript" src="../front/js/jquery-1.4.3.min.js"></script>
	<script type="text/javascript" src="../front/js/jquery.easyui.min.js"></script>
	
	<script type="text/javascript" src="../front/js/css.js"></script>
	
	
	
	<script type="text/javascript">
		
	
		
		function doDelete(articleId){
			$.messager.confirm('��ʾ��Ϣ', 'ȷ��ɾ����?', function(r){
				if (r){
					window.location.href="../servlet/frontDeleteArticleServlet?articleId="+articleId;
					
				}
			});
		}
	
		var oldPassWord;
		var globalVolunteerId;
		function doUpdatePassWord(passWord,volunteerId){
			oldPassWord=passWord;
			globalVolunteerId=volunteerId;
			
			open();
			
		}
		
		function doUpdate(){
		
			var firstPassWord=document.getElementById("firstPassWord").value.trim();
			var newPassWord=document.getElementById("newPassWord").value.trim();
			var rePassWord=document.getElementById("rePassWord").value.trim();
			
			if(firstPassWord==""||newPassWord==""||rePassWord==""){
				$.messager.alert('��ʾ','����д������Ϣ');
				return ;
			}
			
			if(firstPassWord!=oldPassWord){
				$.messager.alert('��ʾ','ԭʼ���벻��ȷ');
				return;
			}
			
			if(newPassWord!=rePassWord){
				$.messager.alert('��ʾ','�������벻һ��');
				return ;
			}
			
			$.post("../servlet/updatePassWordServlet",{passWord:newPassWord,volunteerId:globalVolunteerId},function(result){
             	
             		
    				if(result=="true"){
    					window.location.href="../servlet/frontLogOutServlet";
    				}	
    		});
    		
    		//$.post("../servlet/selectUserNameServlet",{userName:"ffff",passWord:"ddddd",type:"����Ա"},function(result){
             	
            // 		alert(result);
    		//});
			
		}
		
		function open(){
			$('#update').panel('open');
		}
		function close(passWord){
			$('#update').panel('close');
			
			if(passWord=="123456"){
			   $.messager.alert('��ʾ','��������Ϊ��ʼ���룬���ڰ�ȫ���գ������޸�','info');	
				
			}
			
		}
		
	</script>
	
  </head>


  </head>
  <%
				        		VolunteerVo volunteerVo=(VolunteerVo)request.getAttribute("volunteerVo");
				        	
				        	 %>
  <body onload="close('<%=volunteerVo.getVolunteerPassWord()%>')">
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
				<a href="../servlet/showFrontServlet">��ҳ</a>
				<a href="../servlet/frontNewsListServlet" >��������</a>
				<a href="../servlet/frontVolunteerListServlet">־Ը�߷��</a>
				<a href="../servlet/frontTrainListServlet">־Ը����ѵ</a>
				<a href="../servlet/frontActiveListServlet">ר��</a>
				<a href="../front/addVolunteer.jsp">����־Ը��</a>
				<a href="../front/login.jsp" class="on">��¼</a>
				<a href="../servlet/frontLogOutServlet">�˳���¼</a>
			</div>
		
		
		
		<div class="main mt">
			
			   <div class="right2 fl">
					 <div class="shop_right fl">
					 <!--  
				    	<div class="hsearch border">
				        	<select class="input1"><option value="">ú��</option></select>
				        	<select class="input2"><option value="">����</option></select>
				        	<select class="input3"><option value="">������</option></select>
				        	<select class="input4"><option value="">��������</option></select>
				        	<input type="text" class="input5" />
				        	<input type="image" src="images/but.png" class="input6" />
				        </div>
				-->
							<br />
				        	<br />
						<div class="goodsinfo border mt">
				        	
				        	
				            <div class="info">
				            	<a class="fl"><img src="../<%=volunteerVo.getPicturePath() %>" style="width:200px;height:210px" /></a>
			<table width="75%" border="0" cellspacing="0" cellpadding="0" class="fr">
				  <tr>
				    <td align="right">־Ը��������</td>
				    <td ><%=volunteerVo.getVolunteerName() %></td>
				  	<td align="right">�Ա�</td>
				    <td><%=volunteerVo.getSex() %></td>
				  </tr>
				  <tr>
				    <td align="right">���룺</td>
				    <td ><%=volunteerVo.getVolunteerPassWord() %>  <a href="script:void(0)" onclick="doUpdatePassWord('<%=volunteerVo.getVolunteerPassWord() %>','<%=volunteerVo.getVolunteerId() %>')"><font color="blue" >�޸�����</font></a> </td>
				  	<td align="right">��ϵ�绰��</td>
				    <td><%=volunteerVo.getTel() %></td>
				  </tr>
				  <tr>
				    <td align="right">���֤��</td>
				    <td><%=volunteerVo.getVolunteerIdCard() %></td>
				    <td align="right">���䣺</td>
				    <td><%=volunteerVo.getAge() %></td>
				  </tr>
				  <tr>
				    <td align="right">��������</td>
				    <td><%=volunteerVo.getSheng()+"  "+volunteerVo.getShi()+"  "+volunteerVo.getXian() %></td>
				    <td align="right">���õ�ַ��</td>
				    <td><%=volunteerVo.getCommonAddress() %></td>
				  </tr>
				  <tr>
				    <td align="right">ע�ᵥλ��</td>
				    <td><%=volunteerVo.getRegistOrganization() %></td>
				    <td align="right">֤��ţ�</td>
				    <td><%=volunteerVo.getCardNumber() %></td>
				  </tr>
				 
				  <tr>
				    <td align="right">�س���</td>
				    <td colspan="3"><%=volunteerVo.getVolunteerSpeciality() %></td>
				  </tr>
				</table>
				
				            
			 </div>
			
   <div class="cat1 fl">
    	<div class="path">
        	<div  align="left" style="float:left;width:90%"><strong>�μӵĻ��</strong></div>  
        </div>
        <div class="downlist mt border">
        	<div class="h">
            	
            	<div class="b">&nbsp;&nbsp;�����</div>
            	<div class="c">�����</div>
            	<div class="d">�ʱ��</div>
            	<div class="e">��������</div>
            	
            </div>
            
            <% 
            
            	List volunteerActiveList=(ArrayList)request.getAttribute("volunteerActiveList");
            	for(int i=0;i<volunteerActiveList.size();i++){
            	if(i>=5){
            		break;
            	}
            	VolunteerActiveVo volunteerActiveVo=(VolunteerActiveVo)volunteerActiveList.get(i);
            %>
            
        	<div class="l">
            	
            	<div class="b">&nbsp;&nbsp;<%=volunteerActiveVo.getActiveTitle() %></div>
            	<div class="c"><%=volunteerActiveVo.getActiveDate() %></div>
            	<div class="d"><%=volunteerActiveVo.getActiveHours() %></div>
            	<div class="e"><%=volunteerActiveVo.getEvaluation() %></div>
                
            </div>
            <%
            	}
             %>
            	
            	
        	
        </div>
    	
        
        
        
        
    </div>	
    
    
    
     <div class="cat1 fl">
    	<div class="path">
        	<div  align="left" style="float:left;width:80%"><strong>־Ը��������</strong></div>  <div  align="left"  style="float:left:width:20%"><strong><a href="../front/addArticle.jsp">��׫д������</a></strong></div>
        </div>
        <div class="downlist mt border">
        	<div class="h">
            	
            	<div class="b">&nbsp;&nbsp;��������</div>
            	<div class="d">��������</div>
            	<div class="e">����</div>
            	
            	
            </div>
            
            <% 
            	List articleList =(ArrayList)request.getAttribute("articleList");
            	
            	for(int i=0;i<articleList.size();i++){
            	if(i>=5){
            		break;
            	}
            	ArticleVo articleVo=(ArticleVo)articleList.get(i);
            %>
            
        	<div class="l">
            	
            	<div class="b">&nbsp;&nbsp;<%=articleVo.getArticleTitle() %></div>
            	<div class="d"><%=articleVo.getArticleTime() %></div>
            	<div class="e"> <a href="../servlet/frontArticleDetailServlet?articleId=<%=articleVo.getArticleId() %>" > �鿴</a><a href="../servlet/frontUpdateArticleServlet?type=preUpdate&&articleId=<%=articleVo.getArticleId() %>"> �޸�</a><a href="javascript:void(0)" onclick="doDelete('<%=articleVo.getArticleId() %>')"> ɾ��</a>  </div>
            
                
            </div>
            <%
            	}
             %>
            	
            	
        	
        </div>
    	
        
        
        
        
    </div>	
    	
			</div>
      			
      	    
		    <div class="clear"></div>
		</div>
		
		
		
		   
		    	        
		  
		  
		<br />
		
		<jsp:include page="foot.jsp"></jsp:include>
		
		

	<div id="update" class="easyui-window" title="�޸�����" icon="icon-save" style="width:300px;height:160px;padding:5px;background: #fafafa;" >
			
			ԭʼ����:<input id="firstPassWord" type="password" />
			<br />
			
			������:<input id="newPassWord" type="password" />
			<br />
			
			ȷ������:<input id="rePassWord" type="password" />
			<br />
			
			<button onclick="doUpdate()">ȷ��</button>
	</div>
		
		
  </body>
</html>
