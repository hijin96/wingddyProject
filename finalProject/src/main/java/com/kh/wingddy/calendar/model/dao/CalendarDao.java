package com.kh.wingddy.calendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wingddy.calendar.model.vo.Calendar;

@Repository
public class CalendarDao {

	public int insertSchedule(SqlSessionTemplate sqlSession, Calendar c) {
		return sqlSession.insert("calendar-mapper.insertSchedule", c);
	}
	
	public ArrayList<Calendar> selectScheduleList(SqlSessionTemplate sqlSession, int memberNo){
		return (ArrayList)sqlSession.selectList("calendar-mapper.selectScheduleList", memberNo);
	}
	
	
}
