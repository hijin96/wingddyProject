package com.kh.wingddy.classroom.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wingddy.alphabetMarket.model.vo.MyCount;
import com.kh.wingddy.classroom.model.vo.ClassMember;
import com.kh.wingddy.classroom.model.vo.Classroom;
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
}
