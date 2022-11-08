package com.space.infra.modules.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.space.infra.modules.codegroup.CodeGroup;
import com.space.infra.modules.codegroup.CodeGroupServiceImpl;
import com.space.infra.modules.codegroup.CodeGroupVo;

@RequestMapping(value="/code/")
@Controller
public class CodeController { 
	
	@Autowired
	CodeServiceImpl service;

	@Autowired
	CodeGroupServiceImpl ccgService;
	 
	@RequestMapping(value="codeList")
	public String codeList(@ModelAttribute("vo")CodeVo vo, Model model) throws Exception{
		
		vo.setPageTotal(service.selectOneCount(vo));
		
		List<Code> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "infra/code/xdmin/codeList";
	}
	
	@RequestMapping(value="codeForm")
	public String codeForm(@ModelAttribute("vo")CodeVo vo,Model model) throws Exception {
		
		List<CodeGroup> list = ccgService.selectList();
		model.addAttribute("list", list);
		
		if(vo.getCcSeq() != null) {
			Code result = service.selectOne(vo);
			model.addAttribute("item", result);
		}
		return "infra/code/xdmin/codeForm";
	}
	
	@RequestMapping(value="codeInst")
	public String codeInst(Code dto) throws Exception {
		service.insert(dto);
		return "redirect:/code/codeList";
	}
	
	@RequestMapping(value="codeUpdt")
	public String codeUpdt(Code dto, Model model) throws Exception {
		service.update(dto);
		return "redirect:/code/codeList";
	}
	
	@RequestMapping(value="codeDele")
	public String codeDele(CodeVo vo) throws Exception {
		service.delete(vo);
		return "redirect:/code/codeList";
	}    
	
	@RequestMapping(value="codeUete")
	public String codeUete(Code dto) throws Exception {
		service.uelete(dto);
		return "redirect:/code/codeList";
	}
	
	
	
	
	
}
