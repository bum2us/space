package com.space.infra.modules.member;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {

	@Inject
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	private String namespace="com.space.infra.modules.member.MemberMapper";

	public Member checkLogin(Member dto) { return sqlSession.selectOne(namespace+".checkLogin",dto); }

	public List<Member> selectList(MemberVo vo) { return sqlSession.selectList(namespace + ".selectList", vo); }

	public Integer selectListCount(MemberVo vo) { return sqlSession.selectOne(namespace+".selectListCount", vo); }

	public void insert(Member dto) { sqlSession.insert(namespace+".insert", dto); }

	public void insertUpload(Member dto) { sqlSession.insert(namespace+".insertProfileUpload",dto); }
	
	
	
}
