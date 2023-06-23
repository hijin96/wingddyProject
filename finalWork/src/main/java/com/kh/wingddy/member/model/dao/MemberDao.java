package com.kh.wingddy.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wingddy.common.model.vo.Attachment;
import com.kh.wingddy.member.model.vo.Cert;
import com.kh.wingddy.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public int insertAttach(SqlSessionTemplate sqlSession, Attachment at) {
		
		return sqlSession.insert("commonMapper.insertAttach", at);
	}
	
	public Attachment selectProfile(SqlSessionTemplate sqlSession, int memberNo) {
		
		return sqlSession.selectOne("commonMapper.selectProfile", memberNo);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateMember", m);
	}
	
	public int updateProfile(SqlSessionTemplate sqlSession, Attachment at) {
		
		return sqlSession.update("commonMapper.updateProfile", at);
	}
	
	public Member searchId(SqlSessionTemplate sqlSession, String email) {
		
		return sqlSession.selectOne("memberMapper.searchId", email);
	}
	
	public int insertProfile(SqlSessionTemplate sqlSession, Attachment at) {
		
		return sqlSession.insert("commonMapper.insertProfile", at);
	}
	
	public Attachment selectEmploy(SqlSessionTemplate sqlSession, int memberNo) {
		
		return sqlSession.selectOne("commonMapper.selectEmploy", memberNo);
	}
	
	public int idCheck(SqlSessionTemplate sqlSession, String memberId) {
		
		return sqlSession.selectOne("memberMapper.idCheck", memberId);
	}
	
	public int insertCert(SqlSessionTemplate sqlSession, Cert cert) {
		
		return sqlSession.insert("memberMapper.insertCert", cert);
	}
	
	public Cert checkCode(SqlSessionTemplate sqlSession, Cert cert) {
		
		return sqlSession.selectOne("memberMapper.checkCode", cert);
	}
	
	public int certifyCode(SqlSessionTemplate sqlSession, Cert cert) {
		
		return sqlSession.delete("memberMapper.certifyCode", cert);
	}
	
	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updatePwd", m);
	}
	
	public int dropMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.delete("memberMapper.dropMember", m);
	}
}
