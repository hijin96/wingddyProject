package com.kh.wingddy.couponProduct.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wingddy.common.model.vo.Attachment;
import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.couponProduct.model.dao.CouponProductDao;
import com.kh.wingddy.couponProduct.model.vo.CouponProduct;

@Service
public class CouponProductServiceImpl implements CouponProductService {
	
	@Autowired
	private CouponProductDao cpDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount(int classNo) {
		return cpDao.selectListCount(sqlSession, classNo);
	}

	@Override
	public ArrayList<CouponProduct> selectCouponProductList(PageInfo pi, CouponProduct cp) {
		return cpDao.selectCouponProductList(sqlSession, pi, cp);
	}
	
	@Override
	public int insertCouponProduct(CouponProduct cp) {
		return cpDao.insertCouponProduct(sqlSession, cp) > 0 ? 1 : 0;
	}

	@Override
	public int updateCouponProduct(CouponProduct cp) {
		return 0;
	}

	@Override
	public int deleteCouponProduct(int cpNo) {
		return 0;
	}

	@Override
	public ArrayList<CouponProduct> myCouponList(int memberNo) {
		return null;
	}

	@Override
	public int useCoupon(int memberNo, int cpNo) {
		return 0;
	}

	@Override
	public int buyCouponProduct(ArrayList<CouponProduct> cpList, CouponProduct cp) {
		//(학생 보유 상품 insert, 상품 목록 수량 update, 학생 보유 쿠폰 update)
		
		
		if(cpDao.insertMyCp(sqlSession, cpList) * cpDao.updateCp(sqlSession, cp) * cpDao.updateCoupon(sqlSession, cp) > 0) {
			System.out.println("성공");
			return 1; 
		} else {
			System.out.println("실패");
			return 0;
		}
	}

	@Override
	public ArrayList<CouponProduct> selectClassCplist(int cno) {
		return cpDao.selectClassCplist(sqlSession, cno);
	}

	
	
	
	
	
	
}
