package com.library.tools;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class LibraryTools {
	
	//��������Ա�û���������
	
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
	//��ͼƬ����ȥ�� 
	public static String removePicture(String str){
		
		while(str.contains("<img src=")){
			//System.out.println("ԭʼ�ַ�    "+str);
			int beginIdx = str.indexOf("<img src=") ;
			 
		    int endIdx = str.indexOf("\" alt=\"\" />")+"\" alt=\"\" />".length();
		    //" alt="" />
		    String str2 = str.substring(beginIdx, endIdx);
		  // System.out.println("Ҫ�滻��    " +str2);
		    str=str.replace(str2,"");
		   
		   
		}
		return str;
	}
	
	//ȥ���������η�����<p> ���пո�
	public static String removeHtml(String str){
		while(str.contains("<")){
			//System.out.println("ԭʼ�ַ�    "+str);
			int beginIdx = str.indexOf("<") ;
			 
		    int endIdx = str.indexOf(">")+1;
		    //" alt="" />
		    String str2 = str.substring(beginIdx, endIdx);
		  // System.out.println("Ҫ�滻��    " +str2);
		    str=str.replace(str2,"");
		   
		   
		}
		str=str.replaceAll(" ","");
		return str;
	}
	
	
	//�õ�ǰ��ʮ����
	
	
	public static String getShortContent(String str){
		str=removePicture(str);
		str=removeHtml(str);
		if(str.length()<45){
			return str;
		}else{
			
		   return str.subSequence(0,45).toString();	
		}
	}
	
	
	//�����ַ������� ������ȴ���ĳ��ֵ �ͽ�ȡ����ָ���ĳ��ȴ�С
	
	public static String getLimitSting(String str,int length){
		if(str.length()>length){
			return str.substring(0, length);
		}else{
			return str;
		}
	}
	
	//��ȡ�ֿ�
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
	
	//ͨ���ֿ���˹ؼ���
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
		String content="fdsaf dsfad dsfadsaf �Ҹ�̨��fdsafdafd �Ͱ�";
		
		content=LibraryTools.replaceKeyWordsFromWordBag(content, (ArrayList) list);
		
		System.out.println(content);
	}
	
}
