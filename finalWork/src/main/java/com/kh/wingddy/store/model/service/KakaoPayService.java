package com.kh.wingddy.store.model.service;

import com.kh.wingddy.store.model.vo.KakaoApproveResponse;
import com.kh.wingddy.store.model.vo.KakaoPayAmount;
import com.kh.wingddy.store.model.vo.KakaopayReadyResponse;

public interface KakaoPayService {
	//결제(insert)
		KakaopayReadyResponse kakaoPayReady();
		
		KakaoApproveResponse ApproveResponse(String pgToken); 
		
		KakaoPayAmount PayAmount();

}
