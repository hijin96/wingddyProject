package com.kh.wingddy.classroom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.wingddy.classroom.model.service.ClassroomService;
import com.kh.wingddy.member.model.vo.Member;

@Controller
public class ClassroomController {
	@Autowired
	private ClassroomService classroomService;
	
	@RequestMapping("classMain.cl")
	public String ClassMainView(HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		classroomService.selectClassList(m);
		return "classroom/classTeacherMain";
	}
}
