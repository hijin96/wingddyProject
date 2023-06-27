package com.kh.wingddy.member.model.service;

import java.io.IOException;
import java.util.Map;

public interface KakaoService {

	public String getKakaoToken(String code) throws IOException;
	
	public Map<String, Object> getUserInfo(String accessToken) throws IOException;
	
	/**
	 * adminKey 카카오 로그아웃
	 * @param memberId
	 * @return 로그아웃 계정 아이디
	 * @throws IOException
	 */
	public String logoutKakaoAdminKey(String memberId) throws IOException;
	
	//public String dropKakaoMember(String memberId) throws IOException;
	
	public String logoutKakao() throws IOException;
}
