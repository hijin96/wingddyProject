package com.kh.wingddy.education.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.SuperBuilder;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @ToString(callSuper = true) @SuperBuilder
public class EduProgress extends Edu{

	private int totalCount;
	private int completeCount;
	private Double progressRate;
}
