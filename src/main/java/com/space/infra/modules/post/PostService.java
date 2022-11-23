package com.space.infra.modules.post;

import java.util.List;

public interface PostService {
	
	public List<Post> selectList() throws Exception;

	public int insert(Post dto) throws Exception;
	
	public int selectLastSeq() throws Exception;
	
	public Post selectOne(PostVo vo) throws Exception;
	
}
