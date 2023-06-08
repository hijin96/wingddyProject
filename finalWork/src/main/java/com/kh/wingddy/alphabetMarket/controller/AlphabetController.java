package com.kh.wingddy.alphabetMarket.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.wingddy.alphabetMarket.model.service.AlphabetService;
import com.kh.wingddy.alphabetMarket.model.vo.Alphabet;
import com.kh.wingddy.alphabetMarket.model.vo.AlphabetMarket;
import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.common.template.Pageination;

@Controller
public class AlphabetController {
	
	@Autowired
	private AlphabetService AlphabetService;
	
	
	// 게시글 리스트 화면
	@RequestMapping("main.aph")
	public String main(HttpServletResponse response) {

		
		return "alphabetMarket/alphabetMarketMain";

	}
	
	// 게시글 리스트 불러오기
	@ResponseBody
	@RequestMapping(value="alphabetList", produces="application/json; charset=UTF-8")
	public String main(AlphabetMarket am, HttpServletResponse response) {
		

		Cookie blinding = new Cookie("blinding", am.getSellingStatus());
		
		blinding.setMaxAge(60*60*24*30*3);
		
		response.addCookie(blinding);
		
		return new Gson().toJson(AlphabetService.ajaxSelectMarketList(am));
		
	}
	
	
	
	//마켓 디테일 뷰
	@RequestMapping("detail.aph")
	public String marketDetail(int bno, Model model) {
		
		model.addAttribute("market", AlphabetService.marketDetail(bno));
	
		return "alphabetMarket/alphabetMarketDetail";
	}
	
	
	

	//마켓 댓글리스트
	@ResponseBody
	@RequestMapping(value="replyList.aph", produces="application/json; charset=UTF-8")
	public String ajaxReplyList(int rPage, int bno) {
		
		
		PageInfo pi = Pageination.getPageInfo(AlphabetService.replyCount(bno), rPage, 10, 5);
		
		return new Gson().toJson(AlphabetService.ajaxReplyList(pi, bno));

	}

	
	// 마켓 댓글 페이징버튼
	@ResponseBody
	@RequestMapping(value="replyPaging.aph", produces="application/json; charset=UTF-8")
	public String ajaxReplyPaging(int rPage, int bno) {
		
		  
		
		PageInfo pi = Pageination.getPageInfo(AlphabetService.replyCount(bno), rPage, 10, 5);
		
		System.out.println("***********" + "페이징 버튼!  " + pi);
		

		return new Gson().toJson(pi);
	}
	
	
	
	@RequestMapping("enroll.aph")
	public String enrollAndCategory(Alphabet ap) {
		
		System.out.println(ap);
		
		AlphabetService.selectCategory(ap);
		
		return "alphabetMarket/alphabetMarketEnroll";
	}
	
	
	@RequestMapping("post.aph")
	public void insertMarket(AlphabetMarket am) {
		
		AlphabetService.insertMarket(am);
		
		
		// return 해당 글 디테일뷰로 이동하기
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
