package com.library.manageAccount;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.dao.ActiveDao;
import com.library.dao.NewsDao;
import com.library.tools.LibraryTools;
import com.library.vo.ActiveVo;
import com.library.vo.NewsVo;

public class updateNewsServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public updateNewsServlet() {
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
		String type=request.getParameter("type");
		NewsDao dao=new NewsDao();
		String newsId=request.getParameter("newsId");
		//Ô¤ÐÞ¸Ä
		if(type!=null&&type.equals("preUpdate")){
			
			NewsVo newsVo=(NewsVo)dao.selectById(newsId);
			request.setAttribute("newsVo",newsVo);
			request.getRequestDispatcher("/library/updateNews.jsp").forward(request, response);
			return;
		}
		
		
		String  newsTitle=request.getParameter("newsTitle");
		
		String newsPublisher=request.getParameter("newsPublisher");
		
		String newsContent=request.getParameter("newsContent").trim();
		newsContent=LibraryTools.getLimitSting(newsContent, 4000);
		
		Object obj[]=new Object[]{newsTitle,newsContent,newsPublisher,newsId};
		
		dao.update(obj);
		
		
		request.getRequestDispatcher("/servlet/newsListServlet").forward(request, response);
		
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
