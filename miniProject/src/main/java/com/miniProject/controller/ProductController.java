package com.miniProject.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.miniProject.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Model model) {
		return "/product/profile";
	}
	
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String getProductInfo(Model model) {
		
		return "/product/productForm";
	}
	
	@RequestMapping(value = "/getProduct", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> getProductInfo(Model model, @RequestBody List<String> urlList) {
		
		List<Map<String, Object>> dataMap = productService.getProductDetail(urlList);
		return dataMap;
	}
	
	
}
