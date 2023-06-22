package com.kh.wingddy.store.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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
import com.kh.wingddy.store.model.vo.Address;
import com.kh.wingddy.store.model.vo.Cart;
import com.kh.wingddy.store.model.vo.KakaoApproveResponse;
import com.kh.wingddy.store.model.vo.KakaopayReadyResponse;
import com.kh.wingddy.store.model.vo.Order;
import com.kh.wingddy.store.model.vo.Store;
import com.sun.media.jfxmedia.events.NewFrameEvent;

import jdk.nashorn.internal.ir.annotations.Reference;
import sun.security.util.Length;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;
	
	private RenameFile rename = new RenameFile();

	//카카오api서비스키
	//public static final String Authorization="580c0648b175b72fe78aeff8d208161e";
	
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

	//구매하기 클릭시 -> 장바구니페이지이동
	@PostMapping("storebuybasket")
	public String storeCart(Cart cart,HttpSession session,Model model) {
		// 장바구니 페이지 들어오면 구매하기 넘어가기 전에 구매번호랑 장바구니 번호 가지고 들어가야함!
		// 장바구니 페이지 들어올때 detail에서 (구매수량, 상품번호,주문완료여부, 장바구니번호 )필요한 정보들 받아오기
		//장바구니 넘어오면서 담은 모든 장바구니 정보를 가져와야 하는데 그러지 못함->cartNo먼저 insert하고 정보 가져오기 
		Member m = ((Member) session.getAttribute("loginUser"));
		cart.setMemberNo(m.getMemberNo());
		
		if(storeService.insertStoreCart(cart) >0) {
			ArrayList<Cart> cartList = storeService.selectStoreCart(m.getMemberNo());
			model.addAttribute("cartList",cartList);
			return "store/storecart";
		}else {
			model.addAttribute("errorMsg", "구매실패");
			return "common/errorPage";
		}
	}
	//사이드바에서 장바구니 페이지 바로가기
	@RequestMapping("cartDirect")
	public String storeCartDirect(HttpSession session,Model model,Cart cart) {
		Member m = ((Member) session.getAttribute("loginUser"));
		cart.setMemberNo(m.getMemberNo());
		ArrayList<Cart> cartList = storeService.selectStoreCart(m.getMemberNo());
		model.addAttribute("cartList",cartList);
		return "store/storecart";
	}

	// 장바구니 ajax
	@ResponseBody
	@RequestMapping(value = "storecart.do", produces = "application/json;charset=UTF-8")
	public String ajaxStoreCart(Store s,Cart cart, HttpSession session) {
		Member m = ((Member) session.getAttribute("loginUser"));
		cart.setMemberNo(m.getMemberNo());
		return new Gson().toJson(storeService.insertStoreCart(cart));
	}
	//장바구니페이지에서 가격ajax
	@ResponseBody
	@RequestMapping(value="shoppingcartprice", produces= "application/json;charset=UTF-8")
	public String ajaxShoppingcartprice(Cart cart,HttpSession session) {
		Member m = ((Member) session.getAttribute("loginUser"));
		cart.setMemberNo(m.getMemberNo());
		
		return new Gson().toJson(storeService.selectStoreCart(m.getMemberNo()));
	}
	// 장바구니 삭제ajax
	@ResponseBody
	@RequestMapping(value = "deletestorecart.do", produces = "application/json;charset=UTF-8")
	public String ajaxDeleteStoreCart(Store s,Cart cart, HttpSession session) {
		
		Member m = ((Member) session.getAttribute("loginUser"));
		cart.setMemberNo(m.getMemberNo());
		return new Gson().toJson(storeService. deleteCart(cart));
	}
	
		
	//구매하기페이지!
	@GetMapping("storebuy.do")
	public String storebuy(@RequestParam(value = "cartNo")String[] cartNo, Order order, HttpSession session,Model model,Cart cart) {
		if(storeService.insertOrderNo(order)>0) {
			int orderNo = storeService.checkedOrderNo();
			int sumPrice=0;
			//cart.setMemberNo(m.getMemberNo());
			ArrayList<Cart> cartList = storeService.buyCartSelect(cartNo);
			for(int i=0; i<cartList.size(); i++) {
				sumPrice += cartList.get(i).getTotPrice();
			}
			model.addAttribute("cartList",cartList);
			model.addAttribute("orderNo",orderNo);
			model.addAttribute("sumPrice",sumPrice);
		//	System.out.println("sumPirce: "+sumPrice);
			return "store/storebuy";
			//storeService.selectOrder()
		}
		return "store/cartDirect";
	}
	//구매완료페이지이동
	//->구매가 성공적으로 이루어지면 페이지 이동
	@RequestMapping("storeBuySuccess")
	public String storeBuySuccess(@RequestParam("sumPrice")int sumPrice, Model model,String[] cartNo,Order order,Address address,HttpSession session) {
			//System.out.println("구매하기 페이지는 들어옴");
			String address1 = address.getRoadAddrPart1();
			String address2 = address.getRoadAddrPart2();
			String address3 = address.getAddrDetail();
			order.setOrderAddress(address1+address2+address3);
			System.out.println("sumPirce"+sumPrice);
		
			Member m = ((Member) session.getAttribute("loginUser"));
			order.setMemberNo(m.getMemberNo());
			System.out.println("order정보" + order);
			if(storeService.storeBuySuccess(order)>0) {
				System.out.println("성공");
				
			}else {
				System.out.println("실패");
			}
			
			//System.out.println("controller : "+ success);
			//구매완료update
				//-> 성공요청이들어오면 장바구니 update, s_pay insert
				//ArrayList<Cart> cartList = storeService.orderSuccessUpdateCart(cartNo,order);
			return "store/storemain";
	}
	
	//카카오페이 결제-  요청하기
		@PostMapping("/payment/ready")
		public KakaopayReadyResponse readyToKakaoPay() {
			return storeService.kakaoPayReady();
			
		}
		//카카오페이 결제-  성공
		@GetMapping("/payment/success")
		public ResponseEntity afterPay(@RequestParam("pg_token") String pgToken) {
			KakaoApproveResponse kakaoApprove = storeService.ApproveResponse(pgToken);
			return new ResponseEntity<>(kakaoApprove, HttpStatus.OK);
		}
		
	
	//주소 팝업창
	@RequestMapping("address.do")
	public String address() {
		
		return "store/popupAddress";
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

	//게시판 글 등록
	@RequestMapping("insertstore.do")
	public String insertStoreBoard(Store s, MultipartFile upfile, HttpSession session, Model model) {
		// HashMap<String, Object> map = new HashMap<String, Object>();
		Member m = ((Member) session.getAttribute("loginUser"));
		Attachment at = new Attachment();
		//String savePath =  session.getServletContext().getRealPath("/resources/uploadFiles/");
		String changeName = rename.fileName(upfile, session);
		at.setOriginName(upfile.getOriginalFilename());
		at.setChangeName(changeName);
		at.setFilePath("resources/uploadFiles/");
		
		at.setFileNo(s.getFileNo());
		at.setMemberNo(m.getMemberNo());
	
		  
		if (storeService.insertStoreBoard(s, at) > 0) {
			
			return "redirect:storemain";
		} else {
			model.addAttribute("errorMsg", "게시글작성실패");
			return "common/errorPage";
		}
	}

//ATTACHMENT 랑 STORE를 MAP에 담아서 mapper에서 한번에 insert하는것에 어려움 느낌
	// JSP에 담긴 값들이 Object타입이라 controller에서 받아오는 타입에 어려움 느낌



	@ResponseBody
	@PostMapping(value = "/resources/uploadFiles", produces = "application/json;charset=UTF-8" )
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
		
		//System.out.println(savePath);
		
		// CK에디터 등록하기 위해서 JSON으로 리턴하는것에 어려움을 느꼈음.
		// 경로 지정하는것 어려워했음 ㅠ
		// JSON이 버전에 따라 사용법이 다름
		return new Gson().toJson(map);

	}
	
}
