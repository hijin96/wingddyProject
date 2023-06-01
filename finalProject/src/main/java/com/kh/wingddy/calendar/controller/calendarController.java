package com.kh.wingddy.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("insertSchedule")
	public String insertSchedule(Calendar c) {
		return (calendarService.insertSchedule(c) > 0)? "calendar/calendar" : "redirect:/"; 
	}
}
