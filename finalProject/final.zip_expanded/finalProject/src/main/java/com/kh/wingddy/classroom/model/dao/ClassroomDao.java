package com.kh.wingddy.classroom.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	
}
