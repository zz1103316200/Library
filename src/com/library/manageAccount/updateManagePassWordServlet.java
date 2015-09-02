package com.library.manageAccount;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.dao.ManageAccountDao;
import com.library.vo.ManageAccountVo;

public class updateManagePassWordServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public updateManagePassWordServlet() {
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
		
		String oldPassWord=request.getParameter("oldPassWord");
		String newPassWord=request.getParameter("newPassWord");
		String rePassWord=request.getParameter("rePassWord");
		
		System.out.println(oldPassWord+" "+newPassWord+" "+rePassWord);
		
		ManageAccountVo vo=(ManageAccountVo)request.getSession().getAttribute("userVo");
		
		if(vo==null){
			response.sendRedirect("/Library/front/login.jsp");
			return;
		}
		

		if((!oldPassWord.equals(vo.getAccountPassWord()))||newPassWord.equals("")||rePassWord==""||(!newPassWord.equals(rePassWord))||newPassWord.length()>20){
			request.setAttribute("flag",1);
			request.getRequestDispatcher("../library/updatePassWord.jsp").forward(request, response);
			return;
		}
		
		
		
		ManageAccountDao dao=new ManageAccountDao();
		dao.updatePassWord(newPassWord, vo.getAccountId()+"");
		
		ManageAccountVo newVo= (ManageAccountVo)dao.selectByName(vo.getAccountUserName());
		
		request.getSession().setAttribute("userVo",vo);
		request.getRequestDispatcher("volunteerList").forward(request, response);
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
