package com.space.infra.modules.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post/")
public class PostController {

	@Autowired
	PostServiceImpl service;
	
	
	@RequestMapping(value = "postList")
	public String postList(Model model) throws Exception {
		
		
		List<Post> list = service.selectList();
		model.addAttribute("list", list);
		
		
		return "infra/post/user/postList";
	}
	
	@RequestMapping(value="postInst")
	public String postInst(HttpSession httpSession, Model model, Post dto, PostVo vo) throws Exception {
		
		service.insert(dto);
		
		Post one = service.selectOne(vo);
		
		model.addAttribute("one", one);
		
		return "infra/post/user/postView";
	}
	
	@RequestMapping(value = "postForm")
	public String postForm() throws Exception {
		
		return "infra/post/user/postForm";
	}
	
	@RequestMapping(value = "postView")
	public String postView(HttpSession httpSession, PostVo vo, Model model) throws Exception {
		
		Post one = service.selectOne(vo);
		model.addAttribute("one", one);
		
		return "infra/post/user/postView";
	}
	
}
