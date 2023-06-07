package com.kh.wingddy.alphabetMarket.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AlphabetMarket {
	
	private int marketBno;
	private String writer; // 조인해서 작성자 닉넴이나 아이디 가져오기
	private String alphabet;
	private String contetnt;
	private Date createDate;
	private String status;
	private String sellingStatus;

}
