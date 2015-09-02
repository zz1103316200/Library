package com.library.manageAccount;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.dao.VolunteerDao;
import com.library.vo.ManageAccountVo;

public class highSearchServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public highSearchServlet() {
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
		
		String volunteerSpeciality=request.getParameter("volunteerSpeciality").trim();
		String littleAge=request.getParameter("littleAge").trim();
		String bigAge=request.getParameter("bigAge").trim();
		
		
		
		
		if(littleAge.equals("")){
			littleAge="0";
		}
		if(bigAge.equals("")){
			bigAge="100";
		}
		
		String commonAddress=request.getParameter("commonAddress").trim();
		
		String volunteerName=request.getParameter("volunteerName").trim();
		String tel=request.getParameter("tel").trim();
		String registOrganization=request.getParameter("registOrganization").trim();
		String cardNumber=request.getParameter("cardNumber").trim();
	    String volunteerIdCard=request.getParameter("volunteerIdCard").trim();
	
		
		ManageAccountVo manageAccountVo=(ManageAccountVo)request.getSession().getAttribute("userVo");
		
		
		VolunteerDao dao=new VolunteerDao();
		List list= dao.selectSearch(new Object[]{volunteerSpeciality,littleAge,bigAge,commonAddress,volunteerName,tel,registOrganization,cardNumber,volunteerIdCard},manageAccountVo.getAccountLevel(),manageAccountVo.getAddress());
		
		request.setAttribute("volunteerList", list);
		request.getRequestDispatcher("/library/volunteerList.jsp").forward(request, response);
		
		
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
