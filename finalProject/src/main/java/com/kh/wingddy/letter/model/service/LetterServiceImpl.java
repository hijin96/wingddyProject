package com.kh.wingddy.letter.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wingddy.letter.model.dao.LetterDao;

@Service
public class LetterServiceImpl implements LetterService{

	
	@Autowired
	private LetterDao letterDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}
