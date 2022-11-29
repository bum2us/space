package com.space.infra.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
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
	public Member selectOne(int loginUserSeq) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectOne(loginUserSeq);
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
		dao.insert(dto);
		
		//프로필 이미지 업로드
		
		int j = 0;
		for(MultipartFile myFile : dto.getMultipartFile()) {
			
			if(!myFile.isEmpty()) {
				
				String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
				UtilUpload.uploadProfile(myFile, pathModule, dto);
				
				dto.setUpDefaultNy(j == 0 ? 1 : 0);
				dto.setUpSort(j+1);
				dto.setMmSeq(dto.getMmSeq());
				
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

	//카카오페이
	
	private HttpHeaders getHeaders() throws Exception {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK c0b2a7239234c285bdcc170038a30e92");
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		return headers;
	}
	public KakaopayReady payReady(Member dto) throws Exception {
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", "spaceMarket");
		params.add("partner_user_id", "spaceMarket");
		params.add("item_name", "");
		params.add("quantity", "");
		params.add("total_amount", "");
		params.add("item_code", "");
		params.add("tax_free_amount", "");
		params.add("approval_url", "https://localhost:8081/member/kakaopayApproval");
		params.add("cancel_url", "https://localhost:8081/member/kakaopayCancel");
		params.add("fail_url", "https://localhost:8081/member/kakaopayFail");
		
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params,this.getHeaders());
		
		RestTemplate template = new RestTemplate();
		String url = "https://kapi.kakao.com/v1/payment/ready"; 
		
		KakaopayReady kakaopayReady = template.postForObject(url, body, KakaopayReady.class);
		
		return kakaopayReady;
	}
	
	public KakaopayApproval payApprove (String tid, String pgToken, Member dto) throws Exception {
		
		//request값 담기
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", tid);
		params.add("partner_order_id", "spaceMarket"); // 주문명
		params.add("partner_user_id", "spaceMarket");
		params.add("pg_token", pgToken);
		
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(params, this.getHeaders());
		
		RestTemplate template = new RestTemplate();
		String url = "https://kapi.kakao.com/v1/payment/approve";
		
		KakaopayApproval kakaopayApproval = template.postForObject(url, requestEntity, KakaopayApproval.class);
		
		return kakaopayApproval;
	}

	
	
	
}
