package com.space.infra.module.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@RequestMapping("joinForm")
	public String joinForm() throws Exception{
		
		return "infra/member/user/joinForm";
	}
	
	@RequestMapping("loginForm")
	public String loginForm() throws Exception{
		
		return "infra/member/loginForm";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/* ====================admin======================== */
	
	
	@RequestMapping("memberList")
	public String memberList() throws Exception{
		
		return "infra/member/xdmin/memberList";
	}
	
}
