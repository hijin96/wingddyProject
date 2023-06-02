package com.kh.wingddy.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.wingddy.calendar.model.service.CalendarServiceImpl;
import com.kh.wingddy.calendar.model.vo.Calendar;

@Controller
public class calendarController {
	
	@Autowired
	private CalendarServiceImpl calendarService;
	
	@RequestMapping("calendar")
	public String selectCalendar() {
		return "calendar/calendar";
	}
	
	@ResponseBody
	@RequestMapping(value="selectScheduleList", produces="application/json; charset=UTF-8")
	public String ajaxScheduleList(int memberNo) {
		return new Gson().toJson(calendarService.selectScheduleList(memberNo));
	}
	
	@RequestMapping("insertSchedule")
	public String insertSchedule(Calendar c, Model model) {
		
		if(calendarService.insertSchedule(c) > 0) {
			return "redirect:/calendar"; 
		} else {
			model.addAttribute("errorMsg", "일정 추가에 실패했습니다.");
			return "common/errorPage";
		}
	}
	
	
	
	
}
