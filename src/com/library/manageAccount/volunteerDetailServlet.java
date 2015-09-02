package com.library.manageAccount;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.dao.ActiveDao;
import com.library.dao.ArticleDao;
import com.library.dao.IDAO;
import com.library.dao.VolunteerActiveDao;
import com.library.dao.VolunteerDao;
import com.library.vo.ManageAccountVo;
import com.library.vo.VolunteerVo;

public class volunteerDetailServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public volunteerDetailServlet() {
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
		response.setCharacterEncoding("utf-8");
		String volunteerId=request.getParameter("volunteerId");
		
		VolunteerDao dao=new VolunteerDao();
		VolunteerVo vo=(VolunteerVo)dao.selectById(volunteerId);
		ActiveDao activeDao=new ActiveDao();
		
		ManageAccountVo userVo= (ManageAccountVo)request.getSession().getAttribute("userVo");
		                          
		List activeList=activeDao.selectByManageId(userVo.getAccountId()+"");
		VolunteerActiveDao volunteerActiveDao=new VolunteerActiveDao();
		
		List volunteerActiveList=volunteerActiveDao.selectActiveFromVolunteerId(volunteerId);
	
		//ндубап╠М
		ArticleDao articleDao=new ArticleDao();
		List articleList= articleDao.selectByVolunteerId(volunteerId);
		
		
		request.setAttribute("VolunteerVo", vo);
		request.setAttribute("activeList",activeList );
		request.setAttribute("articleList", articleList);
		request.setAttribute("volunteerActiveList",volunteerActiveList);
		
		request.getRequestDispatcher("/library/volunteerDetail.jsp").forward(request, response);
		
		
		
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
