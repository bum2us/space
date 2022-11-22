package com.space.infra.modules.myvillage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.space.infra.modules.member.MemberVo;

@Controller
@RequestMapping(value = "/myVillage/")
public class MyVillageController {

	@Autowired
	MyVillageServiceImpl service;
	
	@RequestMapping(value="list")
	public String MyViilageList(HttpSession httpSession, MyVillageVo vo, Model model) throws Exception {
		vo.setMvMemberSeq((Integer) httpSession.getAttribute("sessSeq"));
		System.out.println(vo.getMvMemberSeq());
		
		List<MyVillage> list = service.selectListMyvillage(vo);
		model.addAttribute("list", list);
		
		return "infra/myvillage/user/myVillageList";
	}

	@RequestMapping(value = "form")
	public String MyVillageForm(HttpSession httpSession, MyVillageVo vo, Model model) throws Exception {
		MyVillage result = service.selectOne(vo);
		model.addAttribute("result", result);

		return "infra/myvillage/user/myVillageForm";
	}
	
	 @RequestMapping(value="inst") 
	 public String MyVillageInst(HttpSession httpSession,MyVillage dto)throws Exception {
		
		 service.insert(dto);
		 
		 httpSession.setAttribute("sessVillage", dto.getMvName());
		 
		 return "redirect:/myVillage/form";
	 } 
	 
	 @RequestMapping(value="updt")
	 public String MyVillageUpdt(HttpSession httpSession, MyVillage dto) throws Exception{
		 
		 service.update(dto);
		 httpSession.setAttribute("sessVillage", dto.getMvName());
		 return "redirect:/myVillage/form";
	 }
	
}
