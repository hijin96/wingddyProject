package com.kh.wingddy.education.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EducationController {
	
	@RequestMapping("main.edu")
	public String eduMainPage() {
		return "education/eduMain";
	}
	
}
