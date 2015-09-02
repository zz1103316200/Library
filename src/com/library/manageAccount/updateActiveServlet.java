package com.library.manageAccount;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.dao.ActiveDao;
import com.library.tools.LibraryTools;
import com.library.vo.ActiveVo;

public class updateActiveServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public updateActiveServlet() {
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
		ActiveDao dao=new ActiveDao();
		String activeId=request.getParameter("activeId");
		//Ô¤ÐÞ¸Ä
		if(type!=null&&type.equals("preUpdate")){
			
			ActiveVo activeVo=(ActiveVo)dao.selectById(activeId);
			request.setAttribute("activeVo",activeVo);
			request.getRequestDispatcher("/library/updateActive.jsp").forward(request, response);
			return;
		}
		//String sql = "update active set activeTile=?,activeContent=?,activePublisher=? where activeId=?";
		
		String  activeTitle=request.getParameter("activeTitle");
		
		String activePublisher=request.getParameter("activePublisher");
		
		String activeContent=request.getParameter("activeContent").trim();
		activeContent=LibraryTools.getLimitSting(activeContent, 4000);
		
		Object obj[]=new Object[]{activeTitle,activeContent,activePublisher,activeId};
		
		dao.update(obj);
		
		
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
