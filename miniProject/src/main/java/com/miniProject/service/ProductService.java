package com.miniProject.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.miniProject.component.JsoupComponentLocalMain;

@Service
public class ProductService {

	public List<Map<String, Object>> getProductDetail(List<String> urlList) {
		JsoupComponentLocalMain cre = new JsoupComponentLocalMain();
		
		return cre.process(urlList);
	}
}
