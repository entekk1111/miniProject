package com.miniProject.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.miniProject.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	//상품수정폼
	@RequestMapping(value = "/updateProduct", method = RequestMethod.GET)
	public String getProductInfo2(@RequestParam(value = "number")String param) {
		System.out.println(param);
		
		return "/product/updateProduct";
	}

	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String getProductInfo() {
		
		return "/product/productForm";
	}
	
	@RequestMapping(value = "/getProduct", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> getProductInfo(@RequestBody List<String> urlList) {
		
		List<Map<String, Object>> dataMap = productService.getProductDetail(urlList);
		return dataMap;
	}
	
	//상품 insert
	@RequestMapping(value = "/addCheckedProduct", method = RequestMethod.POST)
	@ResponseBody
	public int addCheckedProduct(HttpServletRequest request, @RequestBody List<Map<String, Object>> param) {
		
		return productService.addCheckedProduct(request, param);
	}
	
}
