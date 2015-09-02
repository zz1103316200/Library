package com.library.front;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.vo.FenyeVo;

public class frontTrainListServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public frontTrainListServlet() {
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

		response.setContentType("text/html; charset=gbk");
		request.setCharacterEncoding("gbk");
		
		String currentPage=request.getParameter("currentPage");
		
		if(currentPage==null){
			currentPage="0";
		}
		
		
		//文件路径
		String path=this.getServletContext().getRealPath("/")+"train";
		
		List totalFileList= getFileSort(path);
		
		int pageSize=10;
		
		int totalPage=(totalFileList.size()-1)/pageSize+1;
		
		int targetPage=Integer.parseInt(currentPage)-1;
		
		
		if(targetPage>=totalPage){
			targetPage=totalPage-1;
		}
		if(targetPage<0){
			targetPage=0;
		}
		//封装targetList
		List targetList=new ArrayList();
		
		int startIndex=targetPage*pageSize;
		int endIndex=startIndex+10;
		
		if(totalFileList.size()>0){
			for(int i=startIndex;i<endIndex;i++){
				if(i==(totalFileList.size())){
					break;
				}
				targetList.add(totalFileList.get(i));
			}
		}
		
		
		FenyeVo vo=new FenyeVo();
		vo.setCurrentList(targetList);
		vo.setCurrentPage(targetPage+1);
		vo.setTotalCount(totalFileList.size());
		vo.setTotalPage(totalPage);
		
		request.setAttribute("fenyeVo",vo);
		request.getRequestDispatcher("/front/trainList.jsp").forward(request, response);
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
	
	public static  List<File> getFileSort(String path) {
		 
        List<File> list = getFiles(path, new ArrayList<File>());
 
        if (list != null && list.size() > 0) {
 
            Collections.sort(list, new Comparator<File>() {
                public int compare(File file, File newFile) {
                    if (file.lastModified() < newFile.lastModified()) {
                        return 1;
                    } else if (file.lastModified() == newFile.lastModified()) {
                        return 0;
                    } else {
                        return -1;
                    }
 
                }
            });
 
        }
 
        return list;
    }
	public static List<File> getFiles(String realpath, List<File> files) {
		 
        File realFile = new File(realpath);
        if (realFile.isDirectory()) {
            File[] subfiles = realFile.listFiles();
            for (File file : subfiles) {
                if (file.isDirectory()) {
                    getFiles(file.getAbsolutePath(), files);
                } else {
                    files.add(file);
                }
            }
        }
        return files;
    }
}
