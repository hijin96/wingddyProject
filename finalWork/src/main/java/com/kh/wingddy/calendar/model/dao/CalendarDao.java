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
		/*
		 * - 교사가 일정 추가 => insert 두 번
		 * - 학생이 일정 추가 => insert 한 번
		 */
		
		int classNo = c.getClassNo();
		int result2 = 1;
		
		//System.out.println(c);
		int result1 = sqlSession.insert("calendar-mapper.insertSchedule", c);
		
		if(!c.getMemberType().equals("S")) {
			result2 = sqlSession.insert("calendar-mapper.insertClassSchedule", classNo);
		}
		
		return result1 * result2 > 0 ? 1 : 0;
	}

	
	
	public ArrayList<Calendar> selectScheduleList(SqlSessionTemplate sqlSession, int memberNo){
		return (ArrayList)sqlSession.selectList("calendar-mapper.selectScheduleList", memberNo);
	}
	
	public ArrayList<Calendar> selectDaySchedule(SqlSessionTemplate sqlSession, HashMap map){
		if(((Calendar)map.get("c")).getMemberType().equals("S")) {
			return (ArrayList)sqlSession.selectList("calendar-mapper.selectDaySchedule", map);
		} else {
			//System.out.println((ArrayList)sqlSession.selectList("calendar-mapper.selectDaySchedule_class", map));
			return (ArrayList)sqlSession.selectList("calendar-mapper.selectDaySchedule_class", map);
		}
	}
	
	public int deleteSchedule(SqlSessionTemplate sqlSession, int scheduleNo) {
		return sqlSession.delete("calendar-mapper.deleteSchedule", scheduleNo);
	}
	
	public int updateSchedule(SqlSessionTemplate sqlsession, Calendar c) {
		return sqlsession.update("calendar-mapper.updateSchedule", c);
	}
	
	public ArrayList<Calendar> selectClassScheduleList(SqlSessionTemplate sqlSession, Calendar c){
		return (ArrayList)sqlSession.selectList("calendar-mapper.selectClassScheduleList", c);
	}
	
	
	
}
