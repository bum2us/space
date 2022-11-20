package com.space.infra.modules.product;

import java.util.List;

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
		
		Product item = service.selectOneProduct(dto);
		
		model.addAttribute("item", item);
		
		List<Product> img = service.selectImgFromProduct(dto);
		
		model.addAttribute("img",img);
		
		return "infra/product/user/productView";
	}
	
	@RequestMapping("productList")
	public String productList (HttpSession httpSession,Model model) throws Exception {
		
		List<Product> saleList =  service.selectSaleList();
		model.addAttribute("saleList", saleList);
		
		List<Product> buyList = service.selectBuyList();
		model.addAttribute("buyList", buyList);
		
		return "infra/product/user/productList";
	}
	
	@RequestMapping("productView")
	public String productView (HttpSession httpSession,Product dto,Model model) throws Exception {
		
		Product item = service.selectOneProduct(dto);
		
		model.addAttribute("item", item);
		
		List<Product> img = service.selectImgFromProduct(dto);
		
		model.addAttribute("img",img);
		
		return "infra/product/user/productView";
	}
}
