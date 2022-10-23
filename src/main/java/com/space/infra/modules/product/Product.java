package com.space.infra.modules.product;

import org.springframework.web.multipart.MultipartFile;

public class Product {
	
	private Integer pdSeq;
	private Integer pdSeller;
	private Integer pdDelNy;
	private Integer pdCategory;
	private String pdCreateDate;
	private String pdEditDate;
	private String pdContent;
	private String pdPrice;
	private MultipartFile[] multipartFile;
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
	public String getPdCreateDate() {
		return pdCreateDate;
	}
	public void setPdCreateDate(String pdCreateDate) {
		this.pdCreateDate = pdCreateDate;
	}
	public String getPdEditDate() {
		return pdEditDate;
	}
	public void setPdEditDate(String pdEditDate) {
		this.pdEditDate = pdEditDate;
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
	public MultipartFile[] getMultipartFile() {
		return multipartFile;
	}
	public void setMultipartFile(MultipartFile[] multipartFile) {
		this.multipartFile = multipartFile;
	}
	
	
}
