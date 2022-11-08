package com.space.infra.modules.post;

import org.springframework.web.multipart.MultipartFile;

import com.space.infra.modules.base.Base;

public class Post extends Base{
	
	private Integer postSeq;
	private Integer postWriter;
	private Integer postDelNy;
	private Integer postCategory;
	private Integer postLat; //경도
	private Integer postLng; //위도
	private String  postCreateDate;
	private String  postEditDate;
	private String  postContent;
	
	
	public Integer getPostSeq() {
		return postSeq;
	}
	public void setPostSeq(Integer postSeq) {
		this.postSeq = postSeq;
	}
	public Integer getPostWriter() {
		return postWriter;
	}
	public void setPostWriter(Integer postWriter) {
		this.postWriter = postWriter;
	}
	public Integer getPostDelNy() {
		return postDelNy;
	}
	public void setPostDelNy(Integer postDelNy) {
		this.postDelNy = postDelNy;
	}
	public Integer getPostCategory() {
		return postCategory;
	}
	public void setPostCategory(Integer postCategory) {
		this.postCategory = postCategory;
	}
	public Integer getPostLat() {
		return postLat;
	}
	public void setPostLat(Integer postLat) {
		this.postLat = postLat;
	}
	public Integer getPostLng() {
		return postLng;
	}
	public void setPostLng(Integer postLng) {
		this.postLng = postLng;
	}
	public String getPostCreateDate() {
		return postCreateDate;
	}
	public void setPostCreateDate(String postCreateDate) {
		this.postCreateDate = postCreateDate;
	}
	public String getPostEditDate() {
		return postEditDate;
	}
	public void setPostEditDate(String postEditDate) {
		this.postEditDate = postEditDate;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	
	
}
