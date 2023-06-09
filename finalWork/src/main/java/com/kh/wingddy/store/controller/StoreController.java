package com.kh.wingddy.store.controller;

import java.io.File;
import java.io.IOException;
import java.io.ObjectOutputStream.PutField;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.wingddy.common.model.vo.Attachment;
import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.common.template.Pageination;
import com.kh.wingddy.common.template.RenameFile;
import com.kh.wingddy.member.model.vo.Member;
import com.kh.wingddy.store.model.service.StoreService;
import com.kh.wingddy.store.model.vo.Store;
import com.sun.media.jfxmedia.events.NewFrameEvent;

import jdk.nashorn.internal.ir.annotations.Reference;
import sun.security.util.Length;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;

	private RenameFile rename = new RenameFile();

	 private Attachment at = new Attachment();

	// 메인페이지
	@RequestMapping("storemain")
	public String storeMain(@RequestParam(value = "cPage", defaultValue = "1") int currentPage, Model m) {
		PageInfo pageInfo = Pageination.getPageInfo(storeService.selectListCount(), currentPage, 9, 5);
		ArrayList<Store> goodsList = storeService.selectList(pageInfo);
		m.addAttribute("pageInfo", pageInfo);
		m.addAttribute("goodsList", storeService.selectList(pageInfo));
		// System.out.println(goodsList);
		return "store/storemain";
	}

	// 게시판 글 상세보기 location.href='storedetail?spNo'+$(this).text();
	@RequestMapping("storedetail")
	public ModelAndView storeDetail(int spNo,ModelAndView mv ) {
		
		if(storeService.inceraseCount(spNo)>0) {
		
			mv.addObject("s",storeService.selectStoreBoard(spNo)).setViewName("store/storedetail");
		}else {
			mv.addObject("errorMsg","조회실패").setViewName("common/error");
		}
		return mv;
	}

	// 장바구니
	@RequestMapping("storecart")
	public String storeCart() {
		
		
		return "store/storecart";
	}

	// 구매하기
	@RequestMapping("storebuy")
	public String storebuy() {
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
	public String storeInsert() {
		return "store/storeInsertEnrollForm";
	}

	// 게시판 글쓰기
	@RequestMapping("storeWriter")
	public String storeWriter() {
		return "store/storeWriter2";
	}

	// 게시판글쓰기 -2(ck에디터사용)
	
	@RequestMapping("insertstore.do")
	public String insertStoreBoard(Store s,ArrayList<Attachment>list,  MultipartFile upfile,
			HttpSession session, Model model) {
		
		Member m = ((Member)session.getAttribute("loginUser"));
		HashMap<String,Object> map = new HashMap<String,Object>();

		ArrayList<Attachment> atlist = new ArrayList();
		
		at.setOriginName(upfile.getOriginalFilename());
		at.setChangeName(rename.fileName(upfile, session));
		atlist.add(at);
		map.put("Store", s);
		map.put("Attachment", atlist);

		System.out.println("map에 담긴것"+map);
		
		storeService.insertStoreBoard(map);
		System.out.println("제발 서비스로 넘겨줘"+storeService.insertStoreBoard(map));
	
		if(storeService.insertStoreBoard(map)>0) {

		map.put(at.getChangeName(),rename);
	
		System.out.println("map"+map);
		
		ArrayList<Store> stlist = new ArrayList<Store>();
		System.out.println("LIST"+stlist);
		
		System.out.println("at"+list);
		
		System.out.println("게시글 원래 이미지" + upfile.getOriginalFilename());
		if(storeService.insertStoreBoard(list)>0) {
		String changeName = rename.fileName(upfile, session);
		// Attachment at = new Attachment();
		at.setOriginName(upfile.getOriginalFilename());
		System.out.println("UPFILE:" + upfile.getOriginalFilename());
		System.out.println("체인지:"+ at.getChangeName());
		at.setChangeName(changeName);
		at.setFileLevel(2);
		at.setFilePath("resources/uploadFiles/" + changeName);

		System.out.println("게시글 작성 성공");
		return "redirect:storemain";
	}else {
			model.addAttribute("errorMsg","게시글작성실패");
			return "common/errorPage";
		}
	}

//	@RequestMapping("storeWriter")
//	public String storeWriter() {
//		return "store/storeWriter";
//	}
	// 게시판 사진등록하기-2
//	@RequestMapping(value="resources/uploadFiles",  produces="application/json;charset-8")
//	public ArrayList<Attachment>  storeWriterInsert(MultipartRequest request,HttpSession session, ModelAndView mv) {
//	
//		
//		ArrayList<Attachment>list = new ArrayList();
//		for(int i = 0; i<=list.size(); i++ ) {
//			MultipartFile upfile = request.getFile("upload");
//				
//			if(!upfile.getOriginalFilename().contentEquals("")) {
//				String originName = upfile.getOriginalFilename();
//				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
//				int ranNum = (int)(Math.random()*9000+1000);
//				String ext = originN ame.substring(originName.lastIndexOf("."));
//				String changeName = currentTime + ranNum + ext;
//				String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
//				String uploadPath = "./resources/uploadFiles/"+changeName;
//				try {ㅋㅌㅊㅋㅌㅊ
//					upfile.transferTo(new File(savePath+ changeName));
//				} catch (IllegalStateException | IOException e) {
//					e.printStackTrace(); 이상해ㅇㄴㄹㄴㅇ
//				}
//				System.out.println("파일들어가?"+upfile);
//				Attachment at = new Attachment();
//				at.setOriginName(upfile.getOriginalFilename());
//				at.setChangeName("/resources/uploadFiles/");
//		
//				mv.addObject("uploaded",true);
//				mv.addObject("url",uploadPath);
//			}
//		}
//		
//		
//		return (ArrayList)list;
//	}
//	
	@RequestMapping(value = "/resources/uploadFiles", produces = "application/json;charset-8")
	public ModelAndView storeWriterInsert(HttpServletRequest request, MultipartHttpServletRequest multirequest,
			ModelAndView mv) throws Exception {
		// ArrayList<Attachment>list = new ArrayList();
		MultipartFile upfile = multirequest.getFile("upload");

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
		String realPath = multirequest.getServletContext().getRealPath("/uploadFiles");
		System.out.println("현재 경로 realPath" + realPath);
		// 현재 저장경로
		// String savePath = realPath+"upload/"+changeName;
		String savePath = multirequest.getServletContext().getRealPath("resources/uploadFiles/") + changeName;

		System.out.println("savePath: " + savePath);
		String uploadPath = request.getSession().getServletContext().getRealPath("/uploadFiles");
		System.out.println("uploadPath: " + uploadPath);

		upfile.transferTo(new File(savePath + changeName));

		mv.addObject("uploaded", true);
		mv.addObject("url", uploadPath);
		System.out.println("url: " +  uploadPath);

		return mv;

	}
}
