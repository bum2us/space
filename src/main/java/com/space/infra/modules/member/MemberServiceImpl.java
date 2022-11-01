package com.space.infra.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDao dao;

	@Override
	public Member checkLogin(Member dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.checkLogin(dto);
	}

	@Override
	public List<Member> selectList(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectList(vo);
	}

	@Override
	public Integer selectListCount(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectListCount(vo);
	}

	
	
}
