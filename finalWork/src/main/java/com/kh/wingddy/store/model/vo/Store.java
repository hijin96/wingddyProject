package com.kh.wingddy.store.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.wingddy.common.model.vo.Attachment;

import lombok.Data;
@Data
public class Store {
	private int spNo;//상품번호
	private int fileNo;//파일번호
	private String spName;//상품명
	private String spContent;//상품설명
	private int spPrice;//가격
	private int amount;//판매수량
	private int viewCount;//조회수
	private String spOnecom;//상품한줄평
	private Date spDay;//상품등록일
	private ArrayList<Attachment> atlist;

}
