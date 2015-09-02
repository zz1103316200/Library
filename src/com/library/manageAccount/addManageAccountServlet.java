package com.library.manageAccount;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.library.dao.IDAO;
import com.library.dao.ManageAccountDao;
import com.library.db.BackConn;
import com.library.vo.ManageAccountVo;

public class addManageAccountServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public addManageAccountServlet() {
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
		
		
		
		IDAO dao=new ManageAccountDao(); 
		
		/*
		 * 增加一条语句
		
		*/
		String accountUserName=request.getParameter("accountUserName");
		String accountPassWord=request.getParameter("accountPassWord");
		String accountLevel=request.getParameter("level").trim();
		String sheng=request.getParameter("companyLocation");
		String shi=request.getParameter("city");
		String qu=request.getParameter("county");
	    String address="";
		
		if(accountLevel.equals("1")){
			address=sheng;
		}
		if(accountLevel.equals("2")){
			address=shi;
		}
		if(accountLevel.equals("3")){
			address=qu;
		}
		
		dao.add(new Object[]{accountUserName,accountPassWord,accountLevel,address});
		/*
		Object obj[]=new Object[]{accountUserName,accountPassWord,accountLevel,accountAddress};
		System.out.println(dao.add(obj));
		
		*/
		request.getRequestDispatcher("/servlet/manageAccountListServlet").forward(request, response);
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
