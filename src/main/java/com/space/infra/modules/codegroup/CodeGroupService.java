package com.space.infra.modules.codegroup;

import java.util.List;

public interface CodeGroupService {

	public List<CodeGroup> selectList() throws Exception;
	
	public CodeGroup selectOne(CodeGroup dto) throws Exception;
}
