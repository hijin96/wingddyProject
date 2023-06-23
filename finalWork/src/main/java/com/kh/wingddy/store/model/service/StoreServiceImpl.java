package com.kh.wingddy.store.model.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh.wingddy.common.model.vo.Attachment;
import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.store.model.dao.StoreDao;
import com.kh.wingddy.store.model.vo.Cart;
import com.kh.wingddy.store.model.vo.KakaoApproveResponse;
import com.kh.wingddy.store.model.vo.KakaoPayAmount;
import com.kh.wingddy.store.model.vo.KakaopayReadyResponse;
import com.kh.wingddy.store.model.vo.Order;
import com.kh.wingddy.store.model.vo.Store;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDao storeDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public static final String admin_Key ="${580c0648b175b72fe78aeff8d208161e}";
	public static final String cid="TC0ONETIME";
	private KakaopayReadyResponse kakaoReady;
	
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
	public int insertStoreCart(Cart cart) {
		if(storeDao.checkStoreCart(sqlSession,cart)==0) {
			
			//System.out.println("서비스 데이터 값 INSERT :"+storeDao.insertStoreCart(sqlSession,s,cart));
			return storeDao.insertStoreCart(sqlSession,cart);
		}else {
			//System.out.println("UPDATE: "+storeDao.updateStoreCart(sqlSession,cart) );
			return storeDao.updateStoreCart(sqlSession,cart);
	}
	}
	//구매하기페이지 
	@Override
	public int createOrderNo(Order order) {
		//주문번호만들기 성고하면 주문페이지로 이동
		return	storeDao.createOrderNo(sqlSession,order);
	}
	@Override
	public int deleteCart(Cart cart) {
		return storeDao.deleteStoreCart(sqlSession,cart);
	}

	//장바구니 목록보기
	@Override
	public ArrayList<Cart> selectStoreCart (int MemberNo) {
		ArrayList<Cart> list = storeDao.selectStoreCart(sqlSession,MemberNo);
		//System.out.println("서비스 result : " + list);
		return list;
	}

	@Override
	public int OrderInformation(Order order) {
		
		return storeDao.OrderInformation(sqlSession,order);
	}


	
	//구매하기 페이지에서 구매할 목록만 가져가기
	@Override
	public ArrayList<Cart> buyCartSelect(String[] cartNo) {
		
		return storeDao.buyCartSelect(sqlSession,cartNo);
	}
	//구매번호 조회
	@Override
	public int checkedOrderNo() {
		return storeDao.checkedOrderNo(sqlSession);
	}

	
	@Override
	public int storeBuySuccess(Order order) {
		int success =storeDao.storeBuySuccess(sqlSession,order);
		System.out.println("서비스: " + success);
		return success;
	}
	//구매완료하기 
	@Override
	public int orderSuccessUpdateCart(ArrayList<HashMap<String, Object>> list) {
		int success = storeDao.orderSuccessUpdateCart(sqlSession,list);
		System.out.println("서비스orderSuccessUpdateCart: " +success );
		return success;
	}

	@Override
	public int orderAllSuccess(Order order) {
		// TODO Auto-generated method stub
		return storeDao.orderAllSuccess(sqlSession,order);
	}
	  //map으로 가져가서 업데이트 해보기
	@Override
	public int orderCartUpdate(ArrayList<HashMap<String, Object>> listAll) {
		// TODO Auto-generated method stub
		return storeDao.orderCartUpdate(sqlSession,listAll);
	}



	



}
