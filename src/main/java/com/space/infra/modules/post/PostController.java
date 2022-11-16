package com.space.infra.modules.post;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post/")
public class PostController {

	@Autowired
	PostServiceImpl service;
	
	
	@RequestMapping(value = "postList")
	public String postList() throws Exception {
		
		return "infra/post/user/postList";
	}
	
	@RequestMapping(value = "postForm")
	public String postForm() throws Exception {
		
		return "infra/post/user/postForm";
	}
	
	@RequestMapping(value = "postView")
	public String postView() throws Exception {
		
		return "infra/post/user/postView";
	}
	
}
