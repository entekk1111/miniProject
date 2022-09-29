package com.miniProject.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.miniProject.mapper.UserMapper;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;
    
	/*
	 * @Autowired BCryptPasswordEncoder passwordEncoder
	 */;      // 비번 암호화
    
    /**
     * 회원가입 insert
     * 
     * @param inMap
     * @return
     */
    public int joinUser(Map<String, Object> inMap){
    	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        inMap.put("userPassWord", passwordEncoder.encode(inMap.get("userPassWord").toString()));     // 비번 암호화
    	int result = userMapper.userSave(inMap);                  // insert
        return result;
    }
}