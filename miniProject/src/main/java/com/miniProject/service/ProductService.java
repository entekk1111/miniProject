package com.miniProject.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.miniProject.component.JsoupComponentLocalMain;

@Service
public class ProductService {

	//화면에서 상품 가져옴
	public List<Map<String, Object>> getProductDetail(List<String> urlList) {
		JsoupComponentLocalMain cre = new JsoupComponentLocalMain();
		
		return cre.process(urlList);
	}
	
	//DB에 insert
	public int addCheckedProduct(HttpServletRequest request) {
		
		
		String[] productPhotos = request.getParameterValues("productPhoto"); 
		
		return 0;
	}
}
