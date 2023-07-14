package com.kh.wingddy.store.model.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

import com.google.gson.JsonElement;
import com.kh.wingddy.common.model.vo.Attachment;
import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.store.model.vo.Cart;
import com.kh.wingddy.store.model.vo.KakaoApproveResponse;
import com.kh.wingddy.store.model.vo.KakaoPayAmount;
import com.kh.wingddy.store.model.vo.KakaopayReadyResponse;
import com.kh.wingddy.store.model.vo.Order;
import com.kh.wingddy.store.model.vo.Review;
import com.kh.wingddy.store.model.vo.Store;
import com.kh.wingddy.store.model.vo.Wish;

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
	int updateStoreBoardAll(Store s,Attachment at);
	//게시글 삭제하기
	int deleteStoreBoard(int spNo);
	//게시글 상세보기
	Store selectStoreBoard(int spNo);
	//장바구니추가
	int insertStoreCart(Cart cart);
	//장바구니 목록보기
	ArrayList<Cart> selectStoreCart(int MemberNo);
	//구매하기 페이지에서 구매할 목록만 가져가기
	ArrayList<Cart> buyCartSelect(String[] cartNo);

	
	//장바구니 삭제ajax
	int deleteCart(HashMap<String, Object> map);
	//구매하기페이지 
	int createOrderNo();
	//구매정보등록
	int OrderInformation(Order order);
	
	//위시리스트 추가 및 삭제
	//댓글리스트 조회
	ArrayList<Review> selectReviewList(int spNo);
	//댓글 작성하기 
	int insertReview(HashMap<String, Object> map);
	//댓글 수정하기
	//댓글 삭제하기
	
	//위시리스트 목록보기
	
	//결제완료
	int storeBuySuccess(Order order);
	int checkedOrderNo();
	int orderAllSuccess(Order order);
	
	int orderSuccessUpdateCart(HashMap<String, Object> map);
	int CheckBoxCartDelete(HashMap<String, Object> map);
	//위시리스트 추가
	//int wishListInsert(HashMap<String, Object> map);
	ArrayList<Wish> wishList(int memberNo);
	int checkWishList(HashMap<String, Object> map);
	int WishListDelete(HashMap<String, Object> map);
	int updateBuyCount(HashMap<String, Object> map);
	ArrayList<Cart> orderList(int memberNo);
	//검색개수 세기
	int selectSearchCount(String keyword);
	//검색목록조회
	ArrayList<Store> selectSearchList(String keyword, PageInfo pageInfo);
	//썸네일수정
	int updateFile( Attachment at);
	//게시글만 수정
	int updateStoreBoard(Store s);
	
	
	
	

	
	
	
	

}
