package com.kh.wingddy.store.model.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

import com.kh.wingddy.common.model.vo.Attachment;
import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.store.model.vo.Cart;
import com.kh.wingddy.store.model.vo.KakaoApproveResponse;
import com.kh.wingddy.store.model.vo.KakaoPayAmount;
import com.kh.wingddy.store.model.vo.KakaopayReadyResponse;
import com.kh.wingddy.store.model.vo.Order;
import com.kh.wingddy.store.model.vo.Store;

public interface StoreService {
	
	//게시글 총 개수 조회
	int selectListCount();
	//게시글 리스트 조회
	ArrayList<Store> selectList(PageInfo pageInfo);
	//조회수 증가하면 글보기 성공
	int inceraseCount(int spNo);
	//게시글 작성하기
	int insertStoreBoard(Store s,Attachment at);
	//썸네일 번호 생성
	int createFileNo();
	//게시글 수정하기
	int updateStoreBoard(int spNo);
	//게시글 삭제하기
	int deltetStoreBoard(int spNo);
	//게시글 상세보기
	Store selectStoreBoard(int spNo);
	//장바구니추가
	int insertStoreCart(Cart cart);
	//장바구니 목록보기
	ArrayList<Cart> selectStoreCart(int MemberNo);
	//구매하기 페이지에서 구매할 목록만 가져가기
	ArrayList<Cart> buyCartSelect(String[] cartNo);

	
	//장바구니 삭제
	int deleteCart(Cart cart);
	//구매하기페이지 
	int createOrderNo(Order order);
	//구매정보등록
	int OrderInformation(Order order);
	
	//위시리스트 추가 및 삭제
	//댓글리스트 조회
	//댓글 작성하기 
	//댓글 수정하기
	//댓글 삭제하기
	
	//위시리스트 목록보기
	
	//결제완료
	int storeBuySuccess(Order order);
	int checkedOrderNo();
	int orderAllSuccess(Order order);
	
	int orderSuccessUpdateCart(ArrayList<HashMap<String, Object>> list);
	int orderCartUpdate(ArrayList<HashMap<String, Object>> listAll);
	
	
	
	

}
