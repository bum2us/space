package com.space.infra.modules.product;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDao {
	
	@Inject
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	private String namesapce="com.space.infra.modules.product.ProductMapper";

	public void insert(Product dto) { sqlSession.insert(namesapce + ".insert",dto); }
}
