package com.kh.wingddy.classroom.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.wingddy.alphabetMarket.model.vo.MyCount;
import com.kh.wingddy.classroom.model.dao.ClassroomDao;
import com.kh.wingddy.classroom.model.vo.ClassMember;
import com.kh.wingddy.classroom.model.vo.Classroom;
import com.kh.wingddy.education.model.vo.Incorrect;
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


	@Override
	public int passStudent(ClassMember cm) {
		return classroomDao.passStudent(sqlSession, cm) * classroomDao.insertDefaultMyCount(sqlSession, cm);
	}

	@Override
	public int createClassroom(Classroom cr) {
		return classroomDao.createClassroom(sqlSession, cr);
	}

	@Override
	public Classroom selectClassroom(int cno) {
		return classroomDao.selectClassroom(sqlSession, cno);
	}

	@Override
	public ArrayList<MyCount> selectClassRanking(int cno) {
		return classroomDao.selectClassRanking(sqlSession, cno);
	}

	@Override
	public Classroom joinClass(String enterCode) {
		return classroomDao.joinClass(sqlSession, enterCode);
	}

	@Override
	public int insertPass(ClassMember cm) {
		return classroomDao.insertPass(sqlSession, cm);
	}

	@Override
	@Transactional
	public int kickoutStudent(ArrayList<ClassMember> memberNoList) {
		int result = 1;
		for(int i = 0; i < memberNoList.size(); i++) {
			result *= classroomDao.kickoutStudent(sqlSession, memberNoList.get(i));
		}
		return result;
	}

	@Override
	public ArrayList<ClassMember> selectProgressRate(int cno) {
		return classroomDao.selectProgressRate(sqlSession, cno);
	}

	@Override
	public ArrayList<Incorrect> selectProgressStudent(ClassMember cm) {
		return classroomDao.selectProgressStudent(sqlSession, cm);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	// 클래스 학생관리 > 학생 뽑기 횟수 부여 - 세희
	@Override
	public int giveGachaCount(ClassMember cm) {
		return classroomDao.giveGachaCount(sqlSession, cm);
	}
	
	


}
