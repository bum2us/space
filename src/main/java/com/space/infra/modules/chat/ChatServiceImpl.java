package com.space.infra.modules.chat;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	ChatDao dao;

	@Override
	public List<Chat> selectChatListFromOne(Integer seq) throws Exception {
		// TODO Auto-generated method stub
		List<Chat> resultList = new ArrayList<Chat>();
		
		for(Chat chatRoom : dao.selectChatListFromOne(seq)) {
			chatRoom.setCuMember(seq); 
			Chat resultRoom = dao.selectChatWithoutLoginUser(chatRoom);
			if(resultRoom.getUpPath() == null) {
				resultRoom.setUpPath("/resources/images/");
				resultRoom.setUpUuidName("empty.png");
			}
			resultList.add(resultRoom);
		}
		
		return resultList;
	}

	
}
