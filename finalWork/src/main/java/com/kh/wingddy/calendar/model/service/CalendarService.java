package com.kh.wingddy.calendar.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.wingddy.calendar.model.vo.Calendar;

public interface CalendarService {
	public ArrayList<Calendar> selectScheduleList(int memberNo);
	
	public ArrayList<Calendar> selectDaySchedule(HashMap map);
	
	public int insertSchedule(Calendar c);
	
	public int updateSchedule(Calendar c);
	
	public int deleteSchedule(int scheduleNo);
	
	public ArrayList<Calendar> selectClassScheduleList(HashMap map);
	
}
