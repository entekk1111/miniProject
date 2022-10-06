package com.miniProject.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String updateProduct(Model model, @RequestParam(value = "number")String param
											, @RequestParam(value = "page"		)String page
											, @RequestParam(value = "pageSize"	)String pageSize
											, @RequestParam(value = "searchType")String searchType
											, @RequestParam(value = "searchWord")String searchWord) {
		Map<String, Object> dataMap = productService.getProduct(param);
		
		String OPTIVALUE = (String) dataMap.get("OPTIVALUE");
		if(OPTIVALUE.contains(",")) {			
			String[] OPTIVALUEArr = OPTIVALUE.split(",");
			dataMap.put("OPTIVALUE", OPTIVALUEArr);
		}
		String PHOTHO = (String) dataMap.get("PHOTHO");
		if(PHOTHO.contains(",")) {			
			String[] PHOTHOSArr = PHOTHO.split(",");
			dataMap.put("PHOTHO", PHOTHOSArr);
		}
		
		model.addAttribute("item"		, dataMap	);
		model.addAttribute("page"		,  page      );
		model.addAttribute("pageSize"	,  pageSize  );
		model.addAttribute("searchType"	,  searchType);
		model.addAttribute("searchWord"	,  searchWord);
		
		return "/product/updateProduct";
	}
	
	//상품수정등록
	@RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
	@ResponseBody
	public int updateProduct(HttpServletRequest request) {
		
		return productService.updateProduct(request);
	}

	//상품등록폼
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String getProductInfo() {
		
		return "/product/productForm";
	}
	
	//크롤링
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
