package com.miniProject.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {
	
	/**
	 * 상품 업로드
	 */
	int addCheckedProduct(Map<String, String> map);
	
	/**
	 * 옵션 업로드
	 */
	int addOption(List<Map<String, String>> listMap);

}
