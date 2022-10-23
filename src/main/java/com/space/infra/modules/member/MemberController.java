package com.space.infra.modules.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
	
	@RequestMapping("joinForm")
	public String joinForm() throws Exception{
		
		return "infra/member/user/joinForm";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/* ====================admin======================== */
	
	
	@RequestMapping("memberList")
	public String memberList() throws Exception{
		
		return "infra/member/xdmin/memberList";
	}
	
}
