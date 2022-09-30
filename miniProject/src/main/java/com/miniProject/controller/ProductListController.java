package com.miniProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductListController {
	
	@RequestMapping(value = "/productList", method =  RequestMethod.GET)
	public String productList() {
		return "/product/productList";
	}
}
