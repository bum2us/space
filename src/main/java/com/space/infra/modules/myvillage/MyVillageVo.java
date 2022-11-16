package com.space.infra.modules.myvillage;

import com.space.infra.modules.base.BaseVo;

public class MyVillageVo  extends BaseVo {
	
	private Integer shOption;
	private String shValue;
	private Integer shDelNy;
	
	private String mvSeq;

	public Integer getShOption() {
		return shOption;
	}

	public void setShOption(Integer shOption) {
		this.shOption = shOption;
	}

	public String getShValue() {
		return shValue;
	}

	public void setShValue(String shValue) {
		this.shValue = shValue;
	}

	public Integer getShDelNy() {
		return shDelNy;
	}

	public void setShDelNy(Integer shDelNy) {
		this.shDelNy = shDelNy;
	}

	public String getMvSeq() {
		return mvSeq;
	}

	public void setMvSeq(String mvSeq) {
		this.mvSeq = mvSeq;
	}

}
