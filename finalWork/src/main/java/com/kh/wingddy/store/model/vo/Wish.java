package com.kh.wingddy.store.model.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class Wish {

	private int memberNo;
	private int spNo;
	private Date wishDay;
	private String filePath;
	private int spPrice;//가격
	private String changeName;
	private String spName;//상품명
}
