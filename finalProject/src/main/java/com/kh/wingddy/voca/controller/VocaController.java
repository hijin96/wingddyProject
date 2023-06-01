package com.kh.wingddy.voca.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VocaController {

	@RequestMapping("main.vc")
	public String vocamainView() {
		return "voca/vocaMain";
	}
	
}
