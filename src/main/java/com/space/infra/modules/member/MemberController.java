package com.space.infra.modules.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.space.infra.modules.myvillage.MyVillage;
import com.space.infra.modules.myvillage.MyVillageServiceImpl;
import com.space.infra.modules.myvillage.MyVillageVo;
import com.space.infra.modules.product.Product;
import com.space.infra.modules.product.ProductServiceImpl;

@Controller
@RequestMapping("/member/")
@SessionAttributes({"tid","dto"})
public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
	
	@Autowired
	ProductServiceImpl serviceProduct;
	
	@Autowired 
	MyVillageServiceImpl serviceVillage;
	
	@ModelAttribute("dto")
	public Member setEmptyMember() {
		return new Member();
	}
	
	@RequestMapping("joinForm")
	public String joinForm() throws Exception{
		
		return "infra/member/user/joinForm";
	}
	
	@RequestMapping("memberInst")
	public String memberInst(Member dto) throws Exception{
		
		service.insert(dto);
		
		return "infra/member/loginForm";
	}
	
	@RequestMapping("profile")
	public String profile(HttpSession httpSession,Member dto,Model model) throws Exception{
		
		Member item = new Member(); 
		
		if(dto.getMmSeq() != null) {
			//다른 사람의 프로필로 갈 때
			item = service.selectOne(dto.getMmSeq());
		}else {
			//나의 프로필로 갈 때
			int loginUserSeq = (Integer)httpSession.getAttribute("sessSeq");
			
			item = service.selectOne(loginUserSeq);
		}
		if(item.getUpPath() == null) {
			item.setUpPath("/resources/images/");
			item.setUpUuidName("empty.png");
		}
		model.addAttribute("item", item);
		
		Product seller = new Product();
		seller.setPdSeller(item.getMmSeq());
		
		List<Product> saleList = serviceProduct.selectSaleListFromMember(seller);
		model.addAttribute("saleList", saleList);
		
		List<Product> buyList = serviceProduct.selectBuyListFromMember(seller);
		model.addAttribute("buyList", buyList);
		return "infra/member/user/myPage";
	}
	
	@ResponseBody
	@RequestMapping("login")
	public Map<String,Object> login(HttpSession httpSession, Member dto) throws Exception{
		
		Map<String,Object> result = new HashMap<String,Object>();
		Member LoginMember = service.checkLogin(dto);
		
		if(LoginMember == null) {
			//로그인 실패
			result.put("rt","fail");
		}else {
			//로그인 성공
			result.put("rt","success");
			
			httpSession.setAttribute("sessSeq",LoginMember.getMmSeq());
			httpSession.setAttribute("sessId", LoginMember.getMmId());
			httpSession.setAttribute("sessName", LoginMember.getMmName());
			
			MyVillageVo vo = new MyVillageVo();
			vo.setMvMemberSeq(LoginMember.getMmSeq());
			MyVillage LoginVillage = serviceVillage.selectOneHome(vo);
			if (LoginVillage != null) {
				httpSession.setAttribute("sessVillage", LoginVillage.getMvName());
			} else {
				
			}
			
			//httpSession.setAttribute("sessNickName", LoginMember.getMmNickName());
			
			//사용자 프로필 이미지 추가 필요
			
			result.put("mmId", LoginMember.getMmId());
			//로그인할 때 adminNy 비교 조건
			result.put("mmAdminNy", LoginMember.getMmAdminNy());
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("logout")
	public Map<String, Object> logout(HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		httpSession.invalidate();
		
		returnMap.put("rt", "success");
		return returnMap;
	}
	
	//카카오페이
	@ResponseBody
	@RequestMapping("kakaopayReady")
	public KakaopayReady kakaopayReady (@ModelAttribute("dto") Member dto, int charge , Model model) throws Exception {
		KakaopayReady kakaopayReady = service.payReady(dto, charge);
		model.addAttribute("tid", kakaopayReady.getTid());
		return kakaopayReady;
	}
	
	@RequestMapping("kakaopayApproval")
	public String kakaopayApproval (@RequestParam("pg_token") String pgToken, @ModelAttribute("tid") String tid, @ModelAttribute("dto") Member dto, Model model, HttpSession httpSession) throws Exception {
		
		KakaopayApproval kakaopayApproval = service.payApprove(tid, pgToken, dto); 
		
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> map = objectMapper.convertValue(kakaopayApproval, Map.class);
		
		for(String key : map.keySet()) {
			String value = String.valueOf(map.get(key));
			System.out.println("[key]: " + key + ", [value]: " + value);
		}
		
		Map<String, Object> amount = new HashMap<String, Object>();
		amount = (Map<String, Object>) map.get("amount");
		
		for (String key : amount.keySet()) {
			String value= String.valueOf(amount.get(key));
			System.out.println("[key]: " + key + ", [value]: " + value);
		}
		
		model.addAttribute(map);
		model.addAllAttributes(amount);
		
		dto.setMmSeq((Integer)httpSession.getAttribute("sessSeq"));
			
		
		
		return "redirect:/member/profile";
	}
	
	@RequestMapping("kakaopayCancel")
	public String kakaopayCancel () throws Exception {
		return "redirect:/member/profile";
	}
	
	@RequestMapping("kakaopayFail")
	public String kakaopayFail () throws Exception {
		return "redirect:/member/profile";
	}
	
	
	
	
	
	/* ====================admin======================== */
	
	
	@RequestMapping("memberList")
	public String memberList(Model model,@ModelAttribute("vo") MemberVo vo) throws Exception{
		
		vo.setPageTotal(service.selectListCount(vo));
		
		List<Member> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "infra/member/xdmin/memberList";
	}
	
}
