package com.kh.wingddy.voca.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class Voca {

	private int bookNo;
	private int memberNo;
	private int classNo;
	private String bookName; 
	private String memberName;
	private String className;
	private String vocaEnglish;
	private String vocaKorean;
}
