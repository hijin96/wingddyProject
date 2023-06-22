package com.kh.wingddy.store.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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
	public int insertOrderNo(Order order) {
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

	//클라이언트의 요청이나 서버의 응답에 포함되어 부가적인 정보를 담고 있음
	private HttpHeaders  getHeaders() {
		HttpHeaders httpHeaders = new HttpHeaders();
		String auth = "KakaoAK" + admin_Key;
		httpHeaders.set("Authorization","KakaoAK" + auth);
		httpHeaders.set("Content-type","application/x-www-form-urlencoded;charset=utf-8");
		
		return httpHeaders;
	}
	
	
	@Override
	public KakaopayReadyResponse kakaoPayReady() {
		//스프링 내장 인터페이스  -> 여러값을 저장하는 맵 인터페이스
		//MultiValueMap의 put은 value값에 List를  요구함 => 만들어진 List를 인자로 한 번에 줄 수 있음.
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
		parameters.add("cid", "cid");
		parameters.add("partner_order_id", "가맹점 주문 번호");
		parameters.add("partner_user_id","가맹점 회원 id");
		parameters.add("item_name", "상품명");
		parameters.add("quantity","상품 수량");
		parameters.add("total_amount", "상품총액");
		parameters.add("tax_free_amount", "상품 비과세금액");
		parameters.add("approval_url", "http://localhost:8007/wingddy/success"); //결제성공
		parameters.add("fail_url", "http://localhost:8007/wingddy/fail"); //결제 실패
		parameters.add("cancel_url", "http://localhost:8007/wingddy/cancel"); //결제 취소
		
		//파라미터 , 헤더 -> requst로 담은것 
		HttpEntity<MultiValueMap<String, String>> requestEntity =  new HttpEntity<>(parameters,this.getHeaders());
		
		//외부에 요청 url보내기 RestTemplate ->spring3.0부터 지원하며 Http서버와 통신을 명확하게 하는 RestFul api (RESTful API는 두 컴퓨터 시스템이 인터넷을 통해 정보를 안전하게 교환하기 위해 사용하는 인터페이스)
		RestTemplate restTemplate = new RestTemplate();
		
		kakaoReady = restTemplate.postForObject(
				"https://kapi.kakao.com/v1/payment/ready", 
				requestEntity, 
				KakaopayReadyResponse.class);
		
		return  kakaoReady;
	}

	@Override
	public KakaoApproveResponse ApproveResponse(String pgToken) {
		MultiValueMap<String,String> parameters  = new LinkedMultiValueMap<>();
		parameters.add("cid", cid);
		parameters.add("tid", kakaoReady.getTid());
		parameters.add("partner_order_id", "가맹점 주문 번호 ");
        parameters.add("partner_user_id", "가맹점 회원 ID");
        parameters.add("pg_token",pgToken);
        RestTemplate resTemplate = new RestTemplate();
        HttpEntity<MultiValueMap<String, String>> requEntity = new HttpEntity<MultiValueMap<String,String>>(parameters,this.getHeaders());
        RestTemplate restTemplate = new RestTemplate();
        KakaoApproveResponse approveResponse  = restTemplate.postForObject("https://kapi.kakao.com/v1/payment/approve", 
												        					requEntity,
												        					KakaoApproveResponse.class);
		return approveResponse;
	}

	@Override
	public KakaoPayAmount PayAmount() {
		// TODO Auto-generated method stub
		return null;
	}
	
	//구매하기 페이지에서 구매할 목록만 가져가기
	@Override
	public ArrayList<Cart> buyCartSelect(String[] cartNo) {
		
		return storeDao.buyCartSelect(sqlSession,cartNo);
	}


	



}
