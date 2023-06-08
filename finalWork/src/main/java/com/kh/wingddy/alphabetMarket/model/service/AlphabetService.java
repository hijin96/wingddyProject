package com.kh.wingddy.alphabetMarket.model.service;

import java.util.ArrayList;

import com.kh.wingddy.alphabetMarket.model.vo.AlphabetMarket;

public interface AlphabetService {
	
	
	ArrayList<AlphabetMarket> selectMarketList(int classNo);
	
	

}
