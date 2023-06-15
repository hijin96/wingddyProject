package com.kh.wingddy.education.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString(callSuper = true) @NoArgsConstructor @AllArgsConstructor @Builder
public class Incorrect extends Quiz{

	private int memberNo;//MEMBER_NO	NUMBER
	private String incorrectContent;//INCORRECT_CONTENT	VARCHAR2(500 BYTE)
}
