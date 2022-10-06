package com.miniProject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.miniProject.common.util.Paginator;
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
	@RequestMapping(value = "/productList", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
	public String productList(Model model, @RequestParam Map<String,Object> inMap, HttpServletRequest request) {
		
		//페이지 사이즈 빈값일때 10으로 세팅
		if("".equals(StringUtil.nvl(inMap.get("pageSize")))) {
			inMap.put("pageSize", 10);
		}
		
		//페이지 빈값일때 1로 세팅
		if("".equals(StringUtil.nvl(inMap.get("page")))) {
			inMap.put("page", 1);
		}
	    
		SessionVO sessionVO =  (SessionVO)request.getSession().getAttribute("SID");    //사용자vo
		inMap.put("memberNum", sessionVO.getMemberNum().toString());				   //pk
		
		int totalCount = productListService.getTotalCount(inMap);                      //목록총갯수
		Paginator pagination = new Paginator(Integer.valueOf(5), Integer.valueOf(10), Long.valueOf(totalCount)); //페이지네이션 세팅
		
		Map<String, Object> pageMap = new HashMap<>();
		if(inMap.get("page") instanceof String) {
			pageMap = pagination.getFixedBlock(Integer.valueOf((String)inMap.get("page")));
		}else if(inMap.get("page") instanceof Integer) {
			pageMap = pagination.getFixedBlock((Integer)inMap.get("page"));
		}
		
		
		List<Map<String, Object>> outList = productListService.getProductList(inMap);  //목록내용
		
		
		model.addAttribute("outList", outList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("userId", sessionVO.getId().toString());
		model.addAttribute("pageMap", pageMap);
		
		return "/product/productList";
	}
	
	@PostMapping(value="/productList.do")
	@ResponseBody
	public Map<String, Object> productList(@RequestBody Map<String,Object> paramMap, HttpServletRequest request) {
		//페이지 사이즈 빈값일때 10으로 세팅
		if("".equals(StringUtil.nvl(paramMap.get("pageSize")))) {
			paramMap.put("pageSize", Integer.valueOf(10));
		}
		
		//페이지 빈값일때 1로 세팅
		if("".equals(StringUtil.nvl(paramMap.get("page")))) {
			paramMap.put("page", Integer.valueOf(1));
		}
	    
		SessionVO sessionVO =  (SessionVO)request.getSession().getAttribute("SID");    //사용자vo
		paramMap.put("memberNum", sessionVO.getMemberNum().toString());				   //pk
		
		int totalCount = productListService.getTotalCount(paramMap);                      //목록총갯수
		Paginator pagination = new Paginator(Integer.valueOf(5), Integer.valueOf(10), Long.valueOf(totalCount));
		
		Map<String, Object> pageMap = new HashMap<>();
		if(paramMap.get("page") instanceof String) {
			pageMap = pagination.getFixedBlock(Integer.valueOf((String)paramMap.get("page")));
		}else if(paramMap.get("page") instanceof Integer) {
			pageMap = pagination.getFixedBlock((Integer)paramMap.get("page"));
		}
		
		List<Map<String, Object>> outList = productListService.getProductList(paramMap);  //목록내용
		
		Map<String, Object> outMap = new HashMap<>();
		outMap.put("outList", outList);
		outMap.put("totalCount", totalCount);
		outMap.put("pageMap", pageMap);
		
		return outMap;
	}
	@RequestMapping(value="/deleteList")
	@ResponseBody
	public Map<String, Object> deleteList(@RequestBody Map<String,Object> paramMap, HttpServletRequest request) {
		
		//페이지 사이즈 빈값일때 10으로 세팅
		if("".equals(StringUtil.nvl(paramMap.get("pageSize")))) {
			paramMap.put("pageSize", 10);
		}
		
		//페이지 빈값일때 1로 세팅
		if("".equals(StringUtil.nvl(paramMap.get("page")))) {
			paramMap.put("page", 1);
		}
		
		SessionVO sessionVO =  (SessionVO)request.getSession().getAttribute("SID");      //사용자vo
		paramMap.put("memberNum", sessionVO.getMemberNum().toString());
		int result = productListService.deleteProduct(paramMap);                          //해당목록삭제
		int totalCount = productListService.getTotalCount(paramMap);                      //목록총갯수
		Paginator pagination = new Paginator(Integer.valueOf(5), Integer.valueOf(10), Long.valueOf(totalCount));
		
		Map<String, Object> pageMap = new HashMap<>();
		if(paramMap.get("page") instanceof String) {
			pageMap = pagination.getFixedBlock(Integer.valueOf((String)paramMap.get("page")));
		}else if(paramMap.get("page") instanceof Integer) {
			pageMap = pagination.getFixedBlock((Integer)paramMap.get("page"));
		}
		
		List<Map<String, Object>> outList = productListService.getProductList(paramMap);  //목록내용
		
		Map<String, Object> outMap = new HashMap<>();
		outMap.put("outList", outList);
		outMap.put("totalCount", totalCount);
		outMap.put("pageMap", pageMap);
		
		return outMap;
		
	}
	
}
