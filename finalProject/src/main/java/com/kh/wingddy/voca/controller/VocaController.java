package com.kh.wingddy.voca.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.wingddy.member.model.vo.Member;
import com.kh.wingddy.voca.model.service.VocaService;
import com.kh.wingddy.voca.model.vo.ClassVocaBook;
import com.kh.wingddy.voca.model.vo.VocaBook;

@Controller
public class VocaController {
	
	@Autowired
	private VocaService vocaService;

	@RequestMapping("main.vc")
	public ModelAndView vocamainView(HttpSession session, ModelAndView mv) {
		
		Member m = ((Member)session.getAttribute("loginUser"));
		
		ArrayList<VocaBook> bookList = vocaService.selectVocaBookList(m.getMemberNo());
		
		ArrayList<ClassVocaBook> classBookList = vocaService.selectClassVocaBookList(m.getMemberNo());
		
		mv.addObject("bookList", bookList)
		  .addObject("classBookList", classBookList)
		  .setViewName("voca/vocaMain");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="vocaList.vc", produces="application/json; charset=UTF-8")
	public String selectVocaList(int bookNo) {
		return new Gson().toJson(vocaService.selectVocaList(bookNo));
	}
	
	@GetMapping("insertBook.vc")
	public String insertBookView() {
		return "voca/insertBookForm";
	}
	
	@PostMapping(value="insertBooki.vc", produces="application/json; charset=UTF-8")
	public void insertBook(@RequestBody String vcList) throws UnsupportedEncodingException {
		String str = URLDecoder.decode(vcList, "UTF-8");
		str = str.substring(str.indexOf("["));
		System.out.println(str);
		JsonArray jArr = new JsonParser().parse(str).getAsJsonArray();
		System.out.println(jArr);
		
	}
	
}
