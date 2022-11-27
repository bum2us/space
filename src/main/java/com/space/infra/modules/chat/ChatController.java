package com.space.infra.modules.chat;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/chat/")
public class ChatController {
	
	@Autowired
	ChatServiceImpl service;

	@RequestMapping(value="")
	public String chat(HttpSession httpSession,Model model) throws Exception {
		
		List<Chat> list = service.selectChatListFromOne((int)httpSession.getAttribute("sessSeq"));
		
		model.addAttribute("list", list);
		
		return "infra/chat/user/chat";
	}
	
	@RequestMapping(value="instChat")
	public String instChat(HttpSession httpSession,Model model,Chat dto) throws Exception {
		
		service.createChatFromProduct(dto.getChatProductSeq(),(int)httpSession.getAttribute("sessSeq"),dto.getMmSeq());
		
		List<Chat> list = service.selectChatListFromOne((int)httpSession.getAttribute("sessSeq"));
		
		model.addAttribute("list", list);
		
		return "infra/chat/user/chat";
	}
}
