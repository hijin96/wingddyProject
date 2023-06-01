package com.kh.wingddy.calendar.model.service;

import java.sql.Date;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wingddy.calendar.model.dao.CalendarDao;
import com.kh.wingddy.calendar.model.vo.Calendar;
import com.kh.wingddy.member.model.vo.Member;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private CalendarDao calendarDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Calendar> selectScheduleList(int memberNo) {
		return calendarDao.selectScheduleList(sqlSession, memberNo);
	}

	@Override
	public Calendar selectDaySchedule(Member m, Date day) {
		return null;
	}

	@Override
	public int insertSchedule(Calendar c) {
		return calendarDao.insertSchedule(sqlSession, c);
	}

	@Override
	public int updateSchedule(int scheduleNo) {
		return 0;
	}

	@Override
	public int deleteSchedule(int scheduleNo) {
		return 0;
	}

}
