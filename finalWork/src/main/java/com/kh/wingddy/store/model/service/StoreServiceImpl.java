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
import com.kh.wingddy.store.model.vo.Review;
import com.kh.wingddy.store.model.vo.Store;
import com.kh.wingddy.store.model.vo.Wish;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreDao storeDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	public static final String admin_Key = "${580c0648b175b72fe78aeff8d208161e}";
	public static final String cid = "TC0ONETIME";
	private KakaopayReadyResponse kakaoReady;

	// 게시글목록조회 -1
	@Override
	public int selectListCount() {
		return storeDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Store> selectList(PageInfo pageInfo) {

		return storeDao.selectList(sqlSession, pageInfo);
	}

	@Override
	public int inceraseCount(int spNo) {
		return storeDao.inceraseCount(sqlSession, spNo);
	}

	// 썸네일 번호 생성
	@Override
	public int createFileNo() {
		return storeDao.createFileNo(sqlSession);
	}

	// 게시글 등록
	@Override
	public int insertStoreBoard(Store s, Attachment at) {
		// TODO Auto-generated method stub
		return storeDao.insertStoreBoard(sqlSession, at, s);
	}
	//게시글* 썸네일 수정
	@Override
	public int updateStoreBoardAll(Store s,Attachment at) {
		
		return storeDao.updateStoreBoardAll(sqlSession,s,at);
	}
	//게시글만 수정
	@Override
	public int updateStoreBoard(Store s) {
		return storeDao.updateStoreBoard(sqlSession,s);
	}

	//썸네일 수정
	@Override
	public int updateFile(Attachment at) {
		return storeDao.updateFile(sqlSession,at);
	}
	
	@Override
	public int deleteStoreBoard(int spNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Store selectStoreBoard(int spNo) {
		return storeDao.selectStoreBoard(sqlSession, spNo);
	}

	@Override
	public int insertStoreCart(Cart cart) {
		if (storeDao.checkStoreCart(sqlSession, cart) == 0) {

			// System.out.println("서비스 데이터 값 INSERT
			// :"+storeDao.insertStoreCart(sqlSession,s,cart));
			return storeDao.insertStoreCart(sqlSession, cart);
		} else {
			// System.out.println("UPDATE: "+storeDao.updateStoreCart(sqlSession,cart) );
			return storeDao.updateStoreCart(sqlSession, cart);
		}
	}

	// 구매하기페이지
	@Override
	public int createOrderNo() {
		// 주문번호만들기 성고하면 주문페이지로 이동
		return storeDao.createOrderNo(sqlSession);
	}

	@Override
	public int deleteCart(HashMap<String, Object> map) {
		return storeDao.deleteStoreCart(sqlSession, map);
	}

	// 장바구니 목록보기
	@Override
	public ArrayList<Cart> selectStoreCart(int MemberNo) {
		ArrayList<Cart> list = storeDao.selectStoreCart(sqlSession, MemberNo);
		// System.out.println("서비스 result : " + list);
		return list;
	}

	// 체크박스로 장바구니 삭제
	@Override
	public int CheckBoxCartDelete(HashMap<String, Object> map) {

		return storeDao.CheckBoxCartDelete(sqlSession, map);
	}

	@Override
	public int OrderInformation(Order order) {

		return storeDao.OrderInformation(sqlSession, order);
	}

	// 구매하기 페이지에서 구매할 목록만 가져가기
	@Override
	public ArrayList<Cart> buyCartSelect(String[] cartNo) {

		return storeDao.buyCartSelect(sqlSession, cartNo);
	}

	// 구매번호 조회
	@Override
	public int checkedOrderNo() {
		return storeDao.checkedOrderNo(sqlSession);
	}

	@Override
	public int storeBuySuccess(Order order) {
		int success = storeDao.storeBuySuccess(sqlSession, order);
		System.out.println("서비스: " + success);
		return success;
	}

	// 구매완료하기
	@Override
	public int orderSuccessUpdateCart(HashMap<String, Object> map) {
		int success = storeDao.orderSuccessUpdateCart(sqlSession, map);
		System.out.println("서비스orderSuccessUpdateCart: " + success);
		return success;
	}

	@Override
	public int orderAllSuccess(Order order) {
		// TODO Auto-generated method stub
		return storeDao.orderAllSuccess(sqlSession, order);
	}


	// 위시리스트체크
	@Override
	public int checkWishList(HashMap<String, Object> map) {
		if (storeDao.checkWishList(sqlSession, map) == 0) {
			return storeDao.wishListInsert(sqlSession, map);
		} else {
			return 0;
		}

		// return storeDao.checkWishList(sqlSession,map);
	}

	// 위시리스트 목록
	@Override
	public ArrayList<Wish> wishList(int memberNo) {
	
		return storeDao.wishList(sqlSession,memberNo);
	}
	//위시리스트 ajax삭제
	@Override
	public int WishListDelete(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return storeDao.wishListDelete(sqlSession,map);
	}
	//장바구니 수량수정
	@Override
	public int updateBuyCount(HashMap<String, Object> map) {
		return storeDao.updateBuyCount(sqlSession,map);
	}

	@Override
	public ArrayList<Cart> orderList(int memberNo) {
		// TODO Auto-generated method stub
		return storeDao.selectList(sqlSession, memberNo);
	}

	//리뷰등록
	@Override
	public int insertReview(HashMap<String, Object> map) {
		if(storeDao.checkBuyUser(sqlSession, map) >0) {
		return storeDao.insertReview(sqlSession,map);
		}
		return 0;
	}
	//Review리스트
	@Override
	public ArrayList<Review> selectReviewList(int spNo) {
		return storeDao.selectReviewList(sqlSession,spNo);
	}
	//검색개수세기
	@Override
	public int selectSearchCount(String keyword) {
		return storeDao.selectSearchCount(sqlSession,keyword);
	}

	//상품검색하기
	@Override
	public ArrayList<Store> selectSearchList(String keyword, PageInfo pageInfo) {
		return storeDao.selectSearchList(sqlSession,keyword,pageInfo);
	}



}
