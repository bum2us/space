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
		
		int lastPoSeq = service.selectLastSeq();
		
		vo.setPoSeq(lastPoSeq);
		
		Post one = service.selectOne(dto);
		
		model.addAttribute("one", one);
		
		return "infra/post/user/postView";
	}
	
	@RequestMapping(value = "postForm")
	public String postForm(Post dto, PostVo vo, Model model) throws Exception {
		
		/*
		 * Post one = service.selectOne(dto); model.addAttribute("one", one);
		 */
		
		return "infra/post/user/postForm";
	}
	
	@RequestMapping(value = "postView")
	public String postView(HttpSession httpSession, PostVo vo, Model model, Post dto) throws Exception {
		
		System.out.println("dto.getPoSeq : " +  dto.getPoSeq());
		Post one = service.selectOne(dto);
		model.addAttribute("one", one);
		
		System.out.println("dto.getPoSeq : " +  dto.getPoSeq());
		List<Post> img = service.selectPostImage(dto);
		model.addAttribute("img", img);
		
		return "infra/post/user/postView";
	}
	
	@RequestMapping(value="postUpdt")
	public String postUpdt(Model model, Post dto, PostVo vo) throws Exception {
		
		service.update(dto);
		
		System.out.println("dto.getPoSeq : " + dto.getPoSeq());
		vo.setPoSeq(dto.getPoSeq());
		
		Post one = service.selectOne(dto);
		model.addAttribute("one", one);
		
		return "infra/post/user/postView";
	}
	
}
