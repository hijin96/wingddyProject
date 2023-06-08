package com.kh.wingddy.classroom.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wingddy.alphabetMarket.model.vo.MyCount;
import com.kh.wingddy.classroom.model.dao.ClassroomDao;
import com.kh.wingddy.classroom.model.vo.ClassMember;
import com.kh.wingddy.classroom.model.vo.Classroom;
import com.kh.wingddy.member.model.vo.Member;

@Service
public class ClassroomServiceImpl implements ClassroomService {

	@Autowired
	private ClassroomDao classroomDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Classroom> selectClassList(Member m) {
		return classroomDao.selectClassList(sqlSession, m);
	}

	@Override
	public ArrayList<ClassMember> selectPassStudent(int cno) {
		
		
		return classroomDao.selectPassStudent(sqlSession, cno);
	}


}
