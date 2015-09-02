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
	<title>陕西省文化厅</title>
    
    
	
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
			$.messager.confirm('提示消息', '确定删除吗?', function(r){
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
			<div class="wel">vo您好，欢迎光临陕西志愿者网站！~</div>
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
				<a href="frontNewsListServlet" >焦点新闻</a>
				<a href="frontVolunteerListServlet" class="on">志愿者风采</a>
				<a href="frontTrainListServlet">志愿者培训</a>
				<a href="frontActiveListServlet">专题活动</a>
			
				<a href="../front/addVolunteer.jsp">加入志愿者</a>
				<a href="../front/login.jsp" >登录</a>
			
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
				    <td align="right">志愿者姓名：</td>
				    <td ><%=volunteerVo.getVolunteerName() %></td>
				  	<td align="right">性别：</td>
				    <td><%=volunteerVo.getSex() %></td>
				  </tr>
				 
				 
				  <tr>
				    <td align="right">所在区域：</td>
				    <td><%=volunteerVo.getSheng()+"  "+volunteerVo.getShi()+"  "+volunteerVo.getXian() %></td>
				    <td align="right">常用地址：</td>
				    <td><%=volunteerVo.getCommonAddress() %></td>
				  </tr>
				 
				  <tr >
				    <td align="right"  >特长：</td>
				    <td colspan="3" style="height:120px;">
				    
				    	<%=volunteerVo.getVolunteerSpeciality() %>
				    
				    
				    </td>
				  </tr>
				</table>
				
				            
			 </div>
			
   <div class="cat1 fl">
    	<div class="path">
        	<div  align="left" style="float:left;width:90%"><strong>参加的活动：</strong></div>  
        </div>
        <div class="downlist mt border">
        	<div class="h">
            	
            	<div class="b">&nbsp;&nbsp;活动名称</div>
            	<div class="c">活动日期</div>
            	<div class="d">活动时数</div>
            	<div class="e">个人评价</div>
            	
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
        	<div  align="left" style="float:left;width:80%"><strong>志愿者心声：</strong></div>  
        </div>
        <div class="downlist mt border">
        	<div class="h">
            	
            	<div class="b">&nbsp;&nbsp;文章名称</div>
            	<div class="d" align="right">发表日期</div>
            	<div class="e" align="right">操作</div>
            	
            	
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
            	<div class="e"> <a href="../servlet/frontArticleDetailServlet?articleId=<%=articleVo.getArticleId() %>" > 查看</a>  </div>
            
                
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
