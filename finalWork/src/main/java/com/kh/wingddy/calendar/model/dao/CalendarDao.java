package com.kh.wingddy.calendar.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wingddy.calendar.model.vo.Calendar;

@Repository
public class CalendarDao {

	public int insertSchedule(SqlSessionTemplate sqlSession, Calendar c) {
		
		int result1 = sqlSession.insert("calendar-mapper.insertSchedule", c);
		int classNo = c.getClassNo();
		int result2 = sqlSession.insert("calendar-mapper.insertClassSchedule", classNo);
		if(result1 * result2 > 0) {
			return 1;
		} else {
			return 0;
		}
	}

	
	
	public ArrayList<Calendar> selectScheduleList(SqlSessionTemplate sqlSession, int memberNo){
		return (ArrayList)sqlSession.selectList("calendar-mapper.selectScheduleList", memberNo);
	}
	
	public ArrayList<Calendar> selectDaySchedule(SqlSessionTemplate sqlSession, HashMap map){
		return (ArrayList)sqlSession.selectList("calendar-mapper.selectDaySchedule", map);
	}
	
	public int deleteSchedule(SqlSessionTemplate sqlSession, int scheduleNo) {
		return sqlSession.delete("calendar-mapper.deleteSchedule", scheduleNo);
	}
	
	public int updateSchedule(SqlSessionTemplate sqlsession, Calendar c) {
		return sqlsession.update("calendar-mapper.updateSchedule", c);
	}
	
	public ArrayList<Calendar> selectClassScheduleList(SqlSessionTemplate sqlSession, HashMap map){
		//System.out.println(map);
		//System.out.println((ArrayList)sqlSession.selectList("calendar-mapper.selectClassScheduleList", map));
		return (ArrayList)sqlSession.selectList("calendar-mapper.selectClassScheduleList", map);
	}
	
	
	
}
