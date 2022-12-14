package com.space.infra.modules.member;

import java.util.List;

public interface MemberService {

	public Member checkLogin(Member dto) throws Exception;
	public List<Member> selectList(MemberVo vo) throws Exception;
	public Integer selectListCount(MemberVo vo) throws Exception;
	public void insert(Member dto) throws Exception;
	public void update(Member dto) throws Exception;
	public Member selectOne(int loginUserSeq) throws Exception;
	public int checkPw(Member dto) throws Exception;
	public void changePw(Member dto) throws Exception;
	public Integer selectCount()throws Exception;
}
