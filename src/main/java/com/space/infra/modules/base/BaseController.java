package com.space.infra.modules.base;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class BaseController {

	
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
		
		int rnd = 0;
		
		while(1 > rnd || rnd > 3){
			
			rnd = (int)(Math.random()*10)+1;
			 
		}
		
		model.addAttribute("no", rnd);
		
		return "infra/home/user/home";
	}
	
	@RequestMapping(value="adminhome")
	public String adminhome() throws Exception  {
		
		return "infra/home/xdmin/home";
	}
	
	@RequestMapping(value="vgStory")
	public String vgStory() throws Exception  {
		
		return "infra/vgStory/user/vgStoryList";
	}
	
}
