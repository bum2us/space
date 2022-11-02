package com.space.infra.modules.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/codeGroup/")
@Controller
public class CodeGroupController {

	@Autowired
	CodeGroupServiceImpl service;
	
	@RequestMapping("codeGroupList")
	public String codeGroupList(Model model) throws Exception{
		
		List<CodeGroup> list = service.selectList();
		model.addAttribute("list", list);
		
		return "infra/member/xdmin/codeGroupList";
	}
	
	@RequestMapping("codeGroupView")
	public String codeGroupView(CodeGroup dto) throws Exception{
		
		service.selectOne(dto);
		
		return "infra/member/xdmin/codeGroupView";
	}
}
