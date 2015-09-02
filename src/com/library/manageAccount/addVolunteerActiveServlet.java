package com.library.manageAccount;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.dao.IDAO;
import com.library.dao.VolunteerActiveDao;
import com.library.tools.LibraryTools;

public class addVolunteerActiveServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public addVolunteerActiveServlet() {
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

	
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String volunteerId=request.getParameter("volunteerId")+"";
		String activeId=request.getParameter("active").trim();
		String activeDate=request.getParameter("activeDate");
		String activeContent=request.getParameter("activeContent").trim();
        activeContent=LibraryTools.getLimitSting(activeContent,2000);
		String evaluation=request.getParameter("evaluation");
		
		
		
		String activeHours=request.getParameter("activeHours");
		String confirmPeople=request.getParameter("confirmPeople");
		
		IDAO volunteerActiveDao =new VolunteerActiveDao();
		volunteerActiveDao.add(new Object[]{activeId,volunteerId,activeDate,activeContent,activeHours,confirmPeople,evaluation});
		
		request.getRequestDispatcher("/servlet/volunteerDetailServlet?volunteerId="+volunteerId).forward(request, response);
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
