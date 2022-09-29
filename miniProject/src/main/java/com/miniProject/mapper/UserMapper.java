package com.miniProject.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
	
	/**
	 * 회원가입
	 * 
	 * @param inData
	 */
    int userSave(Map<String, Object> inMap);

}
