<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="com.library.vo.NewsVo"%>
<%@page import="com.library.vo.VolunteerVo"%>
<%@page import="com.library.vo.VolunteerActiveVo"%>
<%@page import="com.library.vo.ArticleVo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

    session.removeAttribute("volunteerVo");


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
	
	</script>
	
  </head>


  </head>
  
  <body>
		    <div class="topbox">
			<div class="wel">vo���ã���ӭ��������־Ը����վ��~</div>
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
				<a href="frontNewsListServlet" >��������</a>
				<a href="frontVolunteerListServlet" class="on">־Ը�߷��</a>
				<a href="frontTrainListServlet">־Ը����ѵ</a>
				<a href="frontActiveListServlet">ר��</a>
			
				<a href="../front/addVolunteer.jsp">����־Ը��</a>
				<a href="../front/login.jsp" >��¼</a>
			
			</div>
		
		
		
		<div class="main mt">
			
			   <div class="right2 fl">
					 <div class="shop_right fl">
					
							<br />
				        	<br />
						<div class="goodsinfo border mt">
				        	<%
				        		VolunteerVo volunteerVo=(VolunteerVo)request.getAttribute("volunteerVo");
				        	
				        	 %>
				        	
				            <div class="info">
				            	<a  class="fl"><img src="../<%=volunteerVo.getPicturePath() %>"  style="width:200px;height:220px" /></a>
			<table width="75%" border="0" cellspacing="0" cellpadding="0" class="fr">
				  <tr>
				    <td align="right">־Ը��������</td>
				    <td ><%=volunteerVo.getVolunteerName() %></td>
				  	<td align="right">�Ա�</td>
				    <td><%=volunteerVo.getSex() %></td>
				  </tr>
				 
				 
				  <tr>
				    <td align="right">��������</td>
				    <td><%=volunteerVo.getSheng()+"  "+volunteerVo.getShi()+"  "+volunteerVo.getXian() %></td>
				    <td align="right">���õ�ַ��</td>
				    <td><%=volunteerVo.getCommonAddress() %></td>
				  </tr>
				 
				  <tr >
				    <td align="right"  >�س���</td>
				    <td colspan="3" style="height:120px;">
				    
				    	<%=volunteerVo.getVolunteerSpeciality() %>
				    
				    
				    </td>
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
        	<div  align="left" style="float:left;width:80%"><strong>־Ը��������</strong></div>  
        </div>
        <div class="downlist mt border">
        	<div class="h">
            	
            	<div class="b">&nbsp;&nbsp;��������</div>
            	<div class="d" align="right">��������</div>
            	<div class="e" align="right">����</div>
            	
            	
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
            	<div class="e"> <a href="../servlet/frontArticleDetailServlet?articleId=<%=articleVo.getArticleId() %>" > �鿴</a>  </div>
            
                
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
  </body>
</html>
