package com.kh.wingddy.alphabetMarket.model.vo;

import lombok.Data;

@Data
public class Alphabet {

	private int cno; //classNo
	private int mno; //memberNo
	private String alphabet;
	private int count; // 어떤 알파벳이 몇개있나
}
