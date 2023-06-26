package com.kh.wingddy.store.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.wingddy.store.model.service.KakaoPayService;
import com.kh.wingddy.store.model.vo.KakaoApproveResponse;
import com.kh.wingddy.store.model.vo.KakaopayReadyResponse;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/payment")
@RequiredArgsConstructor
public class KakaoPayController {

	private final KakaoPayService kakaoPayService;
	public static final String admin_Key ="${580c0648b175b72fe78aeff8d208161e}";
	//카카오페이 결제-  요청하기
		@PostMapping("/ready")
		public KakaopayReadyResponse readyToKakaoPay() throws IOException {
			/*
			 * URL url = new URL("https://kapi.kakao.com/v1"); HttpsURLConnection
			 * urlConnetion = (HttpsURLConnection)url.openConnection();
			 * urlConnetion.setRequestMethod("post");
			 * urlConnetion.setRequestProperty("Authorization",admin_Key);
			 * urlConnetion.setRequestProperty("Content-type",
			 * "application/x-www-form-urlencoded;charset=utf-8");
			 */
			
			return kakaoPayService.kakaoPayReady();
			
			
		}
		//카카오페이 결제-  성공
		@GetMapping("/success")
		public ResponseEntity afterPay(@RequestParam("pg_token") String pgToken) {
			KakaoApproveResponse kakaoApprove = kakaoPayService.ApproveResponse(pgToken);
			return new ResponseEntity<>(kakaoApprove, HttpStatus.OK);
		}
		

	

}
