package com.kh.wingddy.classroom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.wingddy.classroom.model.service.ClassroomService;
import com.kh.wingddy.classroom.model.vo.ClassMember;
import com.kh.wingddy.classroom.model.vo.Classroom;

@Controller
public class ClassroomController {
	@Autowired
	private ClassroomService classroomService;
	
	@RequestMapping("classMain.cl")
	public ModelAndView ClassMainView(ModelAndView mv, HttpSession session, int cno) {
		
		//ArrayList<ClassMember> cm = classroomService.selectPassStudent(cno);
		//System.out.println(cm);
		String memberType = ((Member)session.getAttribute("loginUser")).getMemberType();
		//System.out.println(memberType);
		if(memberType.equals("T")) {
			//session.setAttribute("classroom", new Classroom(cno, "임시세션", "임시세션","임시코드"));
			mv.addObject("passMember", classroomService.selectPassStudent(cno));
			mv.addObject("myCount", classroomService.selectClassRanking(cno));
			mv.setViewName("classroom/classTeacherMain");
			
		} else {
			
			mv.addObject("myCount", classroomService.selectClassRanking(cno));
			mv.setViewName("classroom/classStudentMain");
		}
		return mv;
	}
}
