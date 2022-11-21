package com.space.infra.modules.myvillage;

import java.util.List;

public interface MyVillageService {

	public List<MyVillage> selectList (MyVillageVo vo) throws Exception;
	public List<MyVillage> selectListMyvillage(MyVillageVo vo) throws Exception;
	public MyVillage selectOne (MyVillageVo vo) throws Exception;
	public MyVillage selectOneHome (MyVillageVo vo) throws Exception;
	public int selectOneCount (MyVillageVo vo) throws Exception;
	
	
	public int insert(MyVillage dto) throws Exception;
	public int update(MyVillage dto) throws Exception;
	public int uelete(MyVillage dto) throws Exception;
	public int delete(MyVillageVo vo) throws Exception;
	
	
}
