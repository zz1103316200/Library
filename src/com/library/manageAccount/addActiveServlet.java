package com.library.manageAccount;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.dao.IDAO;
import com.library.dao.ActiveDao;
import com.library.tools.LibraryTools;
import com.library.vo.ManageAccountVo;

public class addActiveServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public addActiveServlet() {
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
		
		
		String activeTitle=request.getParameter("activeTitle");
		String activeContent=request.getParameter("activeContent").trim();
		activeContent=LibraryTools.getLimitSting(activeContent, 4000);
		String activePublisher=request.getParameter("activePublisher");
		
		ManageAccountVo manage=(ManageAccountVo)request.getSession().getAttribute("userVo");
		
		
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		 String publishTime=formatter.format(new Date());
		
		IDAO dao=new ActiveDao(); 
		dao.add(new Object[]{activeTitle,activeContent,activePublisher,publishTime,manage.getAccountId()});
		
		request.getRequestDispatcher("/servlet/activeListServlet").forward(request, response);
		
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
