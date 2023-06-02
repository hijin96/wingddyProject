package com.kh.wingddy.voca.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.wingddy.member.model.vo.Member;
import com.kh.wingddy.voca.model.service.VocaService;
import com.kh.wingddy.voca.model.vo.VocaBook;

@Controller
public class VocaController {
	
	@Autowired
	private VocaService vocaService;

	@RequestMapping("main.vc")
	public ModelAndView vocamainView(HttpSession session, ModelAndView mv) {
		
		Member m = ((Member)session.getAttribute("loginUser"));
		
		ArrayList<VocaBook> bookList = vocaService.selectVocaBookList(/*m.getMemberNo()*/2);
		
		
		mv.addObject("bookList", bookList).setViewName("voca/vocaMain");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="vocaList.vc", produces="application/json; charset=UTF-8")
	public String selectVocaList(int bookNo) {
		return new Gson().toJson(vocaService.selectVocaList(bookNo));
	}
	
}
