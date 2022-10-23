package com.space.infra.modules.live;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/live/")
public class LiveController {

	@Autowired
	LiveServiceImpl service;
	
	
}
