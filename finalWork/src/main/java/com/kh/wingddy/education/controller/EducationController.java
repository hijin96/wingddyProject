package com.kh.wingddy.education.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.wingddy.education.model.service.EducationService;

@Controller
public class EducationController {
	
	@Autowired
	private EducationService educationService;
	
	@RequestMapping("main.edu")
	public ModelAndView eduMainPage(int cno, ModelAndView mv) {
		mv.
		addObject("eList", educationService.selectEduList(cno)).
		setViewName("education/eduMain");
		return mv;
	}
	
}
