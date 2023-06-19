package com.kh.wingddy.education.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.kh.wingddy.education.model.vo.EduProgress;
import com.kh.wingddy.education.model.vo.Quiz;

@Mapper
public interface EduMapper {

	ArrayList<EduProgress> selectEduList(int classNo);

	ArrayList<Quiz> selectQuizList(int eduNo);


}
