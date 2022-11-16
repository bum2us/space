package com.space.infra.modules.myvillage;

import com.space.infra.modules.base.Base;

public class MyVillage extends Base {
	
	private String mvSeq;
	private String mvName;
	private String mvMemberSeq;
	private Integer mvDefaultNy;
	private Integer mvDelNy;
	private String mvCreateDate;
	
	
	public String getMvSeq() {
		return mvSeq;
	}
	public void setMvSeq(String mvSeq) {
		this.mvSeq = mvSeq;
	}
	public String getMvName() {
		return mvName;
	}
	public void setMvName(String mvName) {
		this.mvName = mvName;
	}
	public String getMvMemberSeq() {
		return mvMemberSeq;
	}
	public void setMvMemberSeq(String mvMemberSeq) {
		this.mvMemberSeq = mvMemberSeq;
	}
	public Integer getMvDefaultNy() {
		return mvDefaultNy;
	}
	public void setMvDefaultNy(Integer mvDefaultNy) {
		this.mvDefaultNy = mvDefaultNy;
	}
	public Integer getMvDelNy() {
		return mvDelNy;
	}
	public void setMvDelNy(Integer mvDelNy) {
		this.mvDelNy = mvDelNy;
	}
	public String getMvCreateDate() {
		return mvCreateDate;
	}
	public void setMvCreateDate(String mvCreateDate) {
		this.mvCreateDate = mvCreateDate;
	}

}
