package com.kh.wingddy.store.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wingddy.common.model.vo.Attachment;
import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.store.model.dao.StoreDao;
import com.kh.wingddy.store.model.vo.Store;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDao storeDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//게시글목록조회 -1
	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		
		return storeDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Store> selectList(PageInfo pageInfo) {
		return storeDao.selectList(sqlSession,pageInfo);
	}
	
	@Override
	public int inceraseCount(int spNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	//게시글 등록
	@Override
	public int insertStoreBoard(HashMap<String,Object> map) {
		// TODO Auto-generated method stub
		System.out.println("서비스는 작동하나요?"+ storeDao.insertStoreBoard(sqlSession,map));
		return storeDao.insertStoreBoard(sqlSession,map);
	}
	@Override
	public int updateStoreBoard(int spNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deltetStoreBoard(int spNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Store selectStoreBoard(int spNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
