package com.kh.wingddy.education.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping("detail.edu")
	public String eduDetailPage(HttpServletRequest request, int eduNo) {
		
		return "education/eduDetail";
	}
	
	@RequestMapping("exam.edu")
	public ModelAndView eduExamPage(HttpServletRequest request, ModelAndView mv, int eduNo, String eduType) {
		
		return mv;
	}
	
	@RequestMapping("result.edu")
	public String eduResultPage(HttpServletRequest request, int eduNo) {
		
		return "education/eduResult";
	}
	
	@RequestMapping("insert.edu")
	public String insertEduForm() {
		return "education/insertEduForm";
	}
	
}
