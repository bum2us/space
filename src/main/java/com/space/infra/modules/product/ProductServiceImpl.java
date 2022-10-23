package com.space.infra.modules.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service	
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductDao dao;
	
}
