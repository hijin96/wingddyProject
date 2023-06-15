package com.kh.wingddy.education.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wingddy.education.model.dao.EduMapper;
import com.kh.wingddy.education.model.vo.EduProgress;

@Service
public class EducationServiceImpl implements EducationService {

	@Autowired
	private EduMapper eduMapper;
	
	@Override
	public ArrayList<EduProgress> selectEduList(int cno) {
		return eduMapper.selectEduList(cno);
	}

}
