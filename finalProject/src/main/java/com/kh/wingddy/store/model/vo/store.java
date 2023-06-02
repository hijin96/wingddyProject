package com.kh.wingddy.store.model.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class store {
	private int spNo;//상품번호
	private int fileNo;//파일번호
	private String spName;//상품명
	private String spCount;//상품설명
	private int spPrice;//가격
	private int amount;//판매수량
	private int viewCount;//조회수
	private String spOnecom;//상품한줄평
	private Date spDay;//상품등록일

}
