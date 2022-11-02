package com.space.infra.modules.code;

import com.space.infra.modules.base.BaseVo;

public class CodeVo extends BaseVo {

	private String ccSeq;
	private String cgSeq;

	public String getCgSeq() {
		return cgSeq;
	}

	public void setCgSeq(String cgSeq) {
		this.cgSeq = cgSeq;
	}

	public String getCcSeq() {
		return ccSeq;
	}

	public void setCcSeq(String ccSeq) {
		this.ccSeq = ccSeq;
	}
}
