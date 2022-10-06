package com.miniProject.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping(value="/register.do", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int signUp(@RequestBody Map<String, Object> paramMap) throws Exception {
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
	
	//아이디 체크
	@RequestMapping(value="/check.id", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int checkId(@RequestBody Map<String, Object> paramMap) throws Exception {
		
		int result = userService.checkId(paramMap);
		return result;
	}
	
	//이메일 체크
	@RequestMapping(value="/check.email", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int checkEmail(@RequestBody Map<String, Object> paramMap) throws Exception {
		
		int result = userService.checkEmail(paramMap);
		return result;
	}
	
	//이메일 아이디 체크
	@RequestMapping(value="/check.emailId", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> checkEmailId(Model model, @RequestBody Map<String, Object> paramMap) throws Exception {
		int result1 = userService.checkId(paramMap);
		int result2 = userService.checkEmail(paramMap);
		Map<String, Object> outMap = new HashMap<>();
		outMap.put("result1", result1);
		outMap.put("result2", result2);
		
		return outMap;
	}
	
	
}
