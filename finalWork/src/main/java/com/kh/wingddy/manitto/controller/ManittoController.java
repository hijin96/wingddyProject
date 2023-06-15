package com.kh.wingddy.manitto.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.wingddy.manitto.model.service.ManittoService;
import com.kh.wingddy.manitto.model.vo.Manitto;

@Controller
public class ManittoController {
	
	@Autowired
	private ManittoService ManittoService;
	
	@RequestMapping("main.mani")
	private String manittoMain() {
		
		return "manitto/manittoManagement";
	}
	
	@ResponseBody
	@RequestMapping("matching.mani")
	private String manittoMatching(Manitto mt) {

		return ManittoService.manittoMatching(mt);
	}
	
	@ResponseBody
	@RequestMapping(value="manittoList.mani", produces="application/json; charset=UTF-8")
	private String selectManittoList(int classNo) {
		
		return new Gson().toJson(ManittoService.selectManittoList(classNo));
		
	}
	
	
	@ResponseBody
	@RequestMapping("delete.mani")
	private int deleteManitto(int classNo) {

		return ManittoService.deleteManitto(classNo);
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="myManitti.mani",  produces="html/text; charset=UTF-8")
	private String selectMyManitti(Manitto mt) {

		return ManittoService.selectMyManitti(mt);
	}
	

}
