package com.library.front;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.dao.VolunteerDao;

public class frontSearchServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public frontSearchServlet() {
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
		request.setCharacterEncoding("gbk");
		
		String sheng=request.getParameter("sheng");
		String shi=request.getParameter("shi");
		String xian=request.getParameter("xian");
		
		String[] search=request.getParameterValues("search");
		String searchFlag="";	
		if(search==null){
			
		}else if(search.length==1){
			searchFlag=search[0];
		}
		else {
			
			searchFlag="both";
		}
		
		if(sheng.equals("区域")){
			sheng="";
		}
		if(shi.equals("省/直辖市")){
			shi="";
		}
		if(xian.equals("城市")){
			xian="";
		}
		
		VolunteerDao volunteerDao=new VolunteerDao();
		
		List list=volunteerDao.frontSearch(new Object[]{sheng,shi,xian,searchFlag});
		
		request.setAttribute("volunteerList",list);
		request.getRequestDispatcher("/front/volunteer.jsp").forward(request, response);
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
