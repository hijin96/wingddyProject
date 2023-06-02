package com.kh.wingddy.calendar.model.service;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.wingddy.calendar.model.vo.Calendar;
import com.kh.wingddy.member.model.vo.Member;

public interface CalendarService {
	public ArrayList<Calendar> selectScheduleList(int memberNo);
	
	public ArrayList<Calendar> selectDaySchedule(Calendar c);
	
	public int insertSchedule(Calendar c);
	
	public int updateSchedule(int scheduleNo);
	
	public int deleteSchedule(int scheduleNo);
}
