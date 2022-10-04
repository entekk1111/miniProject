package com.miniProject.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.miniProject.common.user.CustomUserDetails;
import com.miniProject.model.SessionVO;

@Mapper
public interface UserMapper {
	
    int userSave(Map<String, Object> inMap);
    CustomUserDetails getUserAccount(String username);
    SessionVO getUserInfo(String username);
}
