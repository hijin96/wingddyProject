package com.kh.wingddy.alphabetMarket.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.wingddy.alphabetMarket.model.service.AlphabetService;
import com.kh.wingddy.alphabetMarket.model.vo.Alphabet;
import com.kh.wingddy.alphabetMarket.model.vo.AlphabetMarket;
import com.kh.wingddy.alphabetMarket.model.vo.ChangeAlphabet;
import com.kh.wingddy.alphabetMarket.model.vo.MarketReply;
import com.kh.wingddy.alphabetMarket.model.vo.MyCount;
import com.kh.wingddy.alphabetMarket.model.vo.Words;
import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.common.template.Pageination;
import com.kh.wingddy.member.model.vo.Member;

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
	public String marketDetail(int bno, Model model, HttpSession session) {
		
		
		
		Member m = (Member)(session.getAttribute("loginUser"));
		AlphabetMarket am = AlphabetService.marketDetail(bno);

		model.addAttribute("market", am);
		
		
		if(am.getWriter() != m.getMemberId()) {
			
			Alphabet ap = new Alphabet();
			ap.setCno(am.getClassNo());
			ap.setMno(m.getMemberNo());
			
			model.addAttribute("category", AlphabetService.selectCategory(ap));
		}
		
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
		
		//System.out.println("***********" + "페이징 버튼!  " + pi);
		

		return new Gson().toJson(pi);
	}
	
	
	
	// 알파벳카테고리 가져오기
	@RequestMapping("enroll.aph")
	public ModelAndView  enrollAndCategory(Alphabet ap, ModelAndView mv) {
		
		
		mv.addObject("category", AlphabetService.selectCategory(ap));
		mv.setViewName("alphabetMarket/alphabetMarketEnroll");
		
		return mv;
	}
	
	
	// 마켓 글 등록!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
	@RequestMapping("post.aph")
	public void insertMarket(AlphabetMarket am, Model model, HttpSession session) {
		
		
		
		if(AlphabetService.insertMarket(am) == 1) {
			marketDetail(AlphabetService.writerLastMarket(am), model, session);// 해당 글 상세보기로 되돌려주긴

		}
		
	}
	
	
	
	// 마켓 댓글 등록
	@ResponseBody
	@RequestMapping("insertReply.aph")
	public String ajaxInsertReply(MarketReply mr) {
		AlphabetService.ajaxInsertReply(mr);

		
		return "testsuccess";

	}
	
	
	
	// 마켓 알파벳 바꾸기
	@ResponseBody
	@RequestMapping("change.aph")
	public String ajaxChangeAlphabet(ChangeAlphabet ca) {

		String result = AlphabetService.ajaxChangeAlphabet(ca);
		System.out.println(result);
		return result;

	}
	
	
	
	
	
	
	
	
	// 마이 알파벳
	@RequestMapping("myAlphabet.aph")
	public String myAlphabet() {
		
		
		
		return "alphabetMarket/myAlphabet";
	}
	
	
	// 마이 알파벳 화면에 마이 카운트
	@ResponseBody
	@RequestMapping(value="myCount.aph", produces="application/json; charset=UTF-8")
	public String ajaxMyCount(MyCount mc) {
		
		return new Gson().toJson(AlphabetService.ajaxMyCount(mc));
		
	}
	

	// 마이 알파벳 화면에 내 알파벳
	@ResponseBody
	@RequestMapping(value="myAlphabetList.aph", produces="application/json; charset=UTF-8")
	public String ajaxMyAlphabetList(Alphabet ap) {

		return new Gson().toJson(AlphabetService.selectCategory(ap));
		
	}
	
	
	// 알파벳 뽑기 결과
	@ResponseBody
	@RequestMapping("gacha.aph")
	public String ajaxGachaAlphabet(Alphabet ap) {
		
		return AlphabetService.ajaxGachaAlphabet(ap);
		
	}
	
	
	// 내 알파벳 화면
	@RequestMapping("makeWords.aph")
	public String makeWords() {
		
		return "alphabetMarket/makeWords";
	}
	

	@RequestMapping("insertWords.aph")
	public String insertWords(Words wd) {
		
		AlphabetService.insertWords(wd);
		
		return "alphabetMarket/makeWords";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
