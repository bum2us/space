package com.space.infra.modules.live;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class LiveDao {

	@Inject
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	private String namespace="com.space.infra.modules.live.LiveMapper";

	public Integer selectListCount(LiveVo vo) { return sqlSession.selectOne(namespace+".selectListCount", vo); }

	public List<Live> selectList(LiveVo vo) { return sqlSession.selectList(namespace+".selectList", vo); }

	public void insert(Live dto) { sqlSession.insert(namespace + ".insert", dto); }

	public List<Live> selectListForHome() { return sqlSession.selectList(namespace+".selectListForHome"); } 
}
