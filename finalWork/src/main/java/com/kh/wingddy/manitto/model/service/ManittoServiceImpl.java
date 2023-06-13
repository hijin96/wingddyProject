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
	public ArrayList manittoMatching(Manitto mt) {
		
		ArrayList manitto = manittoDao.selectStudentNo(sqlSession, mt);
		System.out.println("---------------------");
		System.out.println("마니또  : " + manitto);	
		
		
		ArrayList manitti = new ArrayList();
		
		boolean check = true;
		
		while(check) {
			for(int i = 0; i < manitto.size(); i++) {
				manitti.add(manitto.get(i));

			}
			
			System.out.println("셔플 전 마니띠  : " + manitti);
			Collections.shuffle(manitti);
			
			for(int i = 0; i < manitto.size(); i++) {
				if(manitto.get(i) == manitti.get(i)) {
					System.out.println("똑같은 거 있을 때 : " + manitti);

					manitti.clear();
					
					break;
				}else {
					check = false;
				}
			}
			System.out.println("**");
		}
		

		
			
		System.out.println("last : " + manitti);
		
		
		
		return null;
	}
	

}
