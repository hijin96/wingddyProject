package com.kh.wingddy.letter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.wingddy.letter.model.service.LetterService;

@Controller
public class LetterController {

	
	@Autowired
	private LetterService LetterService;
	
	
	
}
