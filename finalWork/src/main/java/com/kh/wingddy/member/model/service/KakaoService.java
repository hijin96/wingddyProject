package com.kh.wingddy.member.model.service;

import java.io.IOException;
import java.util.Map;

public interface KakaoService {

	public String getKakaoToken(String code) throws IOException;
	
	public Map<String, Object> getUserInfo(String accessToken) throws IOException;
}
