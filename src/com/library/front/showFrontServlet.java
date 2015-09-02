package com.library.front;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.dao.ActiveDao;
import com.library.dao.NewsDao;
import com.library.dao.VolunteerDao;
import com.library.tools.LibraryTools;
import com.library.vo.ActiveVo;
import com.library.vo.NewsVo;

public class showFrontServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public showFrontServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		//志愿者照片查出来 
		
		VolunteerDao volunteerDao=new VolunteerDao();
		List volunteerList= volunteerDao.selectVolunteerInFront();
		
		
		
		
		//查活动详情 用于图片
		ActiveDao activeDao=new ActiveDao();
		List firstActiveList= activeDao.selectActiveInFront();
		
		List activeList=new ArrayList();
		for(int i=0;i<3;i++){
			if(activeList.size()>=3){
				break;
			}
			
			if(firstActiveList.size()==0){
				break;
			}
			
			ActiveVo activeVo=(ActiveVo)firstActiveList.get(i);
			if(LibraryTools.isContainPicture(activeVo.getActiveContent())){
				activeList.add(activeVo);
				firstActiveList.remove(i);
				i--;
			}
			
			
		}
		
		
		
		
		
		//查新闻详情  用在图片部分
		NewsDao newsDao=new NewsDao();
		List firstPictureNewsList= newsDao.selectNewsInFront();
		List pictureNewsList=new ArrayList();
		for(int i=0;i<firstPictureNewsList.size();i++){
			NewsVo newsVo=(NewsVo)firstPictureNewsList.get(i);
			
			if(LibraryTools.isContainPicture(newsVo.getNewsContent())){
				pictureNewsList.add(newsVo);
				
			}
			
			if(pictureNewsList.size()>5){
				break;
			}
		}
		
		
		
		//新闻详情 用在列表部分
		
		List firstNewsList= newsDao.select(null);
		List newsList=new ArrayList();
		for(int i=0;i<firstNewsList.size();i++){
			NewsVo newsVo=(NewsVo)firstNewsList.get(i);
			
				newsList.add(newsVo);
			
			
			if(newsList.size()>5){
				break;
			}
		}
		
		
		//培训部分
		
		//文件路径
		String path=this.getServletContext().getRealPath("/")+"train";
		List totalFileList= frontTrainListServlet.getFileSort(path);
		
		
		
		
		request.setAttribute("volunteerList",volunteerList);
		request.setAttribute("activeList",activeList);
		//查活动详情 用于列表
		request.setAttribute("activeTotalList",firstActiveList);
		
		request.setAttribute("pictureNewsList",pictureNewsList);
		request.setAttribute("newsList",newsList);
		request.setAttribute("trainList", totalFileList);
		
		request.getRequestDispatcher("/front/show.jsp").forward(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
