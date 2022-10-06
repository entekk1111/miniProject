package com.miniProject.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductListMapper {
	
	/**
	 * 
	 * @param 
	 * @return 상품게시판리스트
	 */
	List<Map<String, Object>> getProductList(Map<String, Object> inMap);
	
	/**
	 * 상품리스트 총갯수
	 * 
	 * @param inMap
	 * @return
	 */
	int getTotalCount(Map<String, Object> inMap);
	
	/**
	 * 선택상품 삭제
	 * 
	 * @param paramMap
	 * @return
	 */
	int deleteProduct(Map<String, Object> paramMap);


}
