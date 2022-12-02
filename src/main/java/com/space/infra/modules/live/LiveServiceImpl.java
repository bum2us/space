package com.space.infra.modules.live;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service	
public class LiveServiceImpl implements LiveService{

	
	@Autowired
	LiveDao dao;

	@Override
	public List<Live> selectList(LiveVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectList(vo);
	}

	@Override
	public Integer selectListCount(LiveVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectListCount(vo);
	}

	@Override
	public void insert(Live dto) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(dto);
	}

	@Override
	public List<Live> selectListForHome() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectListForHome();
	}

	@Override
	public Live selectOne(Live dto) throws Exception {
		// TODO Auto-generated method stub
		Live result = dao.selectOne(dto);
		
		if(result.getMemberPath() == null) {
			result.setMemberPath("/resources/images/");
			result.setMemberUuidName("empty.png");
		}
		
		return result;
	}

	
	
}
