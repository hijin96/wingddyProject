package com.kh.wingddy.manitto.model.service;

import java.util.ArrayList;

import com.kh.wingddy.manitto.model.vo.Manitto;

public interface ManittoService {
	
	// 마니또 매칭시키기
	ArrayList<Integer> manittoMatching(Manitto mt); 

}
