package com.kh.wingddy.classroom.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wingddy.alphabetMarket.model.vo.MyCount;
import com.kh.wingddy.classroom.model.vo.ClassMember;
import com.kh.wingddy.classroom.model.vo.Classroom;
import com.kh.wingddy.education.model.vo.Incorrect;
import com.kh.wingddy.member.model.vo.Member;

@Repository
public class ClassroomDao {

	public ArrayList<Classroom> selectClassList(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("classMapper.selectClassList", m);
	}

	public ArrayList<ClassMember> selectPassStudent(SqlSessionTemplate sqlSession, int cno){
		return (ArrayList)sqlSession.selectList("classMapper.selectPassStudent", cno);
	}
	

	public int passStudent(SqlSessionTemplate sqlSession, ClassMember cm) {
		return sqlSession.update("classMapper.passStudent", cm);
	}
	
	public int createClassroom(SqlSessionTemplate sqlSession, Classroom cr) {
		return sqlSession.insert("classMapper.createClassroom", cr);
	}
	
	public Classroom selectClassroom(SqlSessionTemplate sqlSession, int cno) {
		return sqlSession.selectOne("classMapper.selectClassroom", cno);
	}
	
	public ArrayList<MyCount> selectClassRanking(SqlSessionTemplate sqlSession, int cno) {
		return (ArrayList)sqlSession.selectList("classMapper.selectClassRanking", cno);
	}
	
	public Classroom joinClass(SqlSessionTemplate sqlSession, String enterCode) {
		return sqlSession.selectOne("classMapper.joinClass", enterCode);
	}
	
	public int insertPass(SqlSessionTemplate sqlSession, ClassMember cm) {
		return sqlSession.insert("classMapper.insertPass", cm);
	}
	
	public int kickoutStudent(SqlSessionTemplate sqlSession, ClassMember cm) {
		return sqlSession.delete("classMapper.kickoutStudent", cm);
	}
	
	public ArrayList<ClassMember> selectProgressRate(SqlSessionTemplate sqlSession, int cno){
		return (ArrayList)sqlSession.selectList("classMapper.selectProgressRate", cno);
	}
	
	public ArrayList<Incorrect> selectProgressStudent(SqlSessionTemplate sqlSession, ClassMember cm){
		return (ArrayList)sqlSession.selectList("com.kh.wingddy.education.model.dao.EduMapper.selectProgressStudent", cm);
	}
	
	
	
	
	
	
	
	
	
	
	
	// 클래스 학생관리 > 학생 뽑기 횟수 부여 - 세희
	public int giveGachaCount(SqlSessionTemplate session, ClassMember cm) {
		return session.insert("classMapper.giveGachaCount", cm);
	}
	
	// 학생 마이카운트 0으로 추가
	public int insertDefaultMyCount(SqlSessionTemplate session, ClassMember cm) {
		return session.insert("classMapper.insertDefaultMyCount", cm);
	}
}
