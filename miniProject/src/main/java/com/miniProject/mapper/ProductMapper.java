package com.miniProject.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {	
	
	/**
	 * 옵션삭제
	 */
	int deleteOptions(String param);
	
	/**
	 * 상품 수정
	 */
	int updateProduct(Map<String, Object> param);
	
	/**
	 * 상품 가져옴
	 */
	Map<String, Object> getProduct(String param);
	
	/**
	 * 상품 업로드
	 */
	int addCheckedProduct(Map<String, Object> map);
	
	/**
	 * 등록한 상품번호 가져오기
	 */
	int getRecentProductNumber(String memberNum);
	
	/**
	 * 옵션 업로드
	 */
	int addOption(List<Map<String, Object>> listMap);
	
}
