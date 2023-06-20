package com.kh.wingddy.voca.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.SuperBuilder;

@Getter @Setter @ToString(callSuper=true) @SuperBuilder @NoArgsConstructor @AllArgsConstructor
public class ClassVocaBook extends VocaBook{

	private int classNo;
	private String className;
	
}
