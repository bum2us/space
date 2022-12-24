package com.space.infra.modules.base;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.space.infra.modules.live.Live;
import com.space.infra.modules.live.LiveServiceImpl;
import com.space.infra.modules.member.MemberServiceImpl;
import com.space.infra.modules.post.PostServiceImpl;
import com.space.infra.modules.product.Product;
import com.space.infra.modules.product.ProductServiceImpl;


@Controller
public class BaseController {

	@Autowired
	ProductServiceImpl serviceProduct;
	
	@Autowired
	LiveServiceImpl	serviceLive;
	
	@Autowired
	MemberServiceImpl serviceMember;
	
	@Autowired
	PostServiceImpl servicePost;
	
	@RequestMapping(value="")
	public String index() throws Exception{		
		
		return "infra/home/index";
	}
	
	@RequestMapping(value="loginForm")
	public String loginForm(@ModelAttribute("loginCheck")Base dto) throws Exception{
		
		return "infra/member/loginForm";
	}
	
	@RequestMapping(value="home")
	public String home(Model model) throws Exception  {
		
		//메인화면 배너 변경용 랜덤수 생성
		int rnd = 0;
		
		while(1 > rnd || rnd > 3){
			
			rnd = (int)(Math.random()*10)+1;
			 
		}
		
		model.addAttribute("no", rnd);
		
		//중고거래 물품 리스트 출력
		  
		List<Product> productList = serviceProduct.selectListForHome();
		model.addAttribute("productList", productList);
		
		List<Live> liveList = serviceLive.selectListForHome();
		model.addAttribute("liveList", liveList);
		
		return "infra/home/user/home";
	}
	
	@RequestMapping(value="adminhome")
	public String adminhome(Model model) throws Exception  {
		
		model.addAttribute("memberCount",serviceMember.selectCount());
		model.addAttribute("productCount",serviceProduct.selectCount());
		model.addAttribute("postCount",servicePost.selectCount());
		model.addAttribute("categoryCountList", serviceProduct.selectCountGroupByCategory());
				
		return "infra/home/xdmin/home";
	}
	
	@RequestMapping(value="post")
	public String post() throws Exception  {
		
		return "infra/post/user/postList";
	}
	
	
}
