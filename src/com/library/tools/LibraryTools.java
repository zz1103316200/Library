package com.library.tools;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class LibraryTools {
	
	//超级管理员用户名和密码
	
	public static final String superUserName="super";
	public static final String superPassWord="super";

	
	public static boolean isContainPicture(String  str){
		
		 return str.contains("<img ");
			
	}
	
	public static String getPicturePath(String str){

		    int beginIdx = str.indexOf("src=") + "src='".length();
		    
		    String secondStr=str.substring(beginIdx,str.length());
		    
		    
		    int endIdx = secondStr.indexOf("\"");
		   
		    
		    //" alt="" />
		    String str2 = secondStr.substring(0, endIdx);
		   
		   
		   return str2;
	}
	//把图片内容去掉 
	public static String removePicture(String str){
		
		while(str.contains("<img src=")){
			//System.out.println("原始字符    "+str);
			int beginIdx = str.indexOf("<img src=") ;
			 
		    int endIdx = str.indexOf("\" alt=\"\" />")+"\" alt=\"\" />".length();
		    //" alt="" />
		    String str2 = str.substring(beginIdx, endIdx);
		  // System.out.println("要替换的    " +str2);
		    str=str.replace(str2,"");
		   
		   
		}
		return str;
	}
	
	//去掉所有修饰符号如<p> 还有空格
	public static String removeHtml(String str){
		while(str.contains("<")){
			//System.out.println("原始字符    "+str);
			int beginIdx = str.indexOf("<") ;
			 
		    int endIdx = str.indexOf(">")+1;
		    //" alt="" />
		    String str2 = str.substring(beginIdx, endIdx);
		  // System.out.println("要替换的    " +str2);
		    str=str.replace(str2,"");
		   
		   
		}
		str=str.replaceAll(" ","");
		return str;
	}
	
	
	//得到前五十个字
	
	
	public static String getShortContent(String str){
		str=removePicture(str);
		str=removeHtml(str);
		if(str.length()<45){
			return str;
		}else{
			
		   return str.subSequence(0,45).toString();	
		}
	}
	
	
	//限制字符串长度 如果长度大于某个值 就截取参数指定的长度大小
	
	public static String getLimitSting(String str,int length){
		if(str.length()>length){
			return str.substring(0, length);
		}else{
			return str;
		}
	}
	
	//读取字库
	public static ArrayList readWordBag(String path)throws Exception {
		ArrayList list=new ArrayList<String>();
		
		BufferedReader br = new BufferedReader(new InputStreamReader( new FileInputStream(path)));  
  
        for (String line = br.readLine(); line != null; line = br.readLine()) {  
            line=line.replace("|1", "").trim();
            list.add(line);
        }  
        br.close();  
		
		return list;
	}
	
	//通过字库过滤关键字
	public static String replaceKeyWordsFromWordBag(String content,List wordBagList){
		for(int i=0;i<wordBagList.size();i++){
			String keyWord=wordBagList.get(i).toString();
			content=content.replaceAll(keyWord,"");
		}
		return content;
	}
	
	public static void main(String[] args) throws Exception {
		String path="d:ciku.txt";
		List list= LibraryTools.readWordBag(path);
		/*
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i));
		}
		*/
		String content="fdsaf dsfad dsfadsaf 我搞台独fdsafdafd 瓮安";
		
		content=LibraryTools.replaceKeyWordsFromWordBag(content, (ArrayList) list);
		
		System.out.println(content);
	}
	
}
