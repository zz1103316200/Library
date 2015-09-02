package com.library.front;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.dao.ArticleDao;
import com.library.vo.VolunteerVo;

public class frontDeleteArticleServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public frontDeleteArticleServlet() {
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
		String articleId=request.getParameter("articleId");
		ArticleDao articleDao=new ArticleDao();
		articleDao.delete(new Object[]{articleId});
		
		VolunteerVo volunteerVo=(VolunteerVo)request.getSession().getAttribute("volunteerVo");
		//���־Ը�ߵ��û��������� ��ʵ�������֤������
		String userName=volunteerVo.getVolunteerIdCard();
		String passWord=volunteerVo.getVolunteerPassWord();
		
		request.getRequestDispatcher("/servlet/volunteerLoginServlet?userName="+userName+"&&passWord="+passWord).forward(request, response);
		
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
