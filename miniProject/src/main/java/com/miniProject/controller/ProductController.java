package com.miniProject.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.miniProject.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/item", method = RequestMethod.GET)
	public String main(Model model) {
		
		Map<String, Object> dataMap = productService.getProductDetail();
		model.addAttribute("dataMap", dataMap);
		return "product/productForm";
	}
}
