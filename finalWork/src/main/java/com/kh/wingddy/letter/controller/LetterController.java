package com.kh.wingddy.letter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.wingddy.letter.model.service.LetterService;
import com.kh.wingddy.letter.model.vo.Letter;

@Controller
public class LetterController {

	
	@Autowired
	private LetterService LetterService;
	
	
	@RequestMapping("letterBox")
	private String letterList(int cno) {

		return "letter/letterList";
	}
	
	
	

	
	
	
	@RequestMapping("enroll.le")
	private String letterEnrollForm(){
		
		return "letter/letterEnroll";
	}
	
	
	
}
