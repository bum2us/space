package com.space.infra.modules.chat;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDao {
	
	@Inject
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	private String namespace = "com.space.infra.modules.chat.ChatMapper";

	public List<Chat> selectChatListFromOne(Integer seq) { return sqlSession.selectList(namespace+".selectChatListFromOne", seq);}

	public Chat selectChatWithoutLoginUser(Chat chatRoom) { return sqlSession.selectOne(namespace+".selectChatWithoutLoginUser", chatRoom); }

	public void insertChatFromProduct(Chat dto) { sqlSession.insert(namespace + ".insertChatFromProduct",dto); }

	public void insertChatUserFromProduct(Chat dto) { sqlSession.insert(namespace + ".insertChatUserFromProduct", dto); }
	
	
}
