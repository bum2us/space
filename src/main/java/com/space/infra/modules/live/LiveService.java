package com.space.infra.modules.live;

import java.util.List;

public interface LiveService {

	public List<Live> selectList(LiveVo vo) throws Exception;

	public Integer selectListCount(LiveVo vo) throws Exception;
	
	public void insert(Live dto) throws Exception;
	
	public List<Live>  selectListForHome() throws Exception;
	
	public Live selectOne(Live dto) throws Exception;
}
