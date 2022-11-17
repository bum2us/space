package com.space.infra.modules.chat;

public class Chat {
	
	private Integer chatSeq;
	private Integer chatDelNy;
	private Integer cuMember;
	private String chatCreateDate;
	
	//채팅 맴버 정보 추출을 위한 필드 
	private Integer mmSeq;
	private String mmNickName;
	private String upPath;
	private String upUuidName;
	
	public Integer getChatSeq() {
		return chatSeq;
	}
	public void setChatSeq(Integer chatSeq) {
		this.chatSeq = chatSeq;
	}
	public Integer getChatDelNy() {
		return chatDelNy;
	}
	public void setChatDelNy(Integer chatDelNy) {
		this.chatDelNy = chatDelNy;
	}
	public Integer getCuMember() {
		return cuMember;
	}
	public void setCuMember(Integer cuMember) {
		this.cuMember = cuMember;
	}
	public String getChatCreateDate() {
		return chatCreateDate;
	}
	public void setChatCreateDate(String chatCreateDate) {
		this.chatCreateDate = chatCreateDate;
	}
	public Integer getMmSeq() {
		return mmSeq;
	}
	public void setMmSeq(Integer mmSeq) {
		this.mmSeq = mmSeq;
	}
	public String getMmNickName() { 
		return mmNickName;
	}
	public void setMmNickName(String mmNickName) {
		this.mmNickName = mmNickName;
	}
	public String getUpPath() {
		return upPath;
	}
	public void setUpPath(String upPath) {
		this.upPath = upPath;
	}
	public String getUpUuidName() {
		return upUuidName;
	}
	public void setUpUuidName(String upUuidName) {
		this.upUuidName = upUuidName;
	}
	
	
	
}
