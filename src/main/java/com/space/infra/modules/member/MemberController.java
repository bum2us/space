package com.space.infra.modules.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
	
	@RequestMapping("joinForm")
	public String joinForm() throws Exception{
		
		return "infra/member/user/joinForm";
	}
	
	@ResponseBody
	@RequestMapping("login")
	public Map<String,Object> login(HttpSession httpSession,Member dto) throws Exception{
		
		Map<String,Object> result = new HashMap<String,Object>();
		
		Member LoginMember = service.checkLogin(dto);
		
		if(LoginMember == null) {
			//로그인 실패
			result.put("rt","fail");
		}else {
			//로그인 성공
			result.put("rt","success");
			
			httpSession.setAttribute("sessSeq",LoginMember.getMmSeq());
			httpSession.setAttribute("sessId", LoginMember.getMmId());
			httpSession.setAttribute("sessName", LoginMember.getMmName());
			//httpSession.setAttribute("sessNickName", LoginMember.getMmNickName());
			//사용자 프로필 이미지 추가 필요
		}
		
		return result;
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession httpSession) throws Exception{
		
		httpSession.invalidate();
		
		return "infra/member/loginForm";
	}
	
	
	
	
	
	
	
	
	
	
	
	/* ====================admin======================== */
	
	
	@RequestMapping("memberList")
	public String memberList() throws Exception{
		
		return "infra/member/xdmin/memberList";
	}
	
}
