<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="com.library.vo.ActiveVo"%>
<%@page import="com.library.vo.FenyeVo"%>
<%@page import="com.library.vo.VolunteerVo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@page import="com.library.tools.LibraryTools"%>
<%@page import="com.library.vo.NewsVo"%>
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
	
 
 
  </head>
  
  <body>
			    <div class="topbox">
				<div class="wel">���ã���ӭ��������־Ը����վ��~</div>
			    <div class="toplink">
			    	
			    </div>
			</div>
			
			<jsp:include page="top.jsp"></jsp:include>
			


	
			<div class="main mt">
	
    <div class="scenter fl border">
    <% 
    	List newsList=(ArrayList)request.getAttribute("newsList");
    	for(int i=0;i<newsList.size();i++){
    	if(i==3){
    		break;
    	}
    	NewsVo newsVo=(NewsVo)newsList.get(i);
    %>
    	<br />
    	<font size="3"><b><a href="frontNewsDetailServlet?newsId=<%=newsVo.getNewsId() %>" ><%=LibraryTools.getLimitSting(newsVo.getNewsTitle(),19)%></a></b></font>
        <div class="smalltext" align="left">
        	<%=LibraryTools.getShortContent(newsVo.getNewsContent()) %>...<a href="frontNewsDetailServlet?newsId=<%=newsVo.getNewsId() %>"  >[�鿴����]</a>
        </div>
		
    <%
    	}
     %>
    </div>
	<div class="sright fl border">
			
				<div class="weiduduan clearfix">
				<div id="news">
					<% 
						List pictureNewsList=(ArrayList)request.getAttribute("pictureNewsList");
						for(int i=0;i<pictureNewsList.size();i++){
							if(i>=5){
								break;
							}
							NewsVo  pictureNewsVo=(NewsVo)pictureNewsList.get(i);
					%>
				
					<dl>
					  <dt><a target="_blank" href="frontNewsDetailServlet?newsId=<%=pictureNewsVo.getNewsId() %>"  title="<%=pictureNewsVo.getNewsTitle() %>"><img src="<%=LibraryTools.getPicturePath(pictureNewsVo.getNewsContent()) %>" alt="<%=pictureNewsVo.getNewsTitle() %>" /></a></dt>
					  <dd>
						<h3><a target="_blank" href="frontNewsDetailServlet?newsId=<%=pictureNewsVo.getNewsId() %>" ><font color="white"><%=pictureNewsVo.getNewsTitle() %></font></a></h3>
						<p class="newsTitle"><%=LibraryTools.getShortContent(pictureNewsVo.getNewsContent()) %><a  target="_blank" href="frontNewsDetailServlet?newsId=<%=pictureNewsVo.getNewsId() %>">...[�鿴��ϸ]</a></p>
					  </dd>
					</dl>
					<% 
						}
					%>
					
					
					
					
					<p id="newsInfo"><a href="#1" class="current">1</a><a href="#1">2</a><a href="#1">3</a><a href="#1">4</a><a href="#1">5</a></p>
				<script type="text/javascript">
				<!--
				YAO.YTabs({
						tabs: YAO.getEl('newsInfo').getElementsByTagName('a'),
						contents: YAO.getEl('news').getElementsByTagName('dl'),
						auto: true,
						fadeUp: true
				});
				//-->
				</script>    
			</div>
		</div>
	
	
	</div>
    
    <div class="clear"></div>
</div>


		<div class="main mt">
			<div class="cat fl">
		    
		       
		        <div class="newbox fl mt">
		        	<div class="tab">
		            	<div class="on"><a href="frontActiveListServlet"  class="on"><font color="#0099FF">ר��</font></a></div>
		        	</div>
					<!-- һ���ģ�� -->
						<% 
							List activeList=(ArrayList)request.getAttribute("activeList");
							List firstActiveList=(ArrayList)request.getAttribute("activeTotalList");
							
							
							for(int i=0;i<activeList.size();i++){
								if(i>=3){
									break;
								}
							ActiveVo activeVo=(ActiveVo)activeList.get(i);
							
						%>
							  <div>
								  <div class="pictxt2" style="float:left">
									  <div class="pic lr">
									  		<% 
									  			String pictruePath=LibraryTools.getPicturePath(activeVo.getActiveContent());
									  			
									  		%>
									  
											<img src="<%=pictruePath %>" />
												<div class="ttext2">
													<a  class="bai" title="<%=activeVo.getActiveTitle() %>" href="frontActiveDetailServlet?activeId=<%=activeVo.getActiveId() %>" ><font color="white"><%=activeVo.getActiveTitle() %></font>
													</a>
												</div>
												
									  </div>
											
								  </div>
								  <div class="tabox" align="left">
								  
								  		
										<ul class="list_1s">
											
											<%
												int brFlag=0;
											 %>
											
											<li><a href="frontActiveDetailServlet?activeId=<%=activeVo.getActiveId() %>"><%=activeVo.getActiveTitle() %> </a></li>
											<% 
												if(firstActiveList.size()>0){
													ActiveVo firstVo=(ActiveVo)firstActiveList.get(0);
												%>
													<li><a href="frontActiveDetailServlet?activeId=<%=firstVo.getActiveId() %>"><%=firstVo.getActiveTitle() %> </a></li>
													
												<% 
													firstActiveList.remove(0);
													brFlag++;
												}
												
											%>
												<% 
												if(firstActiveList.size()>0){
													ActiveVo firstVo=(ActiveVo)firstActiveList.get(0);
												%>
													<li><a href="frontActiveDetailServlet?activeId=<%=firstVo.getActiveId() %>"><%=firstVo.getActiveTitle() %> </a></li>
													
												<% 
													firstActiveList.remove(0);
													brFlag++;
												}
												
											%>
											
												
											
											<br />
										</ul>
								  </div>
							   </div>
							   <% 
							   	}
							   %>
					<!--  �ģ�����-->
							  
							    
		        </div>
		    	<div class="newbox fr mt">
		        	<div class="tab">
		            	<div class="on"><a href="frontVolunteerListServlet"  class="on"><font color="#0099FF">־Ը�߷��</font></a></div>
		        	</div>
				   <div class="pictxt5">
							<table border="0">
									<% 
									List volunteerList=(ArrayList)request.getAttribute("volunteerList");
									
							for(int i=0;i<volunteerList.size();i++){
							
						%>
						
						<tr >
							<% 
							    int flag=0;
								while(i<volunteerList.size()){
									if(i>=6){
										break;
									}
									flag++;
									VolunteerVo vo=(VolunteerVo)volunteerList.get(i);
							%>
							<td >
								<div class="pic">
									<img src="../<%=vo.getPicturePath() %>" />
									<div class="ttext1"><font color="white"><a href="../servlet/sampleVolunteerDetailServlet?volunteerId=<%=vo.getVolunteerId() %>" class="bai" <%=vo.getVolunteerName() %>" target="_blank">־Ը��:<%=vo.getVolunteerName() %></a></font>&nbsp;&nbsp;&nbsp;</div>
										
								</div>
							
							</td>
							<% 
							   
								if(flag==2){
								   break;
								}else{
									i++;
								}
								
								
								}
								if(i>=6){
									break;
								}
							%>
							
						</tr>
					<% 
						}
					
					%>
								
							</table>
		           
		           </div>
		            
		        </div>
		        <br clear="all" />
		
		        
		  </div>
		  <br />
		    <div class="slide fr">
		    	<div class="box">
		        	<div class="tab">
		            	<a href="frontTrainListServlet"  class="on"><font color="#0099FF">��ѵ����</font></a>
		            </div>
		            <div class="list" align="left">
		                <ul class="list_1">
		                	<%
		                		List trainList=(ArrayList)request.getAttribute("trainList");
		                		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
		                		for(int i=0;i<trainList.size();i++){
		                		if(i>6){
		                			break;
		                		}
		                		File file=(File)trainList.get(i);
		                	 %>
		                    <li><span class="fr">
		                    <%
						            	Calendar cal = Calendar.getInstance();   
						            	long time = file.lastModified();   
                                             
						            	cal.setTimeInMillis(time);     
						            	%>
						            	<%=formatter.format(cal.getTime()) %>
		                    
		                    </span>&middot;
		                    
		                    
		                    <%=file.getName() %></li>
		                   
		                   
							<% 
								}
							%>
		                   
		                </ul>
		            </div>
		        </div>
		    
		    	        
		  </div>
		  <div class="clear"></div>
		</div>
			
			
			  <br />
			
<div class="indexad mt">
   <div align="left"  ><font size="2" color="#0099FF" style="margin-left:15px;margin-top:10px;" ><b>��������</b></font><div>


<a href="http://www.zgzyz.org.cn/"> <img src="/Library/front/images/zhiyuanzhewang.gif" /></a>
<a href="http://cva.mca.gov.cn/"><img height="80" width="160" src="/Library/front/images/�л�־Ը��Э��.jpg" /></a>
<a href="http://www.snwh.gov.cn/"><img height="80" width="190" src="/Library/front/images/�����Ļ���Ϣ��.jpg" /></a>
<a href="http://www.ndcnc.gov.cn/"><img height="80" width="190" src="/Library/front/images/���������Ļ���.jpg" /></a>
<a href="http://www.snwh.gov.cn/sxwh/"><img height="80" width="190" src="/Library/front/images/����ʡ�Ļ���.jpg" /></a>
</div>
			
			<br />
			<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
