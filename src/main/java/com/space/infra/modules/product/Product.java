package com.space.infra.modules.product;


import com.space.infra.modules.base.Base;

public class Product extends Base{
	
	private Integer pdSeq;
	private Integer pdSeller;
	private Integer pdType;
	private Integer pdState;
	private Integer pdDelNy;
	private Integer pdCategory;
	private String pdTitle;
	private String pdCreateDate;
	private String pdContent;
	private String pdPrice;
	
	private String mmNickName;
	
	public Integer getPdSeq() {
		return pdSeq;
	}
	public void setPdSeq(Integer pdSeq) {
		this.pdSeq = pdSeq;
	}
	public Integer getPdSeller() {
		return pdSeller;
	}
	public void setPdSeller(Integer pdSeller) {
		this.pdSeller = pdSeller;
	}
	public Integer getPdType() {
		return pdType;
	}
	public void setPdType(Integer pdType) {
		this.pdType = pdType;
	}
	public Integer getPdState() {
		return pdState;
	}
	public void setPdState(Integer pdState) {
		this.pdState = pdState;
	}
	public Integer getPdDelNy() {
		return pdDelNy;
	}
	public void setPdDelNy(Integer pdDelNy) {
		this.pdDelNy = pdDelNy;
	}
	public Integer getPdCategory() {
		return pdCategory;
	}
	public void setPdCategory(Integer pdCategory) {
		this.pdCategory = pdCategory;
	}
	public String getPdTitle() {
		return pdTitle;
	}
	public void setPdTitle(String pdTitle) {
		this.pdTitle = pdTitle;
	}
	public String getPdCreateDate() {
		return pdCreateDate;
	}
	public void setPdCreateDate(String pdCreateDate) {
		this.pdCreateDate = pdCreateDate;
	}
	public String getPdContent() {
		return pdContent;
	}
	public void setPdContent(String pdContent) {
		this.pdContent = pdContent;
	}
	public String getPdPrice() {
		return pdPrice;
	}
	public void setPdPrice(String pdPrice) {
		this.pdPrice = pdPrice;
	}
	public String getMmNickName() {
		return mmNickName;
	}
	public void setMmNickName(String mmNickName) {
		this.mmNickName = mmNickName;
	}
	
	
	
}
