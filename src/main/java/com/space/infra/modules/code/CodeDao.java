package com.space.infra.modules.code;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CodeDao {

	@Inject
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	private String namespace="com.space.infra.modules.code.CodeMapper";

	public List<Code> selectListCachedCodeList() { return sqlSession.selectList(namespace+".selectListCachedCodeList"); }
}
