package com.kh.wingddy.store.model.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh.wingddy.store.model.vo.KakaoApproveResponse;
import com.kh.wingddy.store.model.vo.KakaoPayAmount;
import com.kh.wingddy.store.model.vo.KakaopayReadyResponse;

@Service
public class KakaoPayServiceImpl implements KakaoPayService {
	
	public static final String admin_Key ="${580c0648b175b72fe78aeff8d208161e}";
	public static final String cid="TC0ONETIME";
	private KakaopayReadyResponse kakaoReady;

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

}
