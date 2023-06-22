package com.kh.wingddy.letter.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.wingddy.alphabetMarket.model.service.AlphabetService;
import com.kh.wingddy.alphabetMarket.model.vo.Alphabet;
import com.kh.wingddy.classroom.model.service.ClassroomService;
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
	
	@Autowired
	private ClassroomService classroomService;
	
	
	// 쪽지함 메인
	@RequestMapping("letterBox")
	private String letterMain(int cno, HttpServletRequest request) {
		
		request.setAttribute("classroom", classroomService.selectClassroom(cno));

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
		
		//  내 알파벳 카테고리
		Alphabet ap = new Alphabet();
		ap.setCno(letter.getClassNo());
		ap.setMno(Integer.parseInt(letter.getSender()));
		model.addAttribute("myAlphabet", alphabetService.selectCategory(ap));
		
		// 수신자 카테고리
		model.addAttribute("recipientList", letterService.selectRecipient(cno));
		
		// 내 마니또, 마니띠 정보 가져가기
		
		Integer manitto = letterService.selectMymanitto(letter);

		
		model.addAttribute("myManitto", manitto);
		model.addAttribute("myManitti", letterService.selectMymanitti(letter));
		
		return "letter/letterEnroll";
	}
	
	@RequestMapping("insert.le")
	private String insertLetter(Letter letter, HttpSession session, HttpServletRequest request) {
		
		
		if(letterService.insertLetter(letter) > 0) {
			session.setAttribute("alertMsg", "쪽지가 전송되었어요!");
		}else {
			session.setAttribute("alertMsg", "쪽지 전송에 실패했어요!");
		}
		
		request.setAttribute("letterCno",letter.getClassNo());
		
		return "sideBar/sideBar";
	}
	
	@RequestMapping("detail.le")
	private String letterDetail(Letter letter, Model model) {
		
		// 내가 받은 메일만 읽음표시
		letterService.changeReadStatus(letter);
		
		
		//디테일이동
		model.addAttribute("letter", letterService.letterDetail(letter));
		
		return "letter/letterDetail";
	}
	
	
	@ResponseBody
	@RequestMapping(value="getGift.le")
	private int getGift(Letter letter) {
		
		return letterService.getGift(letter);
		
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="unRead.le", produces="application/json; charset=UTF-8")
	private String unReadLetter(int memberNo) {
		
		return new Gson().toJson(letterService.unReadLetter(memberNo));
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="markAll.le")
	private int markAll(int memberNo) {
		
		return letterService.markAll(memberNo);
		
	}
	
	
	@RequestMapping(value="delete.le")
	private String deleteLetter(int[] letterList) {
		
		System.out.println(letterList);
		
		return "";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
