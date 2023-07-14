package com.kh.wingddy.store.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.wingddy.common.model.vo.Attachment;
import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.common.template.Pageination;
import com.kh.wingddy.common.template.RenameFile;
import com.kh.wingddy.member.model.vo.Member;
import com.kh.wingddy.store.model.service.StoreService;
import com.kh.wingddy.store.model.vo.Address;
import com.kh.wingddy.store.model.vo.Cart;
import com.kh.wingddy.store.model.vo.Order;
import com.kh.wingddy.store.model.vo.Review;
import com.kh.wingddy.store.model.vo.Store;
import com.kh.wingddy.store.model.vo.Wish;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;

	private RenameFile rename = new RenameFile();

	// 카카오api서비스키
	// public static final String Authorization="580c0648b175b72fe78aeff8d208161e";

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

	// 구매하기 클릭시 -> 장바구니페이지이동
	@PostMapping("storebuybasket")
	public String storeCart(Cart cart, HttpSession session, Model model) {
		// 장바구니 페이지 들어오면 구매하기 넘어가기 전에 구매번호랑 장바구니 번호 가지고 들어가야함!
		// 장바구니 페이지 들어올때 detail에서 (구매수량, 상품번호,주문완료여부, 장바구니번호 )필요한 정보들 받아오기
		// 장바구니 넘어오면서 담은 모든 장바구니 정보를 가져와야 하는데 그러지 못함->cartNo먼저 insert하고 정보 가져오기
		Member m = ((Member) session.getAttribute("loginUser"));
		cart.setMemberNo(m.getMemberNo());

		if (storeService.insertStoreCart(cart) > 0) {
			ArrayList<Cart> cartList = storeService.selectStoreCart(m.getMemberNo());
			model.addAttribute("cartList", cartList);
			return "store/storecart";
		} else {
			model.addAttribute("errorMsg", "구매실패");
			return "common/errorPage";
		}
	}

	// 사이드바에서 장바구니 페이지 바로가기
	@RequestMapping("cartDirect")
	public String storeCartDirect(HttpSession session, Model model, Cart cart) {
		Member m = ((Member) session.getAttribute("loginUser"));
		cart.setMemberNo(m.getMemberNo());
		ArrayList<Cart> cartList = storeService.selectStoreCart(m.getMemberNo());
		model.addAttribute("cartList", cartList);
		return "store/storecart";
	}

	// 장바구니 ajax
	@ResponseBody
	@RequestMapping(value = "storecart.do", produces = "application/json;charset=UTF-8")
	public String ajaxStoreCart(Store s, Cart cart, HttpSession session) {
		Member m = ((Member) session.getAttribute("loginUser"));
		cart.setMemberNo(m.getMemberNo());
	
		return storeService.insertStoreCart(cart) >0 ? "1": "0";
		
	}


	// 장바구니 삭제ajax
	@ResponseBody
	@RequestMapping(value = "deletestorecart.do", produces = "application/json;charset=UTF-8")
	public String ajaxDeleteStoreCart(Cart cart, HttpSession session,int spNo) {
		
		Member m = ((Member) session.getAttribute("loginUser"));
		cart.setMemberNo(m.getMemberNo());
		int memberNo = ((Member) session.getAttribute("loginUser")).getMemberNo();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("spNo",spNo);
		return new Gson().toJson(storeService.deleteCart(map));
	}
	
	// 장바구니 개수수정
	@ResponseBody
	@RequestMapping(value = "buyCountUpdate", produces = "application/json;charset=UTF-8")
	public String updateBuyCount(String cartNo, String buyCount, HttpSession session, Model model) {
		int memberNo = ((Member) session.getAttribute("loginUser")).getMemberNo();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("buyCount", buyCount);
		map.put("cartNo", cartNo);
		
		return storeService.updateBuyCount(map) > 0 ? "1" : "0" ;
	
	}

	// 체크박스로 장바구니 삭제 ajax
	@ResponseBody
	@RequestMapping(value = "CheckBoxCartDelete", produces = "application/json;charset=UTF-8")
	public String ajaxCheckBoxCartDelete(@RequestParam(name = "cartNo", required = false) String[] cartNo,
			HttpSession session, Model model) {

		int memberNo = ((Member) session.getAttribute("loginUser")).getMemberNo();
		HashMap<String, Object> map = new HashMap();
		map.put("memberNo", memberNo);
		map.put("cartNo", cartNo);
		
		return storeService.CheckBoxCartDelete(map) > 0 ? "1" :"0" ;
	}

	// 위시리스트 삭제
	@ResponseBody
	@RequestMapping(value = "wishCheckDelete", produces = "application/json;charset=UTF-8")
	public String ajaxWishListDelete(@RequestParam(name = "spNo", required = false) int[] spNo, HttpSession session,
			Model model) {
		int memberNo = ((Member) session.getAttribute("loginUser")).getMemberNo();
		HashMap<String, Object> map = new HashMap();
		map.put("memberNo", memberNo);
		map.put("spNo", spNo);
		
		return storeService.WishListDelete(map) > 0 ? "1" :"0" ;
		
		/*
		 * if (storeService.WishListDelete(map) > 0) { return "1"; } else { return "0";
		 * }
		 */
	}

	// 구매하기페이지!
	@GetMapping("storebuy.do")
	public String storebuy(@RequestParam(value = "cartNo") String[] cartNo, Order order, HttpSession session,
			Model model, Cart cart) {
		// order정보를 생성후 orderNumber를 확인하고 그 이후에 구매하기 페이지로 넘어옴
		Member m = ((Member) session.getAttribute("loginUser"));
		order.setMemberNo(m.getMemberNo());
		int sumPrice = 0;
		ArrayList<Cart> cartList = storeService.buyCartSelect(cartNo);
		for (int i = 0; i < cartList.size(); i++) {
			sumPrice += cartList.get(i).getTotPrice();
		}
		model.addAttribute("cartList", cartList);
		model.addAttribute("sumPrice", sumPrice);
		return "store/storebuy";
	}

	// 구매완료페이지이동
	// ->구매가 성공적으로 이루어지면 메인 페이지 이동
	@RequestMapping("storeBuySuccess")
	public String storeBuySuccess(@RequestParam("sumPrice") int sumPrice,
			@RequestParam(value = "cartNo") String[] cartNo, Model model, Order order, Address address,HttpSession session,
			HttpServletRequest request) {
		int orderNo = storeService.createOrderNo();
		order.setOrderNo(orderNo);
		int memberNo = ((Member) session.getAttribute("loginUser")).getMemberNo();
		String address1 = address.getRoadAddrPart1();
		String address2 = address.getRoadAddrPart2();
		String address3 = address.getAddrDetail();
		order.setOrderAddress(address1 + address2 + address3);
		if (storeService.orderAllSuccess(order) > 0) {
			HashMap<String, Object> map = new HashMap();
			map.put("cartNo", cartNo);
			map.put("orderNo", orderNo);
			map.put("memberNo", memberNo);
		
			storeService.orderSuccessUpdateCart(map);
		}
		
		return "redirect:/storemain";
	}

	// 주소 팝업창
	@RequestMapping("address.do")
	public String address() {
		// Member m = ((Member) session.getAttribute("loginUser"));
		// mv.addObject(m).setViewName(viewName);
		return "store/popupAddress";
	}

	// 위시리스트페이지 이동
	@RequestMapping("storewish")
	public String storewish(HttpSession session, Model model) {
		int memberNo = ((Member) session.getAttribute("loginUser")).getMemberNo();
		ArrayList<Wish> wishList = storeService.wishList(memberNo);
		System.out.println("wish정보확인: " + wishList);
		model.addAttribute("wish", storeService.wishList(memberNo));

		return "store/storewishlist";
	}

	// ajax위시리스트 값체크 후 insert
	@ResponseBody
	@RequestMapping("storeWishListInsert")
	public String AjaxstoreWishListInsert(@RequestParam(name = "spNo") int spNo, Model m, HttpSession session) {
		int memberNo = ((Member) session.getAttribute("loginUser")).getMemberNo();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("spNo", spNo);
		// 담겨있는지 체크
		if (storeService.checkWishList(map) > 0) {
			return "1";
		}
		return "0";
	}

	// 주문정보
	@RequestMapping("shoppinglist")
	public String storeShoppingList() {
		return "store/storeShoppingList";
	}

	// 주문정보 상세보기
	@RequestMapping("orderInfo")
	public ModelAndView orderInfo(HttpSession session,ModelAndView mv) {
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		ArrayList<Cart> orderList = storeService.orderList(memberNo);
		mv.addObject("orderList",orderList).setViewName("store/orderInfo");
		return mv;
	}

	// 게시판 글쓰기 최종
	@RequestMapping("storeWriter")
	public ModelAndView storeInsert(ModelAndView mv,Store s) {
		int fileNo = storeService.createFileNo();
		mv.addObject("fileNo", fileNo);
		mv.setViewName("store/storeWriter");
		return mv;
	}

	// 게시판 글 등록
	@RequestMapping("insertstore.do")
	public String insertStoreBoard(Store s, MultipartFile upfile, HttpSession session, Model model) {
	
		Member m = ((Member) session.getAttribute("loginUser"));
		Attachment at = new Attachment();
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
	@PostMapping(value = "/resources/uploadFiles", produces = "application/json;charset=UTF-8")
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

		return new Gson().toJson(map);

	}
	//리뷰등록 ->체크 후 등록 안됨
	@ResponseBody
	@RequestMapping(value="insertReview.bo")
	public String AjaxReview(int spNo,int memberNo,String reCom){
		HashMap<String, Object> map = new HashMap();
		map.put("spNo",spNo);
		map.put("memberNo",memberNo);
		map.put("reCom",reCom);
		
		return storeService.insertReview(map)> 0 ? "1" : "0" ;
	}
	@ResponseBody
	@RequestMapping(value="rlist.do", produces = "application/json;charset-8")
	public String AjaxReviewList(int spNo) {
		return new Gson().toJson(storeService.selectReviewList(spNo));
	}
	
	//검색하기
	@RequestMapping("search.do")
	public String Search(String keyword,@RequestParam(value = "cPage", defaultValue = "1") int currentPage,Model m) {
		int searchCount = storeService.selectSearchCount(keyword);
		PageInfo pageInfo = Pageination.getPageInfo(searchCount, currentPage, 9, 5);
		ArrayList<Store> goodsList = storeService.selectSearchList(keyword,pageInfo);
		m.addAttribute("pageInfo", pageInfo);
		m.addAttribute("goodsList", goodsList);
		return  "store/storemain";
	}
	//게시글 수정하기
	@RequestMapping("editStore.do")
	public String EditStore(int spNo,Model m) {
		m.addAttribute("s",storeService.selectStoreBoard(spNo));
		return "store/updateStoreForm";
	}
	//수정등록하기
	@RequestMapping("update.bo")
	public String UpdateStoreBoard(Store s,Model m,MultipartFile reUpfile,HttpSession session,int fileNo, Attachment at) {
		//썸네일만 수정 (AT)
		//썸네일과 게시글 수정 (aT,S)
		//게시글만 수정 (S)
		
		//썸네일을 수정하는 경우 
		if(!reUpfile.getOriginalFilename().equals("")) {
			String changeName = rename.fileName(reUpfile, session);
			at.setMemberNo(((Member) session.getAttribute("loginUser")).getMemberNo());
			at.setChangeName(changeName);
			at.setOriginName(reUpfile.getOriginalFilename());
			at.setFileNo(fileNo);
			s.setChangeName("resources/uploadFiles/" + changeName);
			//썸네일 게시글 모두 수정하는 경우
			if(storeService.updateStoreBoardAll(s,at)>0 || storeService.updateFile(at)>0) {
				session.setAttribute("alertMsg", "게시글 수정완료");
				return "redirect:storedetail?spNo="+ s.getSpNo();
			}else {
				session.setAttribute("errorMsg", "수정실패");
				return "common/errorPage";
			}

		}else {
			//게시글만 수정하는 경우 
			if(storeService.updateStoreBoard(s)>0) {
				session.setAttribute("alertMsg", "게시글 수정완료");
				return "redirect:storedetail?spNo="+ s.getSpNo();
			}else {
				session.setAttribute("errorMsg", "수정실패");
				return "common/errorPage";
			}
			
		
		}

	
		

	}


}
