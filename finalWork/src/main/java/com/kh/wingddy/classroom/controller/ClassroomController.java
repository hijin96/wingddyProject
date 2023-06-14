package com.kh.wingddy.classroom.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.wingddy.classroom.model.service.ClassroomService;
import com.kh.wingddy.classroom.model.vo.ClassMember;
import com.kh.wingddy.classroom.model.vo.Classroom;
import com.kh.wingddy.common.template.GenerateSecret;
import com.kh.wingddy.member.model.vo.Member;

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

	
	@ResponseBody
	@RequestMapping("passStudent.cl")
	public String passStudent(ClassMember cm) {
		
		System.out.println(cm);
		int result = classroomService.passStudent(cm);
		
		
		return result > 0 ? "pass" : "nope";
	}
	
	@RequestMapping("enrollClassForm.cl")
	public String enrollClassForm() {
		return "classroom/enrollClassForm";
	}
	
	@RequestMapping("enrollClass.cl")
	public ModelAndView enrollClassForm(ModelAndView mv, String enterCode, HttpSession session) {
		
		Classroom cr = classroomService.joinClass(enterCode);
		
		if(cr != null) {
			//session.setAttribute("alertMsg", "입장신청되었습니닷!");
			mv.addObject("classroom", cr);
			mv.setViewName("classroom/enrollClassForm");
		} else {
			session.setAttribute("alertMsg", "존재하지 않는 클래스입니닷!");
			mv.setViewName("classroom/enrollClassForm");
		}
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("insertPass.cl")
	public int insertPass(ClassMember cm) {
		
		return classroomService.insertPass(cm);
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
	
	@RequestMapping("classManagement.cl")
	public ModelAndView studentManagement(ModelAndView mv, int cno) {
		
		// 관리페이지 내 select문에서 가져올 데이터
		//System.out.println(cno);
		mv.addObject("classMember", classroomService.selectPassStudent(cno));
		mv.setViewName("classroom/studentManagement");
		return mv;
	}
	
	@RequestMapping("kickoutStudent.cl")
	public int kickoutStudent(@RequestParam(value="studentArr[]")int[] studentNoArr, int classNo) {
		
		System.out.println("asdasd");   
		System.out.println(studentNoArr[0]);
		
        
		ArrayList<ClassMember> cmList = new ArrayList();
		for(int i = 0; i < studentNoArr.length; i++) {
			ClassMember cm = new ClassMember();     
			cm.setStudentNo(studentNoArr[i]);
			cm.setClassNo(classNo);
			
			cmList.add(cm);
		}
		
		//System.out.println(memberNoList.get(0));
		
		int result = classroomService.kickoutStudent(cmList);
		
		return 0;
	}
}
