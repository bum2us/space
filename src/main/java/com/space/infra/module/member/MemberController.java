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
	
	@RequestMapping("memberList")
	public String memberList() throws Exception{
		
		return "infra/member/xdmin/memberList";
	}
	
}
