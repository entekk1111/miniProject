package com.miniProject.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.miniProject.component.JsoupComponentLocalMain;

@Service
public class ProductService {

	public Map<String, Object> getProductDetail() {
		JsoupComponentLocalMain cre = new JsoupComponentLocalMain();
		
		return cre.process();
	}
}
