package com.space.infra.modules.post;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Post/")
public class PostController {

	@Autowired
	PostServiceImpl service;
	
}
