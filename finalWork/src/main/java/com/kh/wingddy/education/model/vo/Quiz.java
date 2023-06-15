package com.kh.wingddy.education.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @ToString(callSuper = true) 
public class Quiz extends Edu{
	
	private int quizNo;//QUIZ_NO	NUMBER
	private String quizContent;//QUIZ_CONTENT	VARCHAR2(500 BYTE)
	private String correctContent;//CORRECT_CONTENT	VARCHAR2(500 BYTE)
}
