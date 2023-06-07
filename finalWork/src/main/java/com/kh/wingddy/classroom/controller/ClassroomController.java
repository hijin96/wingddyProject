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
import com.kh.wingddy.common.template.GenerateSecret;

@Controller
public class ClassroomController {
	@Autowired
	private ClassroomService classroomService;
	
	@RequestMapping("classMain.cl")
	public ModelAndView ClassMainView(ModelAndView mv, HttpSession session, int cno) {
		
		ArrayList<ClassMember> cm = classroomService.selectPassStudent(cno);
		System.out.println(cm);
		
		session.setAttribute("classroom", new Classroom(cno, "임시세션", "임시세션","임시코드"));
		mv.setViewName("classroom/classTeacherMain");
		return mv;
	}

	
	@ResponseBody
	@RequestMapping("passStudent.cl")
	public String passStudent(ClassMember cm) {
		
		System.out.println(cm);
		int result = classroomService.passStudent(cm);
		
		
		return result > 0 ? "pass" : "nope";
	}
	
	@RequestMapping("addClassForm.cl")
	public String addClassForm() {
		return "classroom/addClassForm";
	}
	
	@RequestMapping("addClass.cl")
	public String addClass(Classroom cr) {
		
		
		if(cr.getTeacherName() != null) {
			
			GenerateSecret gs = new GenerateSecret();
			String secret = gs.generateSecret();
			
			cr.setEnterCode(secret);
		}
		
		return classroomService.createClassroom(cr) > 0 ? "redirect:/" : "common/errorPage";
	}
}
