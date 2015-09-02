package com.library.manageAccount;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.dao.IDAO;
import com.library.dao.ManageAccountDao;
import com.library.tools.LibraryTools;
import com.library.vo.ManageAccountVo;
import com.library.vo.VolunteerVo;

public class manageAccountLoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public manageAccountLoginServlet() {
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

		request.setCharacterEncoding("gbk");
		
		String userName=request.getParameter("userName");
		String passWord=request.getParameter("passWord");
	
		
		HttpSession session= request.getSession();
		if(userName.equals(LibraryTools.superUserName)&&(passWord.equals(LibraryTools.superPassWord))){
			ManageAccountDao dao=new ManageAccountDao();
			ManageAccountVo vo=(ManageAccountVo)dao.selectByName(userName);
			vo.setAccountUserName(LibraryTools.superUserName);
			vo.setAccountLevel("0");
			vo.setAddress("ÉÂÎ÷");
			session.setAttribute("userVo",vo);
			
			
			
		}else{
			
			ManageAccountDao dao=new ManageAccountDao();
			ManageAccountVo vo= (ManageAccountVo)dao.selectByName(userName);
			session.setAttribute("userVo",vo);
			
			
		}
		
		request.getRequestDispatcher("/servlet/volunteerList").forward(request, response);
		
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
