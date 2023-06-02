package com.kh.wingddy.manitto.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.wingddy.manitto.model.service.ManittoService;

@Controller
public class ManittoController {
	
	@Autowired
	private ManittoService ManittoService;
	
	@RequestMapping("matching.mani")
	private String manittoMatching() {
		
		return "manitto/manittoMatching";
	}
	
	

}
