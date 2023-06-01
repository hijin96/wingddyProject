package com.kh.wingddy.manitto.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wingddy.manitto.model.dao.ManittoDao;

@Service
public class ManittoServiceImpl implements ManittoService{
	
	@Autowired
	private ManittoDao manittoDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

}
