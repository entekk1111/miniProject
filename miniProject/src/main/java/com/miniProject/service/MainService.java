package com.miniProject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.miniProject.component.JsoupComponentLocalMain;

@Service
public class MainService {

	public List<String> testService() {
		System.out.println("testService");
		JsoupComponentLocalMain cre = new JsoupComponentLocalMain();
		
		return cre.process();
	}
}
