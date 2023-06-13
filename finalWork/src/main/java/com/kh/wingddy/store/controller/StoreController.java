package com.kh.wingddy.store.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.wingddy.common.model.vo.Attachment;
import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.common.template.Pageination;
import com.kh.wingddy.common.template.RenameFile;
import com.kh.wingddy.member.model.vo.Member;
import com.kh.wingddy.store.model.service.StoreService;
import com.kh.wingddy.store.model.vo.Cart;
import com.kh.wingddy.store.model.vo.Store;
import com.sun.media.jfxmedia.events.NewFrameEvent;

import jdk.nashorn.internal.ir.annotations.Reference;
import sun.security.util.Length;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;

	private RenameFile rename = new RenameFile();

	// private Attachment at = new Attachment();

	// 메인페이지
	@RequestMapping("storemain")
	public String storeMain(@RequestParam(value = "cPage", defaultValue = "1") int currentPage, Model m,
			Attachment at) {
		PageInfo pageInfo = Pageination.getPageInfo(storeService.selectListCount(), currentPage, 9, 5);
		// at.setMemerNo(at.getMemerNo());

		m.addAttribute("pageInfo", pageInfo);
		m.addAttribute("goodsList", storeService.selectList(pageInfo));

		// System.out.println("게시판리스트: " +storeService.selectList(pageInfo) );
		return "store/storemain";
	}

	// 게시판 글 상세보기
	@RequestMapping("storedetail")
	public ModelAndView storeDetail(int spNo, ModelAndView mv) {
		if (storeService.inceraseCount(spNo) > 0) {
			mv.addObject("s", storeService.selectStoreBoard(spNo)).setViewName("store/storedetail");

		} else {
			mv.addObject("errorMsg", "게시글조회실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 장바구니페이지이동
	@RequestMapping("storecart")
	public String storeCart(Store s) {
		// 장바구니 페이지 들어오면 구매하기 넘어가기 전에 구매번호랑 장바구니 번호 가지고 들어가야함!
		// 장바구니 페이지 들어올때 detail에서 (구매수량, 상품번호,주문완료여부, 장바구니번호 )필요한 정보들 받아오기

		return "store/storecart";
	}

	// 장바구니 ajax
	@ResponseBody
	@RequestMapping(value = "storecart.do", produces = "application/json;charset-8")
	public String ajaxStoreCart(Store s,Cart cart, HttpSession session) {
		Member m = ((Member) session.getAttribute("loginUser"));
		return new Gson().toJson(storeService.insertStoreCart(s,cart));
	}

	// 구매하기-> 주문하기 번호 미리 만들기
	@RequestMapping("storebuy")
	public String storebuy() {
		// 주문번호 inputhidden으로 가지고있다가 주문이 완료되면 update해주기
		return "store/storebuy";
	}

	// 위시리스트
	@RequestMapping("storewish")
	public String storewish() {
		return "store/storewishlist";
	}

	// 주문정보
	@RequestMapping("shoppinglist")
	public String storeShoppingList() {
		return "store/storeShoppingList";
	}

	// 주문정보 상세보기
	@RequestMapping("orderInfo")
	public String orderInfo() {
		return "store/orderInfo";
	}

	// 게시판 글쓰기 -1
	@RequestMapping("storeInsert")
	public String storeInsert1212() {
		return "store/storeInsertEnrollForm";
	}
	// 게시판 글쓰기 ajax
//	@RequestMapping("storeWriter1")
//	public String sample() {
//		return "store/storeWriter2";
//	}

	// 게시판 글쓰기 최종
	@RequestMapping("storeWriter")
	public ModelAndView storeInsert(ModelAndView mv) {
		Store s = new Store();
		s.setFileNo(storeService.createFileNo());
		int fileNo = storeService.createFileNo();
		// mv.addObject(fileNo);
		mv.addObject("fileNo", fileNo);
		mv.setViewName("store/storeWriter");

		return mv;
	}
	// 게시판글쓰기 -2(ck에디터사용)
	/*
	 * @ResponseBody
	 * 
	 * @PostMapping("insertstore.do") public String insertStoreBoard(@RequestParam
	 * HashMap<String, Object> jsonstore,HttpSession session,HttpServletRequest
	 * request,MultipartFile upfile) { System.out.println("스토어정보:  "+jsonstore);
	 * storeService.insertStoreText(jsonstore); //String spName = Attachment at =
	 * new Attachment();
	 * 
	 * at.setOriginName(upfile.getOriginalFilename());
	 * at.setChangeName(rename.fileName(upfile, session));
	 * System.out.println("at에 담긴것: "+at);
	 * 
	 * if(storeService.insertStoreText(jsonstore)>0) {
	 * 
	 * System.out.println("게시글 작성 성공");
	 * 
	 * 
	 * }return "redirect:storemain";
	 * 
	 */

	@RequestMapping("insertstore.do")
	public String insertStoreBoard(Store s, MultipartFile upfile, HttpSession session, Model model) {
		// HashMap<String, Object> map = new HashMap<String, Object>();
		Member m = ((Member) session.getAttribute("loginUser"));
		Attachment at = new Attachment();
		at.setOriginName(upfile.getOriginalFilename());
		at.setChangeName(rename.fileName(upfile, session));
		at.setFilePath("resources/uploadFiles/");
		at.setFileNo(s.getFileNo());
		at.setMemberNo(m.getMemberNo());
		if (storeService.insertStoreBoard(s, at) > 0) {
			System.out.println("게시글 작성 성공");
			return "redirect:storemain";
		} else {
			model.addAttribute("errorMsg", "게시글작성실패");
			return "common/errorPage";
		}
	}

//ATTACHMENT 랑 STORE를 MAP에 담아서 mapper에서 한번에 insert하는것에 어려움 느낌
	// JSP에 담긴 값들이 Object타입이라 controller에서 받아오는 타입에 어려움 느낌

	@ResponseBody
	@PostMapping(value = "/resources/uploadFiles", produces = "application/json;charset-8")
	public String storeWriterInsert(HttpServletRequest request, MultipartHttpServletRequest multirequest,
			ModelAndView mv) throws Exception {

		MultipartFile upfile = multirequest.getFile("upload");
		PrintWriter printWriter = null;

		// 파일 원래이름
		String originName = upfile.getOriginalFilename();
		// 현재시간
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		// 랜덤값
		int ranNum = (int) (Math.random() * 9000 + 1000);
		// 확장자명
		String ext = originName.substring(originName.lastIndexOf("."));
		// 이름바꾸기
		String changeName = currentTime + ranNum + ext;
		// 이미지를 현재 경로와 연관된 파일에 저장하기 위해 현재 경로를 알아냄
		String realPath = multirequest.getServletContext().getRealPath("/");
		// 현재 저장경로
		String savePath = realPath + "resources/uploadFiles/" + changeName;
		String uploadPath = "./resources/uploadFiles/" + changeName;
		upfile.transferTo(new File(savePath));
		mv.addObject("uploaded", true);
		mv.addObject("url", uploadPath);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("uploaded", true);
		map.put("url", uploadPath);

		// CK에디터 등록하기 위해서 JSON으로 리턴하는것에 어려움을 느꼈음.
		// 경로 지정하는것 어려워했음 ㅠ
		// JSON이 버전에 따라 사용법이 다름
		return new Gson().toJson(map);

	}
}
