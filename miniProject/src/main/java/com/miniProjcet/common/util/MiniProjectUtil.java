package com.miniProjcet.common.util;

import java.text.DecimalFormat;

public class MiniProjectUtil {
	public static String changePrice(Object obj) {
		String returnValue = "";
		if(obj != null) {
			DecimalFormat decFormat = new DecimalFormat("###,###");

			returnValue = decFormat.format(obj);
		}
		return returnValue;
	}
}
