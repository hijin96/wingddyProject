package com.kh.wingddy.voca.model.vo;

import lombok.Builder;
import lombok.Data;

@Data @Builder
public class Voca {

	private String bookNo;
	private String vocaEnglish;
	private String vocaKorean;
}
