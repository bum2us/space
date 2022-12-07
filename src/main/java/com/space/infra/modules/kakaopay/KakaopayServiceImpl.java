package com.space.infra.modules.kakaopay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.space.infra.modules.member.MemberDao;

@Service
public class KakaopayServiceImpl {
	
	@Autowired 
	MemberDao dao;
	
	//카카오페이
	
		private HttpHeaders getHeaders() throws Exception {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Authorization", "KakaoAK c0b2a7239234c285bdcc170038a30e92");
			headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			
			return headers;
		}
		
		public Kakaopay payReady(int userSeq, int charge) throws Exception {
			MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
			
			params.add("cid", "TC0ONETIME");
			params.add("partner_order_id", "spaceMarket");
			params.add("partner_user_id", ""+userSeq);
			params.add("item_name", "wouldyouMoney");
			params.add("quantity", "1");
			params.add("total_amount", ""+charge);
			params.add("tax_free_amount", "0");
			params.add("approval_url", "http://3.37.61.229:8081/kakaopay/approval");
			params.add("cancel_url", "http://3.37.61.229:8081/kakaopay/cancel");
			params.add("fail_url", "http://3.37.61.229:8081/kakaopay/fail");
			
			HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params,this.getHeaders());
			
			RestTemplate template = new RestTemplate();
			String url = "https://kapi.kakao.com/v1/payment/ready"; 
			
			Kakaopay kakaopayReady = template.postForObject(url, body, Kakaopay.class);
			
			return kakaopayReady;
		}
		
		public Kakaopay payApprove (String tid, String pgToken, int userSeq) throws Exception {
			
			//request값 담기
			MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
			params.add("cid", "TC0ONETIME");
			params.add("tid", tid);
			params.add("partner_order_id", "spaceMarket"); // 주문명
			params.add("partner_user_id", ""+userSeq);
			params.add("pg_token", pgToken);
			
			HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(params, this.getHeaders());
			
			RestTemplate template = new RestTemplate();
			String url = "https://kapi.kakao.com/v1/payment/approve";
			
			Kakaopay kakaopayApproval = template.postForObject(url, requestEntity, Kakaopay.class);
			
			return kakaopayApproval;
		}
	
	

}
