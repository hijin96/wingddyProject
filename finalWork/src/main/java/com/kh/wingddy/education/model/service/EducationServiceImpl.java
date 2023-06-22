package com.kh.wingddy.education.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.wingddy.education.model.dao.EduMapper;
import com.kh.wingddy.education.model.vo.Edu;
import com.kh.wingddy.education.model.vo.EduProgress;
import com.kh.wingddy.education.model.vo.Quiz;
import com.kh.wingddy.member.model.vo.Member;

@Service
public class EducationServiceImpl implements EducationService {

	@Autowired
	private EduMapper eduMapper;
	
	@Override
	public ArrayList<EduProgress> selectEduList(int cno) {
		return eduMapper.selectEduList(cno);
	}

	@Override
	public int updateEndTime(int eduNo) {
		return eduMapper.updateEndTime(eduNo);
	}

	@Override
	public ArrayList<Quiz> selectQuizList(int eduNo) {
		return eduMapper.selectQuizList(eduNo);
	}

	@Override
	public ArrayList<Member> selectCompleteStudent(int eduNo) {
		return eduMapper.selectCompleteStudent(eduNo);
	}

	@Override
	@Transactional
	public int insertEducation(Edu e, ArrayList<Quiz> qList) {
		int result = eduMapper.insertEducation(e);
		for(Quiz q : qList) {
			result *= eduMapper.insertQuiz(q);
		}
		return result;
	}

	@Override
	public Edu selectEduOne(int eduNo) {
		return eduMapper.selectEduOne(eduNo);
	}

}
