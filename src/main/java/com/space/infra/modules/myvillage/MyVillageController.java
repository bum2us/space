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

	@RequestMapping(value = "form")
	public String MyVillageForm(HttpSession httpSession, MyVillageVo vo, Model model) throws Exception {

		vo.setMvMemberSeq((Integer) httpSession.getAttribute("sessSeq"));
		System.out.println(vo.getMvMemberSeq());
		List<MyVillage> list = service.selectListMyvillage(vo);
		model.addAttribute("list", list);
		 

		return "infra/myvillage/user/myVillageForm";
	}
	
	 @RequestMapping(value="inst") 
	 public String MyVillageInst(MyVillage dto)throws Exception {
		
		 service.insert(dto);
		 
		 return "redirect:/myVillage/form";
	 } 
	
}
