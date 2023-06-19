package com.kh.wingddy.letter.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.wingddy.alphabetMarket.model.service.AlphabetService;
import com.kh.wingddy.alphabetMarket.model.service.AlphabetServiceImpl;
import com.kh.wingddy.alphabetMarket.model.vo.Alphabet;
import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.common.template.Pageination;
import com.kh.wingddy.letter.model.service.LetterService;
import com.kh.wingddy.letter.model.vo.Letter;

@Controller
public class LetterController {

	
	@Autowired
	private LetterService letterService;
	
	@Autowired
	private AlphabetService alphabetService;
	
	// 쪽지함 메인
	@RequestMapping("letterBox")
	private String letterMain(int cno) {

		return "letter/letterList";
	}
	
	// 받은 쪽지 페이징 버튼
	@ResponseBody
	@RequestMapping(value="receivedPaging.le", produces="application/json; charset=UTF-8")
	public String ajaxReceivedPaging(Letter letter, int rPage) {

	
		PageInfo pi = Pageination.getPageInfo(letterService.receviedCount(letter), rPage, 5, 5); 

		return new Gson().toJson(pi);
	}
	
	
	// 받은 쪽지 리스트
	@ResponseBody
	@RequestMapping(value="recevied.le",  produces="application/json; charset=UTF-8")
	public String ajaxReceivedLetter(Letter letter, int rPage) {
		
		
		
		PageInfo pi = Pageination.getPageInfo(letterService.receviedCount(letter), rPage, 5, 5); 
		
		
		return new Gson().toJson(letterService.ajaxReceivedLetter(letter, pi));
		
	}
	
	// 보낸 쪽지 페이징 버튼
	@ResponseBody
	@RequestMapping(value="sentPaging.le", produces="application/json; charset=UTF-8")
	public String ajaxSentPaging(Letter letter, int rPage) {
		

	
		PageInfo pi = Pageination.getPageInfo(letterService.sentCount(letter), rPage, 5, 5); 

		return new Gson().toJson(pi);
	}
	
	// 보낸 쪽지 리스트
	@ResponseBody
	@RequestMapping(value="sent.le", produces="application/json; charset=UTF-8")
	public String ajaxSentLetter(Letter letter, int rPage) {
		
		
		PageInfo pi = Pageination.getPageInfo(letterService.sentCount(letter), rPage, 5, 5); 
		
		return new Gson().toJson(letterService.ajaxSentLetter(letter, pi));
	}
	
	

	
	
	
	@RequestMapping("enroll.le")
	private String letterEnrollForm(int cno, Letter letter, Model model){
		
		System.out.println(letter);
		
		//  내 알파벳 카테고리
		Alphabet ap = new Alphabet();
		ap.setCno(letter.getClassNo());
		ap.setMno(Integer.parseInt(letter.getSender()));
		model.addAttribute("myAlphabet", alphabetService.selectCategory(ap));
		
		// 수신자 카테고리
		model.addAttribute("recipientList", letterService.selectRecipient(cno));
		
		// 내 마니또, 마니띠 정보 가져가기

		model.addAttribute("myManitto", letterService.selectMymanitto(letter));
		model.addAttribute("myManitti", letterService.selectMymanitti(letter));

		return "letter/letterEnroll";
	}
	
	@RequestMapping("insert.le")
	private String insertLetter(Letter letter) {
		
		letterService.insertLetter(letter);
		return null;
	}
	
	
	
}
