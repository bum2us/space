package com.space.infra.modules.product;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product/")
public class ProductController {

	@Autowired
	ProductServiceImpl service;
	
	@RequestMapping("productInst")
	public String productInst (HttpSession httpSession) throws Exception {
		
		 
		
		return "infra/product/user/productForm";
	}
	
}
