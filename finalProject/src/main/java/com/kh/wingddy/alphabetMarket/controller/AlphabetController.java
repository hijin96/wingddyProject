package com.kh.wingddy.alphabetMarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.wingddy.alphabetMarket.model.service.AlphabetService;

@Controller
public class AlphabetController {
	
	@Autowired
	private AlphabetService AlphabetService;
	
	@RequestMapping("alphabet.main")
	public String include() {
		
		return "alphabetMarket/alphabetMarketMain";
	}

}
