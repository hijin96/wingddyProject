package com.kh.wingddy.calendar.controller;

import java.util.HashMap;

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
			model.addAttribute("errorMsg", "일정 추가 실패.");
			return "common/errorPage";
		}
	}
	
	
	/**
	 * 캘린더에서 특정 날짜 클릭 시 해당 날짜의 일정 목록을 조회
	 */
	@ResponseBody
	@RequestMapping(value="daySchedule", produces="application/json; charset=UTF-8")
	public String selectDaySchedule(int memberNo, String date) {
		HashMap map = new HashMap();
		map.put("memberNo", memberNo);
		map.put("date", date);
		//System.out.println(map);
		return new Gson().toJson(calendarService.selectDaySchedule(map));
	}
	
	@RequestMapping("deleteSchedule")
	public String deleteSchedule(int scheduleNo, Model model) {
		if(calendarService.deleteSchedule(scheduleNo) > 0) {
			return "redirect:/calendar";
		} else {
			model.addAttribute("errorMsg", "일정 삭제 실패. 다시 시도해주세요.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("updateSchedule")
	public String updateSchedule(Calendar c, Model model) {
		if(calendarService.updateSchedule(c) > 0) {
			return "redirect:/calendar";
		} else {
			model.addAttribute("errorMsg", "일정 수정 실패");
			return "common/errorPage";
		}
	}
	
	
}
