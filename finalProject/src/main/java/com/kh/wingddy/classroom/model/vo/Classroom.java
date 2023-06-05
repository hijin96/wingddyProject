package com.kh.wingddy.classroom.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter @Getter @NoArgsConstructor @AllArgsConstructor
public class Classroom {
	
	private int classNo;
	private String className;
	private String teacherName;
	private String enterCode;
}
