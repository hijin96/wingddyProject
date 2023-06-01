package com.kh.wingddy.voca.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wingddy.voca.model.dao.VocaDao;
import com.kh.wingddy.voca.model.dao.VocaMapper;
import com.kh.wingddy.voca.model.vo.Voca;
import com.kh.wingddy.voca.model.vo.VocaBook;

@Service
public class VocaServiceImpl implements VocaService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private VocaDao vocaDao;
	
	@Autowired
	private VocaMapper vocaMapper;
	
	@Override
	public ArrayList<VocaBook> selectVocaBookList(int memNo) {
		return vocaMapper.selectVocaBookList(memNo);
	}

	@Override
	public ArrayList<Voca> selectVocaList(int bookNo) {
		return null;
	}

}
