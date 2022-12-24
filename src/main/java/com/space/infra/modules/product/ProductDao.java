package com.space.infra.modules.product;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDao {
	
	@Inject
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	private String namespace="com.space.infra.modules.product.ProductMapper";

	public void insert(Product dto) { sqlSession.insert(namespace + ".insert",dto); }

	public List<Product> selectBuyList() { return sqlSession.selectList(namespace +".selectBuyList"); }

	public List<Product> selectSaleList() { return sqlSession.selectList(namespace +".selectSaleList"); }

	public List<Product> selectBuyListFromMember(Product dto) { return sqlSession.selectList(namespace+".selectBuyListFromMember", dto); }
	
	public List<Product> selectSaleListFromMember(Product dto) {return sqlSession.selectList(namespace+".selectSaleListFromMember", dto); }

	public Product selectOneProduct(Product dto) { return sqlSession.selectOne(namespace+".selectOneProduct",dto);}

	public void insertUpload(Product dto) { sqlSession.insert(namespace+".insertUpload", dto); }

	public List<Product> selectImgFromProduct(Product dto) { return sqlSession.selectList(namespace+".selectImgFromProduct", dto); }

	public List<Product> selectListForHome() { return sqlSession.selectList(namespace + ".selectListForHome"); }

	public Integer selectCount() { return sqlSession.selectOne(namespace+".selectCount");}

	public Integer selectCountGroupByCategory(Integer ccOrder) { return sqlSession.selectOne(namespace+".selectCountGroupByCategory" , ccOrder);}
}
