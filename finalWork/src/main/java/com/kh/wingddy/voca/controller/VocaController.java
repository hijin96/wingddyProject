package com.kh.wingddy.voca.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.wingddy.member.model.vo.Member;
import com.kh.wingddy.voca.model.service.VocaService;
import com.kh.wingddy.voca.model.vo.ClassVocaBook;
import com.kh.wingddy.voca.model.vo.Voca;
import com.kh.wingddy.voca.model.vo.VocaBook;

@Controller
public class VocaController {
	
	@Autowired
	private VocaService vocaService;

	@RequestMapping("main.vc")
	public ModelAndView vocamainView(HttpSession session, ModelAndView mv) {
		
		Member m = ((Member)session.getAttribute("loginUser"));
		
		ArrayList<VocaBook> bookList = vocaService.selectVocaBookList(m.getMemberNo());
		
		ArrayList<ClassVocaBook> classBookList = vocaService.selectClassVocaBookList(m);
		
		mv.addObject("bookList", bookList)
		  .addObject("classBookList", classBookList)
		  .setViewName("voca/vocaMain");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="vocaList.vc", produces="application/json; charset=UTF-8")
	public String selectVocaList(int bookNo) {
		return new Gson().toJson(vocaService.selectVocaList(bookNo));
	}
	
	@GetMapping("insertBook.vc")
	public String insertBookView() {
		return "voca/insertBookForm";
	}
	
	@ResponseBody
	@PostMapping(value="insertBook.vc", produces="application/json; charset=UTF-8")
	public String insertBook(@RequestBody String vcList, HttpSession session) throws UnsupportedEncodingException {
		String str = URLDecoder.decode(vcList, "UTF-8");
		
		JsonObject jObj = (new JsonParser().parse("{"+ str +"}").
							getAsJsonObject()).
							get("vcList").
							getAsJsonObject();
		
		ArrayList<Voca> vlist = getVocaList(jObj);
		
		for(Voca v : vlist) {
			String en = v.getVocaEnglish().toLowerCase();
			v.setVocaEnglish(en);
		}
		
		VocaBook vb = new VocaBook();
		vb.setBookName(jObj.get("bookName").getAsString());
		vb.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		return Integer.toString(vocaService.insertVocaBook(vb, vlist));
	}
	
	@GetMapping("updateBook.vc")
	public ModelAndView updateBookView(HttpSession session, ModelAndView mv) {
		mv.
		addObject("vcList", vocaService.
				  			selectVocaBookList(((Member)session.getAttribute("loginUser")).
						  			 			getMemberNo())).
		setViewName("voca/updateBookForm");
		return mv;
	}
	
	@ResponseBody
	@PostMapping(value="updateBook.vc", produces="application/json; charset=UTF-8")
	public String updateBook(@RequestBody String vcList) throws UnsupportedEncodingException {
		String str = URLDecoder.decode(vcList, "UTF-8");
		JsonObject jObj = (new JsonParser().parse("{"+ str +"}").
							getAsJsonObject()).
							get("vcList").
							getAsJsonObject();
		
		ArrayList<Voca> vlist = getVocaList(jObj);
		
		for(Voca v : vlist) {
			String en = v.getVocaEnglish().toLowerCase();
			v.setVocaEnglish(en);
		}
		
		HashMap<String, Object> vb = new HashMap();
		vb.put("bookNo",jObj.get("bookNo").getAsInt());
		vb.put("vlist",vlist);
		return Integer.toString(vocaService.updateVocaBook(vb));
	}
	
	@RequestMapping("deleteBook.vc")
	public ModelAndView deleteBook(int bookNo, ModelAndView mv) {
		
		if(vocaService.deleteVocaBook(bookNo) > 0) {
			mv.setViewName("redirect:main.vc");
		} else {
			mv.addObject("alertMsg", "단어장 삭제에 실패하였습니다")
			  .setViewName("voca/updateBookForm");
		}
		
		return mv;
	}
	
	@ResponseBody
	@PostMapping(value="bookClassList.vc", produces="application/json; charset=UTF-8")
	public String selectBookClassList(int bookNo){
		return new Gson().toJson(vocaService.selectBookClassList(bookNo));
	}
	
	public ArrayList<Voca> getVocaList(JsonObject jObj){
		
		
		JsonArray jArr = jObj.get("value").getAsJsonArray();
		
		ArrayList<Voca> list = new ArrayList();
		for(int i = 0; i<jArr.size(); i++) {
			JsonObject obj = jArr.get(i).getAsJsonObject();
			
			Voca vc = new Voca();
			
			vc.setVocaEnglish(obj.get("vocaEnglish").getAsString());
			vc.setVocaKorean(obj.get("vocaKorean").getAsString());
			list.add(vc);
		}
		return list;
	}
	
	@RequestMapping("insertClassBook.vc")
	public ModelAndView insertClassBook(ModelAndView mv, int bookNo, int[] classNoList) {
		
		ArrayList<ClassVocaBook> cvList = new ArrayList();
		
		for(int i = 0; i < classNoList.length; i++) {
			ClassVocaBook cv = new ClassVocaBook();
			cv.setBookNo(bookNo);
			cv.setClassNo(classNoList[i]);
			cvList.add(cv);
		}
		if(classNoList[0] == 0) {
			vocaService.deleteClassBook(bookNo);
		} else {
			vocaService.insertClassBook(cvList);
		}
		mv.setViewName("redirect:main.vc");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="search.vc", produces="application/json; charset=UTF-8")
	public String searchVoca(String text, String source, String target) {
		ArrayList<Voca> list = vocaService.searchVoca(text);
		
		Voca vc = checkList(text, papgoTranslate(text, source, target), source);
		if(vc != null && vc.getVocaEnglish() != null) {
			list.add(vc);
		}
		
		return new Gson().toJson(list);
	}
	
	public String papgoTranslate(String translate, String source, String target) {
		 	String clientId = "vNSE36KCTiMxC5HtAFXt";	//애플리케이션 클라이언트 아이디값";
	        String clientSecret = "tTXCA5PsmV";			//애플리케이션 클라이언트 시크릿값";

	        String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
	        String text;
	        try {
	            text = URLEncoder.encode(translate, "UTF-8");
	        } catch (UnsupportedEncodingException e) {
	            throw new RuntimeException("인코딩 실패", e);
	        }

	        HashMap<String, String> requestHeaders = new HashMap();
	        requestHeaders.put("X-Naver-Client-Id", clientId);
	        requestHeaders.put("X-Naver-Client-Secret", clientSecret);

	        String responseBody = post(apiURL, requestHeaders, text, source, target);
	        
	        return responseBody;
	}
	
	private String post(String apiUrl, Map<String, String> requestHeaders, String text, String source, String target){
        HttpURLConnection con = connect(apiUrl);
        String postParams = "source=" + source + "&target=" + target + "&text=" + text; //원본언어: 한국어 (ko) -> 목적언어: 영어 (en)
        try {
            con.setRequestMethod("POST");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            con.setDoOutput(true);
            try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
                wr.write(postParams.getBytes());
                wr.flush();
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { 	// 정상 응답
                return readBody(con.getInputStream());
            } else {  											// 에러 응답
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }

    private HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
    
    /**
     * PAPAGO API 결과값을 Voca 객체에 담아서 리턴
     * 
     * @param text : 입력받은 검색 단어
     * @param result : API를 통해 돌아온 결과 값
     * @param source : 입력받은 단어의 언어 타입
     */
    private Voca checkList(String text, String result, String source){
    	Voca vc = null;
    	
    	JsonObject resultObj = new JsonParser().parse(result).getAsJsonObject()
									    	   .get("message").getAsJsonObject()
	    									   .get("result").getAsJsonObject();
    	
    	String engineType = resultObj.get("engineType").getAsString();
    	String transText = resultObj.get("translatedText").getAsString().replace('.',' ');
    	
    	if(engineType.equals("PRETRANS")) {
    		vc = new Voca();
    		
	    	String en = source.equals("ko") ? transText : text;
	    	String kr = source.equals("en") ? text : transText;
	    	
	    	vc.setVocaEnglish(en);
			vc.setVocaKorean(kr);
    	}
    	return vc;
    }
	
	
}
