package com.miniProject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.miniProject.common.util.StringUtil;
import com.miniProject.model.SessionVO;
import com.miniProject.service.ProductListService;

@Controller
public class ProductListController {
	
	@Autowired
	ProductListService productListService;
	
	/**
	 * 상품목록
	 * 
	 * @param model
	 * @param inMap
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/productList", method =  RequestMethod.GET)
	public String productList(Model model, @RequestParam Map<String,Object> inMap, HttpSession session) {
		
		//페이지 사이즈 빈값일때 10으로 세팅
		if("".equals(StringUtil.nvl(inMap.get("pageSize")))) {
			inMap.put("pageSize", 10);
		}
		
		//페이지 빈값일때 1로 세팅
		if("".equals(StringUtil.nvl(inMap.get("page")))) {
			inMap.put("page", 1);
		}
	    
		SessionVO sessionVO =  (SessionVO)session.getAttribute("SID");
		inMap.put("memberNum", sessionVO.getMemberNum().toString());
		
		List<Map<String, Object>> outList = productListService.getProductList(inMap);
		int totalCount = productListService.getTotalCount(inMap);
		
		model.addAttribute("outList", outList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("userId", sessionVO.getId().toString());
		
		return "/product/productList";
	}
	
	@RequestMapping(value="/deleteList")
	@ResponseBody
	public int deleteList(@RequestBody Map<String,Object> paramMap, HttpSession session) {
		SessionVO sessionVO =  (SessionVO)session.getAttribute("SID");
		paramMap.put("memberNum", sessionVO.getMemberNum().toString());
		int result = productListService.deleteProduct(paramMap);
		return result;
	}
	
}
