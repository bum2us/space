package com.space.infra.modules.myvillage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyVillageServiceImpl implements MyVillageService {
	
	@Autowired
	MyVillageDao dao;

	@Override
	public List<MyVillage> selectList(MyVillageVo vo) throws Exception {
		List<MyVillage> list = dao.selectList(vo);
		return list;
	}

	@Override
	public List<MyVillage> selectListMyvillage(MyVillageVo vo) throws Exception {
		List<MyVillage> list = dao.selectListMyvillage(vo);
		return list;
	}


	@Override
	public MyVillage selectOne(MyVillageVo vo) throws Exception {
		MyVillage result = dao.selectOne(vo);
		return result;
	}

	@Override
	public int selectOneCount(MyVillageVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}

	@Override
	public int insert(MyVillage dto) throws Exception {
		return dao.insert(dto);
	}

	@Override
	public int update(MyVillage dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public int uelete(MyVillage dto) throws Exception {
		return dao.uelete(dto);
	}

	@Override
	public int delete(MyVillageVo vo) throws Exception {
		return dao.delete(vo);
	}
	
	

}
