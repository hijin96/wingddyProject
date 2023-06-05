package com.kh.wingddy.alphabetMarket.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.wingddy.alphabetMarket.model.service.AlphabetService;
import com.kh.wingddy.alphabetMarket.model.vo.AlphabetMarket;

@Controller
public class AlphabetController {
	
	@Autowired
	private AlphabetService AlphabetService;
	
	// 알파벳 마켓 리스트
	@RequestMapping("main.aph")
	public String main(HttpSession session, AlphabetMarket am) {
		
		//if(am.getAlphabet() != null) {
			//AlphabetService.ajaxSelectMarketList(am);
		//}
		
		return "alphabetMarket/alphabetMarketMain";
	}
	
	@RequestMapping("enroll.aph")
	public String enroll() {
		
		return "alphabetMarket/alphabetMarketEnroll";
	}
	
	
	@RequestMapping("post.aph")
	public void insertMarket(String letter) {

	}
	
	
	// 마이 알파벳
	@RequestMapping("myAlphabet.aph")
	public String myAlphabet() {
		
		return "alphabetMarket/myAlphabet";
	}
	
	@RequestMapping("makeWords.aph")
	public String makeWords() {
		
		return "alphabetMarket/makeWords";
	}
	

	@RequestMapping("detail.aph")
	public String mkDetailView() {
		
		return "alphabetMarket/alphabetMarketDetail";
	}

}
