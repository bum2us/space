package com.space.infra.modules.product;

import java.util.List;

public interface ProductService {

	public void insert(Product dto) throws Exception;
	public List<Product> selectBuyList() throws Exception;
	public List<Product> selectSaleList() throws Exception;
	public Product selectOneProduct(Product dto) throws Exception;
}
