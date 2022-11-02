package com.space.infra.modules.code;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CodeServiceImpl implements CodeService{

	@Autowired
	CodeDao dao;
	
	@PostConstruct
	public void selectListCachedCodeList() throws Exception {
		List<Code> codeListFromDb = dao.selectListCachedCodeList();
		
		Code.cachedCodeList.clear();
		Code.cachedCodeList.addAll(codeListFromDb);
	}
	
	public static List<Code> selectListCachedCode(String key)throws Exception{
		List<Code> rt = new ArrayList<Code>();
		for(Code code : Code.cachedCodeList)
		{
			if(code.getCcGroupSeq().toString().equals(key))
				rt.add(code);				
		}
		return rt;
	}
	
	public static String selectCachedCode2Name(String key) throws Exception{
		String rt="";
		for(Code code : Code.cachedCodeList) 
		{
			if(code.getCcOrder().toString().equals(key))
				rt = code.getCcName();
		}
		return rt;
	}
}
