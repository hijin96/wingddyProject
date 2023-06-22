package com.kh.wingddy.common.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.kh.wingddy.classroom.model.service.ClassroomService;

public class ClassroomInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	private ClassroomService classroomService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler){
		
		request.setAttribute("classroom", classroomService.selectClassroom(Integer.parseInt(request.getParameter("cno"))));
		
		return true;
	}
}
