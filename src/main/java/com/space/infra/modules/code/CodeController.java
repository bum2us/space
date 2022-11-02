package com.space.infra.modules.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/code/")
@Controller
public class CodeController {
	
	@Autowired
	CodeServiceImpl service;

	@RequestMapping("codeList")
	public String codeList(CodeVo vo, Model model) throws Exception{
		
		vo.setPageTotal(service.selectOneCount(vo));
		
		List<Code> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "infra/code/xdmin/codeList";
	}
}
