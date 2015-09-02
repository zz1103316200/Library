package com.library.manageAccount;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.dao.ActiveDao;
import com.library.dao.IDAO;
import com.library.dao.NewsDao;
import com.library.tools.LibraryTools;

public class addNewsServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public addNewsServlet() {
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
		
		
		String newsTitle=request.getParameter("newsTitle");
		
		String newsContent=request.getParameter("newsContent").trim();
		newsContent=LibraryTools.getLimitSting(newsContent, 4000);
		
		String newsPublisher=request.getParameter("newsPublisher");
		
		
		
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		 String publishTime=formatter.format(new Date());
		
		IDAO dao=new NewsDao(); 
		dao.add(new Object[]{newsTitle,newsContent,newsPublisher,publishTime});
		
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
