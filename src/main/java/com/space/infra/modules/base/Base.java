package com.space.infra.modules.base;

public class Base {

	
	// 인덱스 페이지 사용자/관리자 선택 Key	
	private Integer xdminNy;

	public Integer getXdminNy() {
		return xdminNy;
	}
	public void setXdminNy(Integer xdminNy) {
		this.xdminNy = xdminNy;
	}
	
	// 파일 업로드용 필드
	private String  upPath;
	private String  upOriginalName;
	private String  upUuidName;
	private String  upExt;
	private String  upSize;
	private Integer upSeq;
	private Integer upDefaultNy;
	private Integer upSort;
	private Integer upDelNy;

	public String getUpPath() {
		return upPath;
	}
	public void setUpPath(String upPath) {
		this.upPath = upPath;
	}
	public String getUpOriginalName() {
		return upOriginalName;
	}
	public void setUpOriginalName(String upOriginalName) {
		this.upOriginalName = upOriginalName;
	}
	public String getUpUuidName() {
		return upUuidName;
	}
	public void setUpUuidName(String upUuidName) {
		this.upUuidName = upUuidName;
	}
	public String getUpExt() {
		return upExt;
	}
	public void setUpExt(String upExt) {
		this.upExt = upExt;
	}
	public String getUpSize() {
		return upSize;
	}
	public void setUpSize(String upSize) {
		this.upSize = upSize;
	}
	public Integer getUpSeq() {
		return upSeq;
	}
	public void setUpSeq(Integer upSeq) {
		this.upSeq = upSeq;
	}
	public Integer getUpDefaultNy() {
		return upDefaultNy;
	}
	public void setUpDefaultNy(Integer upDefaultNy) {
		this.upDefaultNy = upDefaultNy;
	}
	public Integer getUpSort() {
		return upSort;
	}
	public void setUpSort(Integer upSort) {
		this.upSort = upSort;
	}
	public Integer getUpDelNy() {
		return upDelNy;
	}
	public void setUpDelNy(Integer upDelNy) {
		this.upDelNy = upDelNy;
	}
	
}
