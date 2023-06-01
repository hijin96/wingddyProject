package com.kh.wingddy.voca.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.kh.wingddy.voca.model.vo.ClassVocaBook;
import com.kh.wingddy.voca.model.vo.Voca;
import com.kh.wingddy.voca.model.vo.VocaBook;

@Mapper
public interface VocaMapper {

	public ArrayList<VocaBook> selectVocaBookList(int memNo);

	public ArrayList<Voca> selectVocaList(int bookNo);

	public ArrayList<ClassVocaBook> selectClassVocaBookList(int memNo);
	
	
}
