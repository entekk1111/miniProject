package com.miniProject.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.miniProject.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * 회원가입화면
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String sign(Model model) {
		return "signUp";
	}
	
	/**
	 * 회원가입처리
	 * 
	 * @param model
	 * @param inMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public @ResponseBody int saveUser(@RequestBody Map<String, Object> inMap) throws Exception {
		int result = userService.joinUser(inMap);
		return result;
	}
}
