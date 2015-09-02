package com.library.front;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.library.dao.IDAO;
import com.library.dao.VolunteerDao;

public class addVolunteerServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public addVolunteerServlet() {
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

		request.setCharacterEncoding("gbk");  //设置编码  
		//volunteerUserName,volunteerPassWord,picturePath,volunteerName,registOrganization,volunteerIdCard,getCardData,age,sex,volunteerSpeciality,tel,sheng,shi,xian,commonAddress,level
		response.setCharacterEncoding("gbk");
		
		DiskFileItemFactory factory = new DiskFileItemFactory();  
        //获取文件需要上传到的路径  
        String path = request.getRealPath("/upload");  
       
        //如果没以下两行设置的话，上传大的 文件 会占用 很多内存，  
        //设置暂时存放的 存储室 , 这个存储室，可以和 最终存储文件 的目录不同  
        /** 
         * 原理 它是先存到 暂时存储室，然后在真正写到 对应目录的硬盘上，  
         * 按理来说 当上传一个文件时，其实是上传了两份，第一个是以 .tem 格式的  
         * 然后再将其真正写到 对应目录的硬盘上 
         */  
        factory.setRepository(new File(path));  
       
        //设置 缓存的大小，当上传文件的容量超过该缓存时，直接放到 暂时存储室  
        factory.setSizeThreshold(1024*1024) ;  
          
        //高水平的API文件上传处理  
        ServletFileUpload upload = new ServletFileUpload(factory);  
      
        try {  
        	
        	String volunteerUserName="";  //
    		String volunteerPassWord="123456";  //
    		String picturePath="";        
    		String volunteerName="";      //
    		String registOrganization=""; //
    		String volunteerIdCard="";    //
    		String getCardData="";
    		String age="";                //
    		String sex="";                //
    		String volunteerSpeciality=""; //
    		String tel="";               //
    		String sheng="";             //
    		String shi="";               //
    		String xian="";              //
    		String commonAddress="";     //
    		String level="1";
    		String cardNumber="";
        	
        	
            //可以上传多个文件  
            List<FileItem> list = (List<FileItem>)upload.parseRequest(request);  
          
            for(FileItem item : list)  
            {  
            	
                //获取表单的属性名字  
                String name = item.getFieldName();  
                
              
                
                //如果获取的 表单信息是普通的 文本 信息  
                if(item.isFormField())  
                {                     
                    //获取用户具体输入的字符串 ，名字起得挺好，因为表单提交过来的是 字符串类型的  
                   
                	String value = new String(item.getString().getBytes("iso8859-1"), "gbk");  
                	
                    request.setAttribute(name, value);  
                    if(name.equals("volunteerName")){
                    	volunteerName=value;
                    }else if(name.equals("volunteerUserName")){
                    	volunteerUserName=value;
                    }else if(name.equals("volunteerPassWord")){
                    	volunteerPassWord=value;
                    }else if(name.equals("volunteerIdCard")){
                    	volunteerIdCard=value;
                    }else if(name.equals("registOrganization")){
                    	registOrganization=value;
                    }else if(name.equals("age")){
                    	age=value;
                    }else if(name.equals("sex")){
                    	sex=value;
                    }else if(name.equals("tel")){
                    	tel=value;
                    }else if(name.equals("sheng")){
                    	sheng=value;
                    }else if(name.equals("shi")){
                    	shi=value;
                    }else if(name.equals("xian")){
                    	xian=value;
                    }else if(name.equals("commonAddress")){
                    	commonAddress=value;
                    }else if(name.equals("volunteerSpeciality")){
                    	volunteerSpeciality=value;
                    }else if(name.equals("getCardData")){
                    	getCardData=value;
                    }else if(name.equals("cardNumber")){
                    	cardNumber=value;
                    }
                    
                    
                    
                }  
                //对传入的非 简单的字符串进行处理 ，比如说二进制的 图片，电影这些  
                else  
                {  
                	
                    /** 
                     * 以下三步，主要获取 上传文件的名字 
                     */  
                	
                    //获取路径名  
                    String value = item.getName().trim() ;  
                   
                    if(value==null||"".equals(value)){
                    	continue;
                    }
                    
                    String houzhuiming=value.split("\\.")[1];
                    
                    //用当前时间 精确到毫秒来表示图片名
                    Date now = new Date(); 
            		
            		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");//可以方便地修改日期格式


            		String pictureName = dateFormat.format( now );
                    
                    
                    //截取 上传文件的 字符串名字，加1是 去掉反斜杠，  
                    String filename = pictureName+"."+houzhuiming;  
                    //picturePath    
                 
                    //真正写到磁盘上  
                    //它抛出的异常 用exception 捕捉  
                    
                    //item.write( new File(path,filename) );//第三方提供的  
                   
                    //手动写的  
                    OutputStream out = new FileOutputStream(new File(path,filename));  
                    picturePath="upload"+"/"+filename;
                    
                    
                    
                    InputStream in = item.getInputStream() ;  
                      
                    int length = 0 ;  
                    byte [] buf = new byte[1024] ;  
                      
                   
  
                    // in.read(buf) 每次读到的数据存放在   buf 数组中  
                    while( (length = in.read(buf) ) != -1)  
                    {  
                        //在   buf 数组中 取出数据 写到 （输出流）磁盘上  
                        out.write(buf, 0, length);  
                          
                    }  
                     
                    in.close();  
                    out.close();  
                }  
            }  
           
         
            
            IDAO dao=new VolunteerDao();  
            volunteerPassWord="123456";
          //volunteerUserName,volunteerPassWord,picturePath,volunteerName,registOrganization,volunteerIdCard,getCardData,age,sex,volunteerSpeciality,tel,sheng,shi,xian,commonAddress,level
            dao.add(new Object[]{volunteerUserName,volunteerPassWord,picturePath,volunteerName,registOrganization,volunteerIdCard,getCardData,age,sex,volunteerSpeciality,tel,sheng,shi,xian,commonAddress,level,cardNumber});
            
            
           
            request.getRequestDispatcher("/servlet/volunteerList").forward(request, response);
           
            
        } catch (FileUploadException e) {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        }  
        catch (Exception e) {  
            // TODO Auto-generated catch block  
              
            //e.printStackTrace();  
        }  
		
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
