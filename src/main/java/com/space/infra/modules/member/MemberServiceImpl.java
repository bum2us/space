package com.space.infra.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.space.infra.common.utils.UtilDateTime;
import com.space.infra.common.utils.UtilSecurity;
import com.space.infra.common.utils.UtilUpload;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDao dao;

	@Override
	public Member checkLogin(Member dto) throws Exception {
		// TODO Auto-generated method stub
		dto.setMmPassword(UtilSecurity.encryptSha256(dto.getMmPassword()));
		
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

	@Override
	public void insert(Member dto) throws Exception {
		// TODO Auto-generated method stub
		
		//패스워드 sha256암호화
		dto.setMmPassword(UtilSecurity.encryptSha256(dto.getMmPassword()));
		
		//성별 & 생년월일 적용
		switch (dto.getMmGender()) {
			case 1:
			{
				dto.setMmDob("19"+convertDob(dto.getMmDob()));
				break;
			}
			case 2:
			{
				dto.setMmDob("19"+convertDob(dto.getMmDob()));
				break;
			}
			case 3:
			{
				dto.setMmGender(1);
				dto.setMmDob("20"+convertDob(dto.getMmDob()));
				break;
			}
			case 4:
			{
				dto.setMmGender(2);
				dto.setMmDob("20"+convertDob(dto.getMmDob()));
				break;
			}
	
			default:
				break;
		}
		
		//나이 적용
		dto.setMmAge(Integer.parseInt(UtilDateTime.nowString().substring(0, 4))-Integer.parseInt(dto.getMmDob().substring(0, 4)) +1);
		
		//멤버 정보 추가
		int seq = dao.insert(dto);
		
		//프로필 이미지 업로드
		
		int j = 0;
		for(MultipartFile myFile : dto.getMultipartFile()) {
			
			if(!myFile.isEmpty()) {
				
				String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
				UtilUpload.uploadProfile(myFile, pathModule, dto);
				
				dto.setUpDefaultNy(j == 0 ? 1 : 0);
				dto.setUpSort(j+1);
				dto.setMmSeq(seq);
				
				dao.insertUpload(dto);
				j++;
			}
			
		}
	}

	private String convertDob(String dob) throws Exception{
		
		String text="";
		text += dob.substring(0,2) + "-";
		text += dob.substring(2,4) + "-";
		text += dob.substring(4,6);
		
		return text;
	}
	
	
}
