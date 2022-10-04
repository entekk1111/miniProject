package com.miniProject.common.security.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.miniProject.mapper.UserMapper;
import com.miniProject.model.SessionVO;

@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler{
	private static int TIME = 60 * 60; // 1시간
	
	@Autowired
	UserMapper userMapper;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		request.getSession().setMaxInactiveInterval(TIME);
        String username = (String)authentication.getPrincipal();
//        System.out.println(authentication.getPrincipal());
        
        //유저객체 생성 
        SessionVO user = userMapper.getUserInfo(username);
        request.getSession().setAttribute("SID", user);
//		System.out.println(authentication.getDetails());
//		System.out.println(authentication.getPrincipal());
//		CustomUserDetails customUserDetails = (CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		System.out.println(customUserDetails.getSessionVO().getEmail());
		response.sendRedirect("/product");
	}

}