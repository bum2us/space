package com.space.infra.modules.myvillage;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MyVillageDao {
	
	@Inject
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private static String namespace = "com.space.infra.modules.myvillage.MyVillageMapper"; 
	
	public List<MyVillage> selectList(MyVillageVo vo){
		List<MyVillage> list = sqlSession.selectList(namespace +".selectList", vo);
		return list;
	}
	
	public MyVillage selectOne(MyVillageVo vo) {
		MyVillage result = sqlSession.selectOne(namespace + ".selectOne", vo);
		return result;
	}
	
	public int selectOneCount (MyVillageVo vo) {
		return sqlSession.selectOne(namespace +".selectOneCount", vo);
	}
	
	public int insert(MyVillage dto) {return sqlSession.insert(namespace +".insert", dto);}
	public int update(MyVillage dto) {return sqlSession.update(namespace +".update", dto);}
	public int uelete(MyVillage dto) {return sqlSession.update(namespace +".uelete", dto);}
	public int delete(MyVillageVo vo) {return sqlSession.delete(namespace +".delete", vo);}
	
	
	

}
