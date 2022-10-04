package com.miniProject.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.miniProject.component.JsoupComponentLocalMain;
import com.miniProject.mapper.ProductMapper;

@Service
public class ProductListService {

	
	@Autowired
	private ProductMapper productMapper;
	
	//상품목록
	public List<Map<String, Object>> getProductList(Map<String, Object> inMap) {
		List<Map<String, Object>> outList = productMapper.getProductList(inMap);
		return outList;
	}
	
	//상품목록 총갯수
	public int getTotalCount(Map<String, Object> inMap) {
		int totalCount = productMapper.getTotalCount(inMap);
		return totalCount;
	}
	
	public int deleteProduct(Map<String, Object> paramMap) {
		int result = productMapper.deleteProduct(paramMap);
		return result;
	}
}
