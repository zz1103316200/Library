package com.library.manageAccount;

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
import com.library.vo.VolunteerVo;

public class updateVolunteerServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public updateVolunteerServlet() {
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
		request.setCharacterEncoding("UTF-8");
		
		String type=request.getParameter("type");
		String volunteerId=request.getParameter("volunteerId");
		if(volunteerId==null){
			volunteerId="";
		}
		VolunteerDao dao=new VolunteerDao();
		
		//����Ԥ�޸�
		if(type!=null&&type.equals("pre")){
			VolunteerVo vo=(VolunteerVo)dao.selectById(volunteerId);
			request.setAttribute("volunteerVo",vo);
			request.getRequestDispatcher("/library/updateVolunteer.jsp").forward(request, response);
			return ;
		}
		
		
		
		DiskFileItemFactory factory = new DiskFileItemFactory();  
        //��ȡ�ļ���Ҫ�ϴ�����·��  
        String path = request.getRealPath("/upload");  
       
        //���û�����������õĻ����ϴ���� �ļ� ��ռ�� �ܶ��ڴ棬  
        //������ʱ��ŵ� �洢�� , ����洢�ң����Ժ� ���մ洢�ļ� ��Ŀ¼��ͬ  
        /** 
         * ԭ�� �����ȴ浽 ��ʱ�洢�ң�Ȼ��������д�� ��ӦĿ¼��Ӳ���ϣ�  
         * ������˵ ���ϴ�һ���ļ�ʱ����ʵ���ϴ������ݣ���һ������ .tem ��ʽ��  
         * Ȼ���ٽ�������д�� ��ӦĿ¼��Ӳ���� 
         */  
        factory.setRepository(new File(path));  
       
        //���� ����Ĵ�С�����ϴ��ļ������������û���ʱ��ֱ�ӷŵ� ��ʱ�洢��  
        factory.setSizeThreshold(1024*1024) ;  
          
        //��ˮƽ��API�ļ��ϴ�����  
        ServletFileUpload upload = new ServletFileUpload(factory);  
      
        try {  
        	
        	String volunteerUserName="";  //
    		String volunteerPassWord="";  //
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
        	
    		String hiddenFile="";
        	String hiddenSheng="";
        	String hiddenShi="";
        	String hiddenXian="";
    		
    		
            //�����ϴ�����ļ�  
            List<FileItem> list = (List<FileItem>)upload.parseRequest(request);  
          
            for(FileItem item : list)  
            {  
            	
                //��ȡ������������  
                String name = item.getFieldName();  
                
              
                
                //�����ȡ�� ����Ϣ����ͨ�� �ı� ��Ϣ  
                if(item.isFormField())  
                {                     
                    //��ȡ�û�����������ַ��� ���������ͦ�ã���Ϊ���ύ�������� �ַ������͵�  
                   
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
                    }else if(name.equals("hiddenFile")){
                    	hiddenFile=value;
                    }else if(name.equals("volunteerId")){
                    	volunteerId=value;
                    }else if(name.equals("hiddenSheng")){
                    	hiddenSheng=value;
                    }else if(name.equals("hiddenShi")){
                    	hiddenShi=value;
                    }else if(name.equals("hiddenXian")){
                    	hiddenXian=value;
                    }
                    
                    
                    
                }  
                //�Դ���ķ� �򵥵��ַ������д��� ������˵�����Ƶ� ͼƬ����Ӱ��Щ  
                else  
                {  
                	
                    /** 
                     * ������������Ҫ��ȡ �ϴ��ļ������� 
                     */  
                	
                    //��ȡ·����  
                    String value = item.getName().trim() ;  
                   
                    if(value==null||"".equals(value)){
                    	picturePath=hiddenFile;
                    	continue;
                    }
                    
                    String houzhuiming=value.split("\\.")[1];
                    
                    //�õ�ǰʱ�� ��ȷ����������ʾͼƬ��
                    Date now = new Date(); 
            		
            		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");//���Է�����޸����ڸ�ʽ


            		String pictureName = dateFormat.format( now );
                    
                    
                    //��ȡ �ϴ��ļ��� �ַ������֣���1�� ȥ����б�ܣ�  
                    String filename = pictureName+"."+houzhuiming;  
                    //picturePath    
                 
                    //����д��������  
                    //���׳����쳣 ��exception ��׽  
                    
                    //item.write( new File(path,filename) );//�������ṩ��  
                   
                    //�ֶ�д��  
                    OutputStream out = new FileOutputStream(new File(path,filename));  
                    picturePath="upload"+"/"+filename;
                    
                    
                    
                    InputStream in = item.getInputStream() ;  
                      
                    int length = 0 ;  
                    byte [] buf = new byte[1024] ;  
                      
                   
  
                    // in.read(buf) ÿ�ζ��������ݴ����   buf ������  
                    while( (length = in.read(buf) ) != -1)  
                    {  
                        //��   buf ������ ȡ������ д�� ���������������  
                        out.write(buf, 0, length);  
                          
                    }  
                     
                    in.close();  
                    out.close();  
                }  
            }  
           
/**
    		String sql = "update volunteer set pictureParh=?, volunteerName=?,registerOrganization=?,volunteerIdCard=?, " +
    		" getCardData=?,age=?,sex=?,volunteerSpeciality=?,tel=?,sheng=?,shi=?,xian=?,commonAddress=?,cardNumber=?"
    		+"where volunteerId=?";
   */         
           
            
            if(sheng.equals("����")){
            	sheng=hiddenSheng;
            }
            if(shi.equals("ʡ/ֱϽ��")){
            	shi=hiddenShi;
            }
            if(xian.equals("����")){
            	xian=hiddenXian;
            }
            
         
            dao.update(new Object[]{picturePath,volunteerName,registOrganization,volunteerIdCard,getCardData,age,sex,volunteerSpeciality,tel,sheng,shi,xian,commonAddress,cardNumber,volunteerId});
            
            
           
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
