package com.space.infra;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	
	@RequestMapping(value="/")
	public String home() throws Exception{
		
		return "infra/home";
	}
	
	@RequestMapping(value="/2")
	public String home2() throws Exception{
		
		return "infra/home2";
	}
	
}
