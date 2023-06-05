package com.kh.wingddy.store.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;


import com.kh.wingddy.common.model.vo.Attachment;
import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.common.template.Pageination;
import com.kh.wingddy.common.template.RenameFile;
import com.kh.wingddy.store.model.service.StoreService;
import com.kh.wingddy.store.model.vo.Store;
import com.sun.media.jfxmedia.events.NewFrameEvent;

import jdk.nashorn.internal.ir.annotations.Reference;
import sun.security.util.Length;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;
	
	//메인페이지
	@GetMapping("storemain")
	public ModelAndView storeMain(@RequestParam(value = "cPage") int currentPage, ModelAndView mv) {

		PageInfo pageInfo = Pageination.getPageInfo(storeService.selectListCount(), currentPage, 9, 5);
		ArrayList<Store> goodsList = storeService.selectList(pageInfo);
		mv.addObject("goodsList", goodsList);
		mv.setViewName("store/storemain");
		return mv;
	}
	
	//게시판 글 상세보기
	@RequestMapping("storedetail")
	public String storeDetail() {
		return "store/storedetail";
	}
	//장바구니
	@RequestMapping("storecart")
	public String storeCart() {
		return "store/storecart";
	}
	//구매하기
	@RequestMapping("storebuy")
	public String storebuy() {
		return "store/storebuy";
	}
	//위시리스트
	@RequestMapping("storewish")
	public String storewish() {
		return "store/storewishlist";
	}
	//주문정보
	@RequestMapping("shoppinglist")
	public String storeShoppingList() {
		return "store/storeShoppingList";
	}
	//주문정보 상세보기
	@RequestMapping("orderInfo")
	public String orderInfo() {
		return "store/orderInfo";
	}
	//게시판 글쓰기 -1
	@RequestMapping("storeInsert")
	public String storeInsert() {
		return "store/storeInsertEnrollForm";
	}
	//게시판 글등록
//	@RequestMapping("insertstore.do")
//	public String insertStore() {
//		return "store/storemain";
//	}
	//게시판글쓰기 -2(ck에디터사용)
	@RequestMapping("storeWriter")
	public String storeWriter() {
		return "store/storeWriter";
	}
	//게시판 글등록하기 -2
	@RequestMapping(value="insertstore.do",  produces="application/json;charset-8")
	public String storeWriterInsert(Store s, MultipartFile upfile,HttpSession session, ModelAndView mv) {
		
		
		ArrayList<Attachment>list = new ArrayList();
		for(int i = 0; i<=list.size(); i++ ) {
			if(!upfile.getOriginalFilename().contentEquals("")) {
				String originName = upfile.getOriginalFilename();
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				int ranNum = (int)(Math.random()*9000+1000);
				String ext = originName.substring(originName.lastIndexOf("."));
				String changeName = currentTime + ranNum + ext;
				String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
			//	String uploadPath = "./resources/uploadFiles/"+changeName;
				try {
					upfile.transferTo(new File(savePath+ changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				System.out.println("파일들어가?"+upfile);
				Attachment at = new Attachment();
				at.setOriginName(upfile.getOriginalFilename());
				at.setChangeName("/resources/uploadFiles/");
			}
		}
		
		
		mv.addObject("uploaded",true);
		//mv.addObject("url",uploadPath);
		return "store/storemain";
	}
	
	
	
}
