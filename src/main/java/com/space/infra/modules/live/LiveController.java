package com.space.infra.modules.live;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
