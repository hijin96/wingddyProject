package com.kh.wingddy.voca.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wingddy.voca.model.dao.VocaMapper;
import com.kh.wingddy.voca.model.vo.ClassVocaBook;
import com.kh.wingddy.voca.model.vo.Voca;
import com.kh.wingddy.voca.model.vo.VocaBook;

@Service
public class VocaServiceImpl implements VocaService {
	
	@Autowired
	private VocaMapper vocaMapper;
	
	@Override
	public ArrayList<VocaBook> selectVocaBookList(int memNo) {
		return vocaMapper.selectVocaBookList(memNo);
	}

	@Override
	public ArrayList<Voca> selectVocaList(int bookNo) {
		return vocaMapper.selectVocaList(bookNo);
	}

	@Override
	public ArrayList<ClassVocaBook> selectClassVocaBookList(int memNo) {
		return vocaMapper.selectClassVocaBookList(memNo);
	}

	@Override
	public int deleteVocaBook(int bookNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertVocaBook(VocaBook vb, ArrayList<Voca> vlist) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Voca> searchVoca(String text) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateVocaBook(VocaBook vb, ArrayList<Voca> vlist) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertClassBook(ArrayList<ClassVocaBook> cvList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<ClassVocaBook> vocaBookClassList(int bookNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateClassBook(ArrayList<ClassVocaBook> cvList) {
		// TODO Auto-generated method stub
		return 0;
	}

}
