package com.kh.wingddy.education.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.wingddy.education.model.service.EducationService;
import com.kh.wingddy.education.model.vo.EduProgress;
import com.kh.wingddy.member.model.vo.Member;
import com.kh.wingddy.voca.model.service.VocaService;

@Controller
public class EducationController {
	
	@Autowired
	private EducationService educationService;
	
	@Autowired
	private VocaService vocaService;
	
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
	
	@PostMapping("insertForm.edu")
	public ModelAndView insertEduForm(HttpSession session, ModelAndView mv, int cno) {
		
		
		mv.addObject("vcList", vocaService.selectVocaBookList(((Member)session.getAttribute("loginUser")).getMemberNo()))
		.setViewName("education/insertEduForm");
		return mv;
	}
	
	@PostMapping("insert.edu")
	public String insertEduForm(String str) {
		return "";
	}
	
	@RequestMapping("deadLine.edu")
	public String updateEndTime(HttpSession session, int cno, int eduNo) {
		
		if(educationService.updateEndTime(eduNo) > 0) {
			session.setAttribute("alertMsg", "마감시간이 변경 되었습니다");
		} else {
			session.setAttribute("alertMsg", "변경에 실패하였습니다");
		}
		return "redirect:main.edu";
	}
}
