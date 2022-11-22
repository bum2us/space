package com.space.infra.modules.post;

import com.space.infra.modules.base.Base;

public class Post extends Base{
	
	private Integer poSeq;
	private Integer poWriter;
	private String poTitle;
	private String  poContent;
	private Integer poCategory;
	private String poAddr;
	private double poLat; //경도
	private double poLng; //위도
	private String  poCreateDate;
	private String  poEditDate;
	private Integer poDelNy;
	
	private String mmNickName;
	
	public Integer getPoSeq() {
		return poSeq;
	}
	public void setPoSeq(Integer poSeq) {
		this.poSeq = poSeq;
	}
	public Integer getPoWriter() {
		return poWriter;
	}
	public void setPoWriter(Integer poWriter) {
		this.poWriter = poWriter;
	}
	public Integer getPoDelNy() {
		return poDelNy;
	}
	public void setPoDelNy(Integer poDelNy) {
		this.poDelNy = poDelNy;
	}
	public Integer getPoCategory() {
		return poCategory;
	}
	public void setPoCategory(Integer poCategory) {
		this.poCategory = poCategory;
	}
	public double getPoLat() {
		return poLat;
	}
	public void setPoLat(double poLat) {
		this.poLat = poLat;
	}
	public double getPoLng() {
		return poLng;
	}
	public void setPoLng(double poLng) {
		this.poLng = poLng;
	}
	public String getPoCreateDate() {
		return poCreateDate;
	}
	public void setPoCreateDate(String poCreateDate) {
		this.poCreateDate = poCreateDate;
	}
	public String getPoEditDate() {
		return poEditDate;
	}
	public void setPoEditDate(String poEditDate) {
		this.poEditDate = poEditDate;
	}
	public String getPoContent() {
		return poContent;
	}
	public void setPoContent(String poContent) {
		this.poContent = poContent;
	}
	public String getPoTitle() {
		return poTitle;
	}
	public void setPoTitle(String poTitle) {
		this.poTitle = poTitle;
	}
	public String getPoAddr() {
		return poAddr;
	}
	public void setPoAddr(String poAddr) {
		this.poAddr = poAddr;
	}
	public String getMmNickName() {
		return mmNickName;
	}
	public void setMmNickName(String mmNickName) {
		this.mmNickName = mmNickName;
	}
	
	
}
