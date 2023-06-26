package com.kh.wingddy.store.model.service;

import com.kh.wingddy.store.model.vo.KakaoApproveResponse;
import com.kh.wingddy.store.model.vo.KakaoPayAmount;
import com.kh.wingddy.store.model.vo.KakaopayReadyResponse;

public interface KakaoPayService {
	static final String cid = "TC0ONETIME";
	public static final String admin_Key ="${580c0648b175b72fe78aeff8d208161e}";
	  
	
	 //결제(insert)
		KakaopayReadyResponse kakaoPayReady();
		
		KakaoApproveResponse ApproveResponse(String pgToken); 
		
		KakaoPayAmount PayAmount();

}
