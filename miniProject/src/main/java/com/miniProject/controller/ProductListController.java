package com.miniProject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.miniProject.model.SessionVO;

@Controller
public class ProductListController {
	
	@RequestMapping(value = "/productList", method =  RequestMethod.GET)
	public String productList(HttpSession session) {
			
		SessionVO sessionVO =  (SessionVO)session.getAttribute("SID");
		sessionVO.getMemberNum();
		return "/product/productList";
	}
}
