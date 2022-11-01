package com.space.infra.modules.post;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PostDao {

	
	@Inject
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	private String namespace ="com.space.infra.modules.post.PostMapper";
	
	
}