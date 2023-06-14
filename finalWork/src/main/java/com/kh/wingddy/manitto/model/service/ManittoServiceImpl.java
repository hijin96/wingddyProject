package com.kh.wingddy.manitto.model.service;

import java.util.ArrayList;
import java.util.Collections;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wingddy.manitto.model.dao.ManittoDao;
import com.kh.wingddy.manitto.model.vo.Manitto;

@Service
public class ManittoServiceImpl implements ManittoService{
	
	@Autowired
	private ManittoDao manittoDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public String manittoMatching(Manitto mt) {
		
		ArrayList manitto = manittoDao.selectStudentNo(sqlSession, mt);
		//System.out.println("---------------------");
		//System.out.println("마니또  : " + manitto);	
		
		
		ArrayList manitti = new ArrayList();
		
		boolean check = true;
		
		int result = 0;
		
		while(check) {
			for(int i = 0; i < manitto.size(); i++) {
				manitti.add(manitto.get(i));

			}
			
			//System.out.println("셔플 전 마니띠  : " + manitti);
			Collections.shuffle(manitti);
			
			for(int i = 0; i < manitto.size(); i++) {
				if(manitto.get(i) == manitti.get(i)) {
					//System.out.println("똑같은 거 있을 때 : " + manitti);
					//System.out.println(i);
					manitti.clear();
					
					break;
				}
			}
			
			if(!manitti.isEmpty()) {
				check = false;
			}
		}
		
		for(int i = 0; i < manitto.size(); i++) {
			mt.setManittoNo((Integer)manitto.get(i));
			mt.setManittiNo((Integer)manitti.get(i));
			
			result += manittoDao.insertMatchingResult(sqlSession, mt);
		}
		
		if(result == manitto.size()) {
			//System.out.println(manittoDao.selectMatchingList(sqlSession, mt));
			return "success";
		}else {
			return "fail";
		}

	}

	@Override
	public ArrayList<Manitto> selectManittoList(int classNo) {
		
		return manittoDao.selectManittoList(sqlSession, classNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
