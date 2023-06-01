package com.kh.wingddy.alphabetMarket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AlphabetController {
	
	@Autowired
	private AlphabetService AlphabetService;
	
	@RequestMapping("include")
	public String include() {
		
		return "test/include";
	}

}
