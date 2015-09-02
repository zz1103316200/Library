package com.library.front;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.dao.ActiveDao;
import com.library.dao.ArticleDao;
import com.library.dao.VolunteerActiveDao;
import com.library.dao.VolunteerDao;
import com.library.vo.VolunteerVo;

public class volunteerLoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public volunteerLoginServlet() {
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
		String userName=request.getParameter("userName").trim();
		String passWord=request.getParameter("passWord").trim();
		
		//志愿者基本
		VolunteerDao dao=new VolunteerDao();
		List list=dao.selectByIdCardAndPassWord(userName, passWord);
		VolunteerVo vo=(VolunteerVo)list.get(0);
		request.setAttribute("volunteerVo", vo);
		
		
		//志愿者活动信息
		VolunteerActiveDao volunteerActiveDao=new VolunteerActiveDao();
		List volunteerActiveList=volunteerActiveDao.selectActiveFromVolunteerId(vo.getVolunteerId()+"");
		
		//志愿者文章信息
		ArticleDao articleDao=new ArticleDao();
		List articleList= articleDao.selectByVolunteerId(vo.getVolunteerId()+"");
		
		
		request.getSession().setAttribute("volunteerVo",vo );
		request.setAttribute("volunteerActiveList",volunteerActiveList);
		request.setAttribute("articleList", articleList);
		
		request.getRequestDispatcher("/front/volunteerDetail.jsp").forward(request, response);

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
