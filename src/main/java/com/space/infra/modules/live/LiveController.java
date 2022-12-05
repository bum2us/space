package com.space.infra.modules.live;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.space.infra.modules.product.Product;

@Controller
@RequestMapping("/live/")
public class LiveController {

	@Autowired
	LiveServiceImpl service;
	
	@RequestMapping(value="liveList")
	public String liveList(LiveVo vo,Model model)throws Exception {
		
		vo.setPageTotal(service.selectListCount(vo));
		
		List<Live> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "infra/live/xdmin/liveList";
	}
	
	@RequestMapping(value="view")
	public String view(Live dto,Model model)throws Exception {
				
		Live item = service.selectOne(dto);
		model.addAttribute("item", item);
		
		return "infra/live/user/liveView";
	}
	
	@RequestMapping(value="form")
	public String form(@ModelAttribute("product")Product dto,Model model)throws Exception {
		
		//랜덤 코드 생성
		//숫자 : 0 ~ 9
		//-> 아스키코드 : 48 ~ 57
		//영문 : A ~ Z
		//-> 아스키코드 : 65 ~ 90
		//영문 : a ~ z
		//-> 아스키코드 : 97 ~ 122
		Random random = new Random();
	    String code = random.ints(48, 122 + 1)
	                                   .filter(i -> (48 <= i && i <= 57) || (97 <= i && i <= 122))
	                                   .limit(10)
	                                   .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
	                                   .toString();
	    System.out.println(code);
		model.addAttribute("code", code);
		
		return "infra/live/user/liveForm";
	}
	
	@ResponseBody 
	@RequestMapping(value="inst")
	public Map<String,Object> inst(HttpSession httpSession,Live dto,Model model)throws Exception {
		
		Map<String,Object> result = new HashMap<String,Object>();
		
		service.insert(dto);
		
		result.put("seq", dto.getLiveSeq());
		
		return result;
	}
	
	@RequestMapping(value="delete")
	public String delete(HttpSession httpSession,Live dto,Model model)throws Exception {
		
		
		return "infra/product/user/productView";
	}
}
