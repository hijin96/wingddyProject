package com.kh.wingddy.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {

	@RequestMapping("storemain")
	public String storeMain() {
		return "store/storemain";
	}
	
	@RequestMapping("storedetail")
	public String storeDetail() {
		return "store/storedetail";
	}
}
