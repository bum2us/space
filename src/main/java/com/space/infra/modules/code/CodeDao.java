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

	public List<Code> selectList(CodeVo vo) {
		return sqlSession.selectList(namespace + ".selectList", vo);
	}

	public int selectOneCount(CodeVo vo) {
		int result = sqlSession.selectOne(namespace + ".selectOneCount", vo);
		return result;
	}
	
	public Code selectOne(CodeVo vo) {
		return sqlSession.selectOne(namespace +".selectOne", vo);
	}

	public int update(Code dto) {
		return sqlSession.update(namespace + ".update", dto);
	}

	public int insert(Code dto) {
		return sqlSession.insert(namespace +".insert", dto);
	}

	public int uelete(Code dto) {
		return sqlSession.update(namespace +".uelete", dto);
	}

	public int delete(CodeVo vo) {
		return sqlSession.delete(namespace +".delete", vo);
	}

}
