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
	public ModelAndView eduDetailPage(HttpServletRequest request, ModelAndView mv, int eduNo) {
		mv.addObject("qList", educationService.selectQuizList(eduNo)).setViewName("education/eduDetail");
		return mv;
	}
	
	@RequestMapping("exam.edu")
	public ModelAndView eduExamPage(HttpServletRequest request, ModelAndView mv, int eduNo, String eduType) {
		
		String view = "";
		switch(eduType) {
		case "W" : view = "education/eduWord"; break;
		case "S" : view = "education/eduSentence"; break;
		case "O" : view = "education/eduOX"; break;
		default : view = "redirect:main.edu";
		}
		mv.setViewName(view);
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
	
	@RequestMapping("deadLine.edu")
	public String updateEndTime(int cno, int eduNo) {
		
		educationService.updateEndTime(eduNo);
		return "redirect:main.edu";
	}
}
