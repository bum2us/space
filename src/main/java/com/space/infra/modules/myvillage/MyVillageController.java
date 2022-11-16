package com.space.infra.modules.myvillage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/myVillage/")
public class MyVillageController {
	
	@Autowired
	MyVillageServiceImpl service;
	
	@RequestMapping(value="form")
	public String MyVillageForm() throws Exception{
		
		return "infra/myvillage/user/myVillageForm";
		
	}
		

}
