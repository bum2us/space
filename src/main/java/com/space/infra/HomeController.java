package com.space.infra;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {

	
	@RequestMapping(value="")
	public String home() throws Exception{		
		
		return "infra/index";
	}
	
	@RequestMapping(value="login")
	public String login() throws Exception{
		
		return "infra/login";
	}
	
}
