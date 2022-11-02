package com.space.infra.modules.code;

import java.util.ArrayList;
import java.util.List;

import com.space.infra.modules.base.Base;

public class Code extends Base{

	public static List<Code> cachedCodeList = new ArrayList<Code>();
	
	private String ccName;
	private Integer ccSeq;
	private Integer ccGroupSeq;
	private Integer ccDelNy;
	private Integer ccUseNy;
	private Integer ccOrder;
	public static List<Code> getCachedCodeList() {
		return cachedCodeList;
	}
	public static void setCachedCodeList(List<Code> cachedCodeList) {
		Code.cachedCodeList = cachedCodeList;
	}
	public String getCcName() {
		return ccName;
	}
	public void setCcName(String ccName) {
		this.ccName = ccName;
	}
	public Integer getCcSeq() {
		return ccSeq;
	}
	public void setCcSeq(Integer ccSeq) {
		this.ccSeq = ccSeq;
	}
	public Integer getCcGroupSeq() {
		return ccGroupSeq;
	}
	public void setCcGroupSeq(Integer ccGroupSeq) {
		this.ccGroupSeq = ccGroupSeq;
	}
	public Integer getCcDelNy() {
		return ccDelNy;
	}
	public void setCcDelNy(Integer ccDelNy) {
		this.ccDelNy = ccDelNy;
	}
	public Integer getCcUseNy() {
		return ccUseNy;
	}
	public void setCcUseNy(Integer ccUseNy) {
		this.ccUseNy = ccUseNy;
	}
	public Integer getCcOrder() {
		return ccOrder;
	}
	public void setCcOrder(Integer ccOrder) {
		this.ccOrder = ccOrder;
	}
	
	
}
