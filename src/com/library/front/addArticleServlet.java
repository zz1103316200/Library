package com.library.front;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.dao.ArticleDao;
import com.library.init.DataSourceInit;
import com.library.tools.LibraryTools;
import com.library.vo.VolunteerVo;

public class addArticleServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public addArticleServlet() {
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
		
		
		
		String articleTitle=request.getParameter("articleTitle").trim();
		articleTitle=LibraryTools.getLimitSting(articleTitle, 20);
		
		String articleContent=request.getParameter("articleContent").trim();
		articleContent=LibraryTools.getLimitSting(articleContent,5000);
		
		//ͨ�����дʿ����һ��
		articleContent=LibraryTools.replaceKeyWordsFromWordBag(articleContent, DataSourceInit.wordBagList);
		articleTitle=LibraryTools.replaceKeyWordsFromWordBag(articleTitle, DataSourceInit.wordBagList);
		
		VolunteerVo volunteerVo=(VolunteerVo)request.getSession().getAttribute("volunteerVo");
		String volunteerId=volunteerVo.getVolunteerId()+"";
		
		//���־Ը�ߵ��û��������� ��ʵ�������֤������
		String userName=volunteerVo.getVolunteerIdCard();
		String passWord=volunteerVo.getVolunteerPassWord();
		
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		 String articleTime=formatter.format(new Date());
		
		Object obj[]=new Object[]{articleTitle,articleContent,articleTime,volunteerId};
		
		ArticleDao dao=new ArticleDao();
		dao.add(obj);
		
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
