package com.oasystem.util;

import java.util.ArrayList;
import java.util.List;

public class StringUtil {
	public  List<String> cutString(String s){
		List<String> stringlist=new ArrayList<String>();//用来存储解析出来的元素
		       for(int i=0;i<s.length();i++)
		        {
		            if(s.charAt(i)==',')
		             { 
		                 String temp="";//存储单词
		                 int wordlength=i;
		                 while(wordlength<s.length()-1&&s.charAt(++wordlength)!=',')
		                 {
		                     temp+=s.charAt(wordlength);
		                 }
		                 stringlist.add(temp);
		             }
		         }
		         return stringlist;    
	}

}
