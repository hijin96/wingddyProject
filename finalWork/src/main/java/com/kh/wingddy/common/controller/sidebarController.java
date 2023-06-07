package com.kh.wingddy.common.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class sidebarController  {
	
	
	@RequestMapping("sideBar")
	public String sideBar() {
		
		return "sideBar/sideBar";
	}
	
	@RequestMapping("include")
	public String include() {
		
		return "sideBar/sample1";
	}

}
