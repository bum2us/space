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
	
	private String namesapce="com.space.infra.modules.product.ProductMapper";

	public void insert(Product dto) { sqlSession.insert(namesapce + ".insert",dto); }

	public List<Product> selectBuyList() { return sqlSession.selectList(namesapce +".selectBuyList"); }

	public List<Product> selectSaleList() { return sqlSession.selectList(namesapce +".selectSaleList"); }

	public List<Product> selectBuyListFromMember(Product dto) { return sqlSession.selectList(namesapce+".selectBuyListFromMember", dto); }
	
	public List<Product> selectSaleListFromMember(Product dto) {return sqlSession.selectList(namesapce+".selectSaleListFromMember", dto); }

	public Product selectOneProduct(Product dto) { return sqlSession.selectOne(namesapce+".selectOneProduct",dto);}

	public void insertUpload(Product dto) { sqlSession.insert(namesapce+".insertUpload", dto); }

	public List<Product> selectImgFromProduct(Product dto) { return sqlSession.selectList(namesapce+".selectImgFromProduct", dto); }

}
