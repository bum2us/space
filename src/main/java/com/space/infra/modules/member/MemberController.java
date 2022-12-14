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
import org.springframework.web.bind.annotation.ResponseBody;

import com.space.infra.modules.base.Base;
import com.space.infra.modules.myvillage.MyVillage;
import com.space.infra.modules.myvillage.MyVillageServiceImpl;
import com.space.infra.modules.myvillage.MyVillageVo;
import com.space.infra.modules.product.Product;
import com.space.infra.modules.product.ProductServiceImpl;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;


@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
	
	@Autowired
	ProductServiceImpl serviceProduct;
	
	@Autowired 
	MyVillageServiceImpl serviceVillage;
	
	
	@RequestMapping("joinForm")
	public String joinForm(@ModelAttribute("loginCheck")Base dto) throws Exception{
		
		return "infra/member/user/joinForm";
	}
	
	@RequestMapping("memberInst")
	public String memberInst(Member dto, @ModelAttribute("loginCheck")Base base) throws Exception{
		
		service.insert(dto);
		
		return "infra/member/loginForm";
	}
	
	@RequestMapping("editProfile")
	public String editProfile(HttpSession httpSession, Member dto,Model model) throws Exception{
		 
		Member item = service.selectOne((int)httpSession.getAttribute("sessSeq"));
		model.addAttribute("item", item);
		
		return "infra/member/user/editForm";
	}
	
	@RequestMapping("memberUpdt")
	public String memberUpdt(HttpSession httpSession,Member dto,Model model) throws Exception{
	
		System.out.println("#############"); 
		System.out.println(dto.getMmNickName());
		System.out.println(dto.getMmEmail());
		System.out.println(dto.getMmPhone()); 
		System.out.println(dto.getStateKey());
		dto.setMmSeq((int)httpSession.getAttribute("sessSeq"));
		service.update(dto); 
		
		return "redirect:/member/profile"; 
	}
	
	@ResponseBody
	@RequestMapping("checkPw")
	public Map<String,Object> checkPw(HttpSession httpSession,Member dto) throws Exception {
		
		Map<String,Object> result = new HashMap<String,Object>();
		
		dto.setMmSeq((int)httpSession.getAttribute("sessSeq"));
		
		if(service.checkPw(dto) == 0) 
			result.put("rt","fail");
		else
			result.put("rt","success");
		
		return result;
	}
	
	@RequestMapping("changePw")
	public String changePw(HttpSession httpSession,Member dto) throws Exception{
		
		dto.setMmSeq((int)httpSession.getAttribute("sessSeq"));
		service.changePw(dto);
		httpSession.invalidate();
		
		return "redirect:/";
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
			httpSession.setAttribute("sessNickName", LoginMember.getMmNickName());
			
			MyVillageVo vo = new MyVillageVo();
			vo.setMvMemberSeq(LoginMember.getMmSeq());
			MyVillage LoginVillage = serviceVillage.selectOneHome(vo);
			if (LoginVillage != null) {
				httpSession.setAttribute("sessVillage", LoginVillage.getMvName());
				httpSession.setAttribute("sessVillageOrName", LoginVillage.getMvOriginalAddr());
			} else {
				
			}
			
			//httpSession.setAttribute("sessNickName", LoginMember.getMmNickName());
			
			//사용자 프로필 이미지 추가 필요
			
			result.put("mmId", LoginMember.getMmId());
			//로그인할 때 adminNy 비교 조건
			result.put("mmAdminNy", LoginMember.getMmAdminNy());
			
			result.put("mmNickName", LoginMember.getMmNickName());
		}
		
		return result;
	}
	
	@RequestMapping(value = "logout")
	public String logout(HttpSession httpSession) throws Exception {
		
		httpSession.invalidate();
		
		/* redirect로 해줘야 8081/로 온다 */
		return "redirect:/";
	}

	//휴대폰 인증
	@ResponseBody
	@RequestMapping(value = "checkPhone")
	public Map<String, Object> checkPhone(Member dto) throws Exception {
		
		Map<String,Object> result = new HashMap<String, Object>();
		
		//5자리 난수 생성
		int rndNumber = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
		System.out.println(rndNumber);
		
		
		
		DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCSEDETMOWCHUM51", "CNPNRQMYA2UNXA5B3MK5ILIZZ4A463P6", "https://api.solapi.com");
		// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
		Message message = new Message();
		System.out.println("dto.getMmPhone : " + dto.getMmPhone());
		message.setFrom("01084547909");
		message.setTo(dto.getMmPhone());
		message.setText("[우주마켓] 휴대전화 인증번호는 " + "[" + rndNumber + "]" + "입니다.");

		try {
		  // send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
		  messageService.send(message);
		} catch (NurigoMessageNotReceivedException exception) {
		  // 발송에 실패한 메시지 목록을 확인할 수 있습니다!
		  System.out.println(exception.getFailedMessageList());
		  System.out.println(exception.getMessage());
		} catch (Exception exception) {
		  System.out.println(exception.getMessage());
		}
		
		result.put("code", rndNumber);
		
		//
		
		return result;
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
