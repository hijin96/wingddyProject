package com.kh.wingddy.education.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.kh.wingddy.education.model.vo.Edu;
import com.kh.wingddy.education.model.vo.EduProgress;
import com.kh.wingddy.education.model.vo.Quiz;
import com.kh.wingddy.member.model.vo.Member;

@Mapper
public interface EduMapper {

	ArrayList<EduProgress> selectEduList(int classNo);

	ArrayList<Quiz> selectQuizList(int eduNo);

	int updateEndTime(int eduNo);

	ArrayList<Member> selectCompleteStudent(int eduNo);

	int insertEducation(Edu e);

	int insertQuiz(Quiz q);


}
