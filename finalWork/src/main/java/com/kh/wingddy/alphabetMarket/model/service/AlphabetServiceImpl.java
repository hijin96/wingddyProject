package com.kh.wingddy.alphabetMarket.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wingddy.alphabetMarket.model.dao.AlphabetDao;

@Service
public class AlphabetServiceImpl implements AlphabetService {
	
	@Autowired
	private AlphabetDao alphabetDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
