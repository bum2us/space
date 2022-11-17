package com.space.infra.modules.member;

import com.space.infra.modules.base.BaseVo;

public class MemberVo extends BaseVo{
	
	private Integer shGender;

	private Integer mmSeq;
	
	private Integer shOption;
	private String shValue;
	private Integer shDelNy;
	
	public Integer getShGender() {
		return shGender;
	}
	public void setShGender(Integer shGender) {
		this.shGender = shGender;
	}
	public Integer getMmSeq() {
		return mmSeq;
	}
	public void setMmSeq(Integer mmSeq) {
		this.mmSeq = mmSeq;
	}
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
	
	
	

	
}
