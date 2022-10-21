package com.space.infra.module.base;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class BaseController {

	
	@RequestMapping(value="")
	public String home() throws Exception{		
		
		return "infra/home/index";
	}
	
	@RequestMapping(value="loginForm")
	public String loginForm(@ModelAttribute("loginCheck")Base dto) throws Exception{
		
		return "infra/member/loginForm";
	}
	
}
