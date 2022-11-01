package com.space.infra.modules.member;

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

	
}
