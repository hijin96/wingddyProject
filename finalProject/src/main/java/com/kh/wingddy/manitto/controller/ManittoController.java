package com.kh.wingddy.manitto.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.wingddy.manitto.model.service.ManittoService;

@Controller
public class ManittoController {
	
	@Autowired
	private ManittoService ManittoService;

}
