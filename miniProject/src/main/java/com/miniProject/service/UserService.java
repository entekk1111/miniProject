package com.miniProject.service;

import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.miniProject.mapper.UserMapper;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    /**
     * 회원가입 - 비밀번호 암호화 후 db insert
     * 
     * @param inMap
     * @return
     */
    @Transactional
    public int joinUser(Map<String, Object> paramMap){
    	Map<String, Object> map = paramMap;
    	map.put("userPw", passwordEncoder.encode(paramMap.get("userPw").toString()));           // 비번 암호화
    	int result = userMapper.userSave(map);                								     // insert
        return result;
    }
    
    /* 회원가입 시, 유효성 체크 */    
//    public Map<String, String> validateHandling(Errors errors) {
//    	Map<String, String> validatorResult = new HashMap<>();         
//    	for (FieldError error : errors.getFieldErrors()) {            
//    		String validKeyName = String.format("valid_%s", error.getField());            
//    		validatorResult.put(validKeyName, error.getDefaultMessage());        
//    		}        
//    	return validatorResult;
//    }
    
    /**
     * 가입여부확인
     * @param paramMap
     * @return
     */
    public int checkId(Map<String, Object> paramMap) {
    	Map<String, Object> map = paramMap;
    	int result = userMapper.checkId(map);                								    
        return result;
    }
    
    /**
     * 이메일등록확인
     * @param paramMap
     * @return
     */
    public int checkEmail(Map<String, Object> paramMap) {
    	Map<String, Object> map = paramMap;
    	int result = userMapper.checkEmail(map);                								    
    	return result;
    }
    	
}