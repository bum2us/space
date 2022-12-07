package com.space.infra.modules.post;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PostDao {

	
	@Inject
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	private String namespace = "com.space.infra.modules.post.PostMapper";
	
	public List<Post> selectList() throws Exception { return sqlSession.selectList(namespace + ".selectList", "");}
	
	public int insert(Post dto) throws Exception { return sqlSession.insert(namespace + ".insert", dto);}
	
	public int selectLastSeq() throws Exception {return sqlSession.selectOne(namespace + ".selectLastSeq", "");}
	
	public Post selectOne(Post dto) throws Exception {return sqlSession.selectOne(namespace + ".selectOne", dto);}
	
	public int insertUpload(Post dto) {return sqlSession.insert(namespace + ".insertUpload", dto);}
	
	public int update(Post dto) {return sqlSession.update(namespace + ".update", dto);}
	
	public List<Post> selectPostImage(Post dto) throws Exception {return sqlSession.selectList(namespace + ".selectPostImage", dto);}
	
	
	
	
}
