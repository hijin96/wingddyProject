package com.kh.wingddy.voca.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.kh.wingddy.voca.model.vo.VocaBook;

@Mapper
public interface VocaMapper {

	public ArrayList<VocaBook> selectVocaBookList(int memNo);
}
