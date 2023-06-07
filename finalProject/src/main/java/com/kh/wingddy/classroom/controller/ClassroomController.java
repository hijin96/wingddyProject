package com.kh.wingddy.classroom.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.wingddy.classroom.model.service.ClassroomService;
import com.kh.wingddy.classroom.model.vo.ClassMember;
import com.kh.wingddy.classroom.model.vo.Classroom;

@Controller
public class ClassroomController {
	@Autowired
	private ClassroomService classroomService;
	
	@RequestMapping(value="classMain.cl")
	public ModelAndView ClassMainView(ModelAndView mv, HttpSession session, int cno) {
		
		ArrayList<ClassMember> cM = classroomService.selectPassStudent(cno);
		System.out.println(cM);
		
		session.setAttribute("classroom", new Classroom(cno, "임시세션", "임시세션","임시코드"));
		mv.addObject("passMember", cM);
		mv.setViewName("classroom/classTeacherMain");
		System.out.println(mv);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("passStudent.cl")
	public String passStudent(ClassMember cm) {
		
		System.out.println(cm);
		int result = classroomService.passStudent(cm);
		
		
		return result > 0 ? "pass" : "nope";
	}
}
