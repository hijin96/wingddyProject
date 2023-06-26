package com.kh.wingddy.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wingddy.member.model.dao.MemberDao;

@Service
public class KakaoServiceImpl implements KakaoService {

	@Autowired
	private MemberDao memberDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	private URL url = null;
	private HttpURLConnection urlConnection = null;
	private BufferedWriter bw = null;
	private BufferedReader br = null;
	private StringBuilder sb = null;
	private JSONParser parser;
	private JSONObject element;
	
	@Override
	public String getKakaoToken(String code) throws IOException {
		
		String kakaoUrl = "https://kauth.kakao.com/oauth/token";
		String accessToken = null;
		try {
			url = new URL(kakaoUrl);
			urlConnection = (HttpURLConnection)url.openConnection();
			
			urlConnection.setRequestMethod("POST");
			urlConnection.setDoOutput(true);
			
			bw = new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
			sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=af6d74bf8700ecc5864ca816dbce8bee");
			sb.append("&redirect_uri=http://localhost:8007/wingddy/kakaoLogin.me");
			sb.append("&code=" + code);
			
			bw.write(sb.toString());
			bw.flush();
			
			//System.out.println(urlConnection.getResponseCode());
			
			br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			String line = "";
			String responseData = "";
			while((line = br.readLine()) != null) {
				responseData += line;
			}
			
			//System.out.println(responseData);
			
			parser = new JSONParser();
			element = (JSONObject)parser.parse(responseData);
			
			accessToken = element.get("access_token").toString();
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} finally {
			
			bw.close();
			br.close();
		}
		
		System.out.println(accessToken);
		return accessToken;
	}

	@Override
	public Map<String, Object> getUserInfo(String accessToken) throws IOException {
		
		String kakaoUrl = "https://kapi.kakao.com/v2/user/me";
		Map<String, Object> result = new HashMap();
		
		try {
			url = new URL(kakaoUrl);
			urlConnection = (HttpURLConnection)url.openConnection();
			
			urlConnection.setRequestMethod("POST");
			urlConnection.setRequestProperty("Authorization", "Bearer " + accessToken);
			
			System.out.println("상태코드 : " + urlConnection.getResponseCode());
			
			br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			String line = "";
			String responseData = "";
			while((line = br.readLine()) != null) {
				responseData += line;
			}
			
			System.out.println("responseData : " + responseData);
			
			JSONObject responseObj = (JSONObject)new JSONParser().parse(responseData);
			JSONObject kakaoAccountObj = (JSONObject)responseObj.get("kakao_account");
			JSONObject profileObj = (JSONObject)kakaoAccountObj.get("profile");
			
			String id = responseObj.get("id").toString();
			String email = kakaoAccountObj.get("email").toString();
			String profileUrl = profileObj.get("profile_image_url").toString();
			System.out.println(id);
			System.out.println(email);
			System.out.println(profileUrl);
			
			result.put("id", id);
			result.put("email", email);
			result.put("profileUrl", profileUrl);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} finally {
			br.close();
		}
		
		return result;
	}

	@Override
	public String logoutKakaoAdminKey(String memberId) throws IOException {

		String kakaoUrl = "https://kapi.kakao.com/v1/user/logout";
		String adminKey = "0f4ccb72fe53a170e5cd34928f2e8e78";
		String id = null;
		try {
			System.out.println("??");
			url = new URL(kakaoUrl);
			urlConnection = (HttpURLConnection)url.openConnection();
			
			urlConnection.setRequestMethod("POST");
			urlConnection.setRequestProperty("Authorization", "KakaoAK " + adminKey);
			
			urlConnection.setDoOutput(true);
			
			bw = new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
			sb = new StringBuilder();
			sb.append("target_id_type=user_id");
			sb.append("&target_id=" + memberId);
			
			bw.write(sb.toString());
			bw.flush();
			System.out.println("로그아웃 상태코드 : " + urlConnection.getResponseCode());
			br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			
			String line = "";
			String responseData = "";
			while((line = br.readLine()) != null) {
				responseData += line;
			}
			
			System.out.println("결과 값" + responseData);
			
			JSONObject responseObj = (JSONObject)new JSONParser().parse(responseData);
			id = responseObj.get("id").toString();
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} finally {
			br.close();
			bw.close();
		}
		
		return id;
	}

	@Override
	public String dropKakaoMember(String memberId) throws IOException {
		
		String kakaoUrl = "https://kapi.kakao.com/v1/user/unlink";
		String adminKey = "0f4ccb72fe53a170e5cd34928f2e8e78";
		String id = null;
		
		try {
			url = new URL(kakaoUrl);
			urlConnection = (HttpURLConnection)url.openConnection();
			
			urlConnection.setRequestMethod("POST");
			urlConnection.setRequestProperty("Authorization", "KakaoAK " + adminKey);
			
			urlConnection.setDoOutput(true);
			
			bw = new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
			sb = new StringBuilder();
			sb.append("target_id_type=user_id");
			sb.append("&target_id=" + memberId);
			
			bw.write(sb.toString());
			bw.flush();
			System.out.println("로그아웃 상태코드 : " + urlConnection.getResponseCode());
			br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			
			String line = "";
			String responseData = "";
			while((line = br.readLine()) != null) {
				responseData += line;
			}
			
			System.out.println("결과 값" + responseData);
			
			JSONObject responseObj = (JSONObject)new JSONParser().parse(responseData);
			id = responseObj.get("id").toString();
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} finally {
			br.close();
			bw.close();
		}
		
		return id;
	}

	
	@Override
	public String logoutKakao() throws IOException {

		String restKey = "af6d74bf8700ecc5864ca816dbce8bee";
		String kakaoUrl = "https://kauth.kakao.com/oauth/logout?client_id=" + restKey ;
			   kakaoUrl += "&logout_redirect_uri=http://localhost:8007/wingddy/";
		String responseData = null;
		try {
			url = new URL(kakaoUrl);
			urlConnection = (HttpURLConnection)url.openConnection();
			
			urlConnection.setRequestMethod("GET");
			
			br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			
			String line = "";
			responseData = "";
			while((line = br.readLine()) != null) {
				responseData += line;
			}
			
			System.out.println("로그아웃 : " + responseData);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			br.close();
		}
		
		return responseData;
	}

	
	
}
