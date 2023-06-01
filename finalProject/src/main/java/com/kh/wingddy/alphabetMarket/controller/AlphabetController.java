package com.kh.wingddy.alphabetMarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.wingddy.alphabetMarket.model.service.AlphabetService;

@Controller
public class AlphabetController {
	
	@Autowired
	private AlphabetService AlphabetService;
	
	@RequestMapping("main.aph")
	public String main() {
		
		return "alphabetMarket/alphabetMarketMain";
	}
	
	@RequestMapping("enroll.aph")
	public String enroll() {
		
		return "alphabetMarket/alphabetMarketEnroll";
	}
	
	@RequestMapping("myAlphabet.aph")
	public String myAlphabet() {
		
		return "alphabetMarket/myAlphabet";
	}
	
	@RequestMapping("makeWords.aph")
	public String makeWords() {
		
		return "alphabetMarket/makeWords";
	}

}
