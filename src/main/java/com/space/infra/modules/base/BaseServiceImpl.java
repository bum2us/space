package com.space.infra.modules.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BaseServiceImpl implements BaseService {

	
	@Autowired
	BaseDao dao;
	
}
