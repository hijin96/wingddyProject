package com.kh.wingddy.letter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.wingddy.letter.model.service.LetterService;

@Controller
public class LetterController {

	
	@Autowired
	private LetterService LetterService;
	
	
	@RequestMapping("letterBox")
	private String letterList(int classNo) {
		
		
		
		return "letter/letterList";
	}
	
	@RequestMapping("enroll.le")
	private String letterEnrollForm(){
		
		return "letter/letterEnroll";
	}
	
	
	
}
