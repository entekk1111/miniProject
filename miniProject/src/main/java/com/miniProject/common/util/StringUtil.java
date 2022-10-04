package com.miniProject.common.util;

public class StringUtil {
	
	/**
	 * object o 값이 null이면 ""값을 null이 아니면 o값(string변환)을 리턴한다. 
	 *  
	 * @param o
	 * @return
	 */
	public static String nvl(Object o) {
		return nvl(o, "");
	}
	
	public static String nvl(Object o, String str1) {
		if ( null == o )
			return str1;
		else
			return String.valueOf(o);
	}
	public static String nvl(String str, String str1) {
		if (str == null||str.length()==0)
			return str1;
		else
			return str;
	}
	
	public static String delOneChar(String str) {
		if (str == null || str.length() == 1)
			return "";
		return str;
	}

}
