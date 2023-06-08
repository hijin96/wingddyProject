package com.kh.wingddy.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.wingddy.classroom.model.service.ClassroomService;
import com.kh.wingddy.classroom.model.vo.Classroom;

public class ClassroomInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	private ClassroomService classroomService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler){
		request.setAttribute("classroom", classroomService.selectClassroom(Integer.parseInt(request.getParameter("cno"))));
		
		return true;
	}
}
