package com.space.infra.modules.member;

import com.space.infra.modules.base.BaseVo;

public class MemberVo extends BaseVo{
	
	private Integer shGender;
	private Integer mmSeq;
	
	
	
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

	
}
