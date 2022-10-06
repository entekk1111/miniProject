package com.miniProject.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.miniProject.model.SessionVO;
import com.miniProject.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
//	@Autowired
//	SessionVO sessionVO;
//	
	
	
	//회원가입
	@GetMapping("/signUp")
	public String sign(Model model) {
		return "/user/signUp";
	}

	//로그인
    @GetMapping("/login")
    public String login() {
        return "/user/loginForm";
    }
    
    //로그아웃
    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	if (auth != null) {            
    		new SecurityContextLogoutHandler().logout(request, response, auth);        
    	}
    	return "redirect:/login";
    }
	
    //회원가입
	@RequestMapping(value="/register.do", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public int singUp(@RequestBody Map<String, Object> paramMap) throws Exception {
		//회원가입 실패시 입력값 유지
//		if (errors.hasErrors()) {
////			model.addAttribute("sessionVO", sessionVO);
//			/* 유효성 통과 못한 필드와 메시지를 핸들링 */
//			Map<String, String> validatorResult = userService.validateHandling(errors);
//			for (String key : validatorResult.keySet()) {
//				model.addAttribute(key, validatorResult.get(key));
//			}
//			/* 회원가입 페이지로 다시 리턴 */
//			return 0; 
//		}
		int result = userService.joinUser(paramMap);
		return result;
	}
	
	
}
