package com.kh.wingddy.voca.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.SuperBuilder;

@Getter @Setter @ToString @SuperBuilder @NoArgsConstructor @AllArgsConstructor
public class VocaBook {
	
	private int bookNo;
	private int memberNo;
	private String bookName; 
	private String memberName;
}
