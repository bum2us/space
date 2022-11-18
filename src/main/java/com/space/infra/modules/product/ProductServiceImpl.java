package com.space.infra.modules.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service	
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductDao dao;

	@Override
	public void insert(Product dto) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(dto);
	}

	@Override
	public List<Product> selectBuyList() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectBuyList();
	}

	@Override
	public List<Product> selectSaleList() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectSaleList();
	}

	@Override
	public Product selectOneProduct(Product dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectOneProduct(dto);
	}
	
	

	
}
