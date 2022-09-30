package com.miniProject.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	@GetMapping("/signUp")
	public String sign(Model model) {
		return "/user/signUp";
	}
	
    @GetMapping("/login")
    public String login() {
        return "/user/loginForm";
    }
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	@ResponseBody
	public int singUp(@RequestBody HashMap<String, Object> paramMap) throws Exception {
		System.out.println(paramMap);
		int result = userService.joinUser(paramMap);
		return result;
	}
}
