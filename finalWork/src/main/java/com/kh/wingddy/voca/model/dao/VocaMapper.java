package com.kh.wingddy.voca.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.kh.wingddy.member.model.vo.Member;
import com.kh.wingddy.voca.model.vo.ClassVocaBook;
import com.kh.wingddy.voca.model.vo.Voca;
import com.kh.wingddy.voca.model.vo.VocaBook;

@Mapper
public interface VocaMapper {

	public ArrayList<VocaBook> selectVocaBookList(int memNo);

	public ArrayList<Voca> selectVocaList(int bookNo);

	public ArrayList<ClassVocaBook> selectClassVocaBookList(Member m);

	public int deleteVocabook(int bookNo);

	public int insertVocaBook(VocaBook vb);

	public int insertVocaList(ArrayList<Voca> vlist);

	public int deleteVocaList(int bookNo);

	public int insertVocaMap(HashMap<String, Object> vb);

	public ArrayList<ClassVocaBook> selectBookClassList(int bookNo);

	public int deleteClassBook(int bookNo);

	public int insertClassBook(ArrayList<ClassVocaBook> cvList);

	public ArrayList<Voca> searchVoca(String text);

	public int checkClassBook(ClassVocaBook cv);

	
}
