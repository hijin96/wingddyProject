package com.kh.wingddy.alphabetMarket.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.wingddy.alphabetMarket.model.service.AlphabetService;
import com.kh.wingddy.alphabetMarket.model.vo.AlphabetMarket;
import com.kh.wingddy.alphabetMarket.model.vo.MarketReply;

@Controller
public class AlphabetController {
	
	@Autowired
	private AlphabetService AlphabetService;
	
	
	@RequestMapping(value="main.aph")
	//@RequestMapping("main.aph")
	public String main(HttpServletResponse response) {

		
		return "alphabetMarket/alphabetMarketMain";

	}
	
	
	@ResponseBody
	@RequestMapping(value="list.aph", produces="application/json; charset=UTF-8")
	public String main(AlphabetMarket am, HttpServletResponse response) {

		Cookie blinding = new Cookie("blinding", am.getSellingStatus());
		
		blinding.setMaxAge(60*60*24*30*3);
		
		response.addCookie(blinding);
		
		return new Gson().toJson(AlphabetService.ajaxSelectMarketList(am));
		
	}
	
	
	
	
	
	
	
	//마켓 디테일 뷰
	@RequestMapping("detail.aph")
	public String marketDetail() {
				
		//AlphabetService.marketDetail(bno);
		
		return "alphabetMarket/alphabetMarketDetail";
	}
	
	// 마켓 댓글
	
	@RequestMapping("rlist.aph")
	public MarketReply mkReplyList() {
		
		return null;
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
	

}
