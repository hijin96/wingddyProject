package com.kh.wingddy.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wingddy.common.model.vo.Attachment;
import com.kh.wingddy.member.model.dao.MemberDao;
import com.kh.wingddy.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member loginMember(Member m) {
		
		return memberDao.loginMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		
		return memberDao.insertMember(sqlSession, m);
	}

	@Override
	public int insertTeacher(Member m, Attachment at) {
		
		int result1 = memberDao.insertMember(sqlSession, m);
		int result2 = memberDao.insertAttach(sqlSession, at);
		
		return result1 * result2;
	}

	@Override
	public int updateMember(Member m, Attachment at) {
		
		//int result1 = memberDao.updateMember(sqlSession, m);
		//int result2 = memberDao.updateProfile(sqlSession, at);
		
		return 0;
	}

	@Override
	public Attachment selectProfile(int memberNo) {
		return memberDao.selectProfile(sqlSession, memberNo);
	}
	
}
