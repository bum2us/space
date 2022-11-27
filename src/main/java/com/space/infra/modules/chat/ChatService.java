package com.space.infra.modules.chat;

import java.util.List;

public interface ChatService {
	
	public List<Chat> selectChatListFromOne(Integer seq) throws Exception;
	public void createChatFromProduct(int productSeq, int userA, int userB) throws Exception;
}
