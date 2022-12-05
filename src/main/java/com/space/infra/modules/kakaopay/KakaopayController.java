package com.space.infra.modules.kakaopay;

import java.util.HashMap;
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

@Controller
@RequestMapping("/kakaopay/")
@SessionAttributes({"tid"})
public class KakaopayController {

	@Autowired
	KakaopayServiceImpl service;
	
	@ResponseBody
	@RequestMapping("ready")
	public Kakaopay kakaopayReady (int charge, HttpSession httpSession, Model model) throws Exception {
		
		int userSeq = (Integer)httpSession.getAttribute("sessSeq");
		
		Kakaopay kakaopayReady = service.payReady(userSeq, charge);
		model.addAttribute("tid", kakaopayReady.getTid());
		
		return kakaopayReady;
	}
	
	@RequestMapping("approval")
	public String kakaopayApproval (@RequestParam("pg_token") String pgToken, @ModelAttribute("tid") String tid, Model model, HttpSession httpSession) throws Exception{
		
		int userSeq = (Integer)httpSession.getAttribute("sessSeq");
		Kakaopay kakaopayApproval = service.payApprove(tid, pgToken, userSeq);
		
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
		
		return "redirect:/member/profile";
	}
	
	
	@RequestMapping("cancel")
	public String kakaopayCancel () throws Exception {
		return "redirect:/member/profile";
	}
	
	@RequestMapping("fail")
	public String kakaopayFail () throws Exception {
		return "redirect:/member/profile";
	}
	
	
}
