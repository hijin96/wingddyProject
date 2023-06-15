package com.kh.wingddy.education.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.kh.wingddy.education.model.vo.EduProgress;

@Mapper
public interface EduMapper {

	ArrayList<EduProgress> selectEduList(int classNo);

}
