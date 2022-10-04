package com.miniProject.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {
	
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
	
	/**
	 * 
	 * @param memberNum
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
