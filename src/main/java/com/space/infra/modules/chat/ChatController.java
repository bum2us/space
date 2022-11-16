package com.space.infra.modules.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/chat/")
public class ChatController {

	@RequestMapping(value="")
	public String chat() throws Exception {
		
		return "infra/chat/user/chat";
	}
}
