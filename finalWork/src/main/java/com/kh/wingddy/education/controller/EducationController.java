package com.kh.wingddy.education.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.wingddy.education.model.service.EducationService;
import com.kh.wingddy.education.model.vo.EduProgress;

@Controller
public class EducationController {
	
	@Autowired
	private EducationService educationService;
	
	@RequestMapping("main.edu")
	public ModelAndView eduMainPage(int cno, ModelAndView mv) {
		
		ArrayList<EduProgress> eList = educationService.selectEduList(cno);
		
		mv.
		addObject("eList", eList).
		setViewName("education/eduMain");
		return mv;
	}
	
}
