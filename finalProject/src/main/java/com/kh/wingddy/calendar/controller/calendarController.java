package com.kh.wingddy.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.wingddy.calendar.model.service.CalendarServiceImpl;

@Controller
public class calendarController {
	
	@Autowired
	private CalendarServiceImpl calendarService;
	
	@RequestMapping("calendar")
	public String selectCalendar() {
		return "calendar/calendar";
	}
}
