package com.miniProject.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.miniProject.mapper.ProductListMapper;
import com.miniProject.mapper.ProductMapper;

@Service
public class ProductListService {

	
	@Autowired
	private ProductListMapper productListMapper ;
	
	//상품목록
	public List<Map<String, Object>> getProductList(Map<String, Object> inMap) {
		
		if(inMap.get("page") instanceof Integer) {
			inMap.put("page", ((int)inMap.get("page") - 1) * 10);
		}else if(inMap.get("page") instanceof String) {
			inMap.put("page", (Integer.valueOf(inMap.get("page").toString()) - 1) * 10);
		}
		
		List<Map<String, Object>> outList = productListMapper.getProductList(inMap);
		return outList;
	}
	
	//상품목록 총갯수
	public int getTotalCount(Map<String, Object> inMap) {
		int totalCount = productListMapper.getTotalCount(inMap);
		return totalCount;
	}
	
	public int deleteProduct(Map<String, Object> paramMap) {
		int result = productListMapper.deleteProduct(paramMap);
		return result;
	}
}
