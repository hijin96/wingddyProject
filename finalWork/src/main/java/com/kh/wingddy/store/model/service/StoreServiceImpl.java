package com.kh.wingddy.store.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wingddy.common.model.vo.Attachment;
import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.store.model.dao.StoreDao;
import com.kh.wingddy.store.model.vo.Cart;
import com.kh.wingddy.store.model.vo.Order;
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
		return storeDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Store> selectList(PageInfo pageInfo) {
		
		return storeDao.selectList(sqlSession,pageInfo);
	}
	
	@Override
	public int inceraseCount(int spNo) {
		return storeDao.inceraseCount(sqlSession,spNo);
	}
	//썸네일 번호 생성
	@Override
	public int createFileNo() {
		return storeDao.createFileNo(sqlSession);
	}

	
	//게시글 등록
	@Override
	public int insertStoreBoard(Store s,Attachment at) {
		// TODO Auto-generated method stub
		return storeDao.insertStoreBoard(sqlSession,at,s);
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
		return storeDao.selectStoreBoard(sqlSession, spNo);
	}

	@Override
	public int insertStoreCart(Store s, Cart cart) {
		if(storeDao.checkStoreCart(sqlSession,s,cart)==0) {
			
			//System.out.println("서비스 데이터 값 INSERT :"+storeDao.insertStoreCart(sqlSession,s,cart));
			return storeDao.insertStoreCart(sqlSession,s,cart);
		}else {
			//System.out.println("UPDATE: "+storeDao.updateStoreCart(sqlSession,cart) );
			return storeDao.updateStoreCart(sqlSession,cart);
	}
	}
	@Override
	public int insertOrderNo(Order order) {
		//주문번호만들기 성고하면 주문페이지로 이동
		return	storeDao.createOrderNo(sqlSession,order);
	}
	@Override
	public int deleteCart(Cart cart) {
		return storeDao.deleteStoreCart(sqlSession,cart);
	}


	@Override
	public ArrayList<Cart> selectStoreCart (Store s,Cart cart) {
		return storeDao.selectStoreCart(sqlSession,s,cart);
	}

	@Override
	public int OrderInformation(Order order, Store s) {
		
		return storeDao.OrderInformation(sqlSession,order,s);
	}

	



}
