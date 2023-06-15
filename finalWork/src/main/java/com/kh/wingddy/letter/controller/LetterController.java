package com.kh.wingddy.letter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.wingddy.letter.model.service.LetterService;
import com.kh.wingddy.letter.model.vo.Letter;

@Controller
public class LetterController {

	
	@Autowired
	private LetterService letterService;
	
	
	@RequestMapping("letterBox")
	private String letterMain(int cno) {

		return "letter/letterList";
	}
	
	@ResponseBody
	@RequestMapping(value="recevied.le",  produces="application/json; charset=UTF-8")
	public String ajaxReceivedLetter(Letter letter) {

		
		
		return new Gson().toJson(letterService.ajaxReceivedLetter(letter));
		
	}
	
	@ResponseBody
	@RequestMapping(value="sent.le", produces="application/json; charset=UTF-8")
	public String ajaxSentLetter(Letter letter) {
		return new Gson().toJson(letterService.ajaxSentLetter(letter));
	}
	
	

	
	
	
	@RequestMapping("enroll.le")
	private String letterEnrollForm(){
		
		return "letter/letterEnroll";
	}
	
	
	
}
