package com.space.infra.modules.post;

import java.util.List;

public interface PostService {
	
	public List<Post> selectList() throws Exception;

	public int insert(Post dto) throws Exception;
	
	public int selectLastSeq() throws Exception;
	
	public Post selectOne(Post dto) throws Exception;
	
	public int update(Post dto) throws Exception;
	
	public List<Post> selectPostImage(Post dto) throws Exception;
	public Integer selectCount()throws Exception;
}
