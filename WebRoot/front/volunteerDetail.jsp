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
				$.messager.alert('提示','请填写完整信息');
				return ;
			}
			
			if(firstPassWord!=oldPassWord){
				$.messager.alert('提示','原始密码不正确');
				return;
			}
			
			if(newPassWord!=rePassWord){
				$.messager.alert('提示','两次密码不一致');
				return ;
			}
			
			$.post("../servlet/updatePassWordServlet",{passWord:newPassWord,volunteerId:globalVolunteerId},function(result){
             	
             		
    				if(result=="true"){
    					window.location.href="../servlet/frontLogOutServlet";
    				}	
    		});
    		
    		//$.post("../servlet/selectUserNameServlet",{userName:"ffff",passWord:"ddddd",type:"管理员"},function(result){
             	
            // 		alert(result);
    		//});
			
		}
		
		function open(){
			$('#update').panel('open');
		}
		function close(passWord){
			$('#update').panel('close');
			
			if(passWord=="123456"){
			   $.messager.alert('提示','您的密码为初始密码，存在安全风险，请您修改','info');	
				
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
				<a href="../servlet/frontNewsListServlet" >焦点新闻</a>
				<a href="../servlet/frontVolunteerListServlet">志愿者风采</a>
				<a href="../servlet/frontTrainListServlet">志愿者培训</a>
				<a href="../servlet/frontActiveListServlet">专题活动</a>
				<a href="../front/addVolunteer.jsp">加入志愿者</a>
				<a href="../front/login.jsp" class="on">登录</a>
				<a href="../servlet/frontLogOutServlet">退出登录</a>
			</div>
		
		
		
		<div class="main mt">
			
			   <div class="right2 fl">
					 <div class="shop_right fl">
					 <!--  
				    	<div class="hsearch border">
				        	<select class="input1"><option value="">煤种</option></select>
				        	<select class="input2"><option value="">地区</option></select>
				        	<select class="input3"><option value="">发热量</option></select>
				        	<select class="input4"><option value="">卖方性质</option></select>
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
				    <td align="right">志愿者姓名：</td>
				    <td ><%=volunteerVo.getVolunteerName() %></td>
				  	<td align="right">性别：</td>
				    <td><%=volunteerVo.getSex() %></td>
				  </tr>
				  <tr>
				    <td align="right">密码：</td>
				    <td ><%=volunteerVo.getVolunteerPassWord() %>  <a href="script:void(0)" onclick="doUpdatePassWord('<%=volunteerVo.getVolunteerPassWord() %>','<%=volunteerVo.getVolunteerId() %>')"><font color="blue" >修改密码</font></a> </td>
				  	<td align="right">联系电话：</td>
				    <td><%=volunteerVo.getTel() %></td>
				  </tr>
				  <tr>
				    <td align="right">身份证：</td>
				    <td><%=volunteerVo.getVolunteerIdCard() %></td>
				    <td align="right">年龄：</td>
				    <td><%=volunteerVo.getAge() %></td>
				  </tr>
				  <tr>
				    <td align="right">所在区域：</td>
				    <td><%=volunteerVo.getSheng()+"  "+volunteerVo.getShi()+"  "+volunteerVo.getXian() %></td>
				    <td align="right">常用地址：</td>
				    <td><%=volunteerVo.getCommonAddress() %></td>
				  </tr>
				  <tr>
				    <td align="right">注册单位：</td>
				    <td><%=volunteerVo.getRegistOrganization() %></td>
				    <td align="right">证书号：</td>
				    <td><%=volunteerVo.getCardNumber() %></td>
				  </tr>
				 
				  <tr>
				    <td align="right">特长：</td>
				    <td colspan="3"><%=volunteerVo.getVolunteerSpeciality() %></td>
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
        	<div  align="left" style="float:left;width:80%"><strong>志愿者心声：</strong></div>  <div  align="left"  style="float:left:width:20%"><strong><a href="../front/addArticle.jsp">【撰写心声】</a></strong></div>
        </div>
        <div class="downlist mt border">
        	<div class="h">
            	
            	<div class="b">&nbsp;&nbsp;文章名称</div>
            	<div class="d">发表日期</div>
            	<div class="e">操作</div>
            	
            	
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
            	<div class="e"> <a href="../servlet/frontArticleDetailServlet?articleId=<%=articleVo.getArticleId() %>" > 查看</a><a href="../servlet/frontUpdateArticleServlet?type=preUpdate&&articleId=<%=articleVo.getArticleId() %>"> 修改</a><a href="javascript:void(0)" onclick="doDelete('<%=articleVo.getArticleId() %>')"> 删除</a>  </div>
            
                
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
		
		

	<div id="update" class="easyui-window" title="修改密码" icon="icon-save" style="width:300px;height:160px;padding:5px;background: #fafafa;" >
			
			原始密码:<input id="firstPassWord" type="password" />
			<br />
			
			新密码:<input id="newPassWord" type="password" />
			<br />
			
			确认密码:<input id="rePassWord" type="password" />
			<br />
			
			<button onclick="doUpdate()">确认</button>
	</div>
		
		
  </body>
</html>
