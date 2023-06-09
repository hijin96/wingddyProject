package com.kh.wingddy.voca.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;

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
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.wingddy.member.model.vo.Member;
import com.kh.wingddy.voca.model.service.VocaService;
import com.kh.wingddy.voca.model.vo.ClassVocaBook;
import com.kh.wingddy.voca.model.vo.Voca;
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
	
	@ResponseBody
	@PostMapping(value="insertBook.vc", produces="application/json; charset=UTF-8")
	public String insertBook(@RequestBody String vcList, HttpSession session) throws UnsupportedEncodingException {
		String str = URLDecoder.decode(vcList, "UTF-8");
		
		JsonObject jObj = (new JsonParser().parse("{"+ str +"}").
							getAsJsonObject()).
							get("vcList").
							getAsJsonObject();
		
		ArrayList<Voca> vlist = getVocaList(jObj);
		
		VocaBook vb = new VocaBook();
		vb.setBookName(jObj.get("bookName").getAsString());
		vb.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		return Integer.toString(vocaService.insertVocaBook(vb, vlist));
	}
	
	@GetMapping("updateBook.vc")
	public ModelAndView updateBookView(HttpSession session, ModelAndView mv) {
		mv.
		addObject("vcList", vocaService.
				  			selectVocaBookList(((Member)session.getAttribute("loginUser")).
						  			 			getMemberNo())).
		setViewName("voca/updateBookForm");
		return mv;
	}
	
	@ResponseBody
	@PostMapping(value="updateBook.vc", produces="application/json; charset=UTF-8")
	public String updateBook(@RequestBody String vcList) throws UnsupportedEncodingException {
		String str = URLDecoder.decode(vcList, "UTF-8");
		JsonObject jObj = (new JsonParser().parse("{"+ str +"}").
							getAsJsonObject()).
							get("vcList").
							getAsJsonObject();
		
		ArrayList<Voca> vlist = getVocaList(jObj);
		
		HashMap<String, Object> vb = new HashMap();
		vb.put("bookNo",jObj.get("bookNo").getAsInt());
		vb.put("vlist",vlist);
		return Integer.toString(vocaService.updateVocaBook(vb));
	}
	
	@ResponseBody
	@PostMapping(value="bookClassList.vc", produces="application/json; charset=UTF-8")
	public String selectBookClassList(int bookNo){
		return new Gson().toJson(vocaService.selectBookClassList(bookNo));
	}
	
	public ArrayList<Voca> getVocaList(JsonObject jObj){
		
		
		JsonArray jArr = jObj.get("value").getAsJsonArray();
		
		ArrayList<Voca> list = new ArrayList();
		for(int i = 0; i<jArr.size(); i++) {
			JsonObject obj = jArr.get(i).getAsJsonObject();
			
			Voca vc = new Voca();
			
			vc.setVocaEnglish(obj.get("vocaEnglish").getAsString());
			vc.setVocaKorean(obj.get("vocaKorean").getAsString());
			list.add(vc);
		}
		return list;
	}
	

	
}
