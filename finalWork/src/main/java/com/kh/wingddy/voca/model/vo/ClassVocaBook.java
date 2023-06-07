package com.kh.wingddy.voca.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @NoArgsConstructor @ToString(callSuper=true)
public class ClassVocaBook extends VocaBook{

	private int classNo;
	private String className;
	
}
