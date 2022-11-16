package com.space.infra.modules.product;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product/")
public class ProductController {

	@Autowired
	ProductServiceImpl service;
	
	@RequestMapping("productForm")
	public String productForm (HttpSession httpSession,Model model) throws Exception {
		
		model.addAttribute("seq", httpSession.getAttribute("sessSeq").toString());
		
		return "infra/product/user/productForm";
	}
	
	@RequestMapping("productInst")
	public String productInst (HttpSession httpSession,Product dto,Model model) throws Exception {
		
		dto.setPdSeller((int)httpSession.getAttribute("sessSeq"));
		
		service.insert(dto);
		
		model.addAttribute("item", dto);
		
		return "infra/product/user/productView";
	}
	
}
