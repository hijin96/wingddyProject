package com.kh.wingddy.manitto.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.wingddy.manitto.model.service.ManittoService;
import com.kh.wingddy.manitto.model.vo.Manitto;

@Controller
public class ManittoController {
	
	@Autowired
	private ManittoService ManittoService;
	
	@RequestMapping("main.mani")
	private String manittoMain() {
		
		return "manitto/manittoManagement";
	}
	
	@ResponseBody
	@RequestMapping("matching.mani")
	private String manittoMatching(Manitto mt) {
		
		ManittoService.manittoMatching(mt);
		
		return "";
	}
	
	

}
