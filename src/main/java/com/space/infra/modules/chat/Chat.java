package com.space.infra.modules.chat;

public class Chat {
	
	private Integer chatSeq;
	private Integer chatDelNy;
	private Integer cuMember;
	private Integer chatProductSeq;
	private String chatCreateDate;
	
	//채팅 맴버 정보 추출을 위한 필드 
	private Integer mmSeq;
	private String mmNickName;
	private String upPath;
	private String upUuidName;

	//채팅 상품 정보 추출을 위한 필드
	private Integer pdSeq;
	private Integer pdState;
	private String pdTitle;
	private String pdPrice;
	private String pdPath;
	private String pdUuidName;
	
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
	public Integer getChatProductSeq() {
		return chatProductSeq;
	}
	public void setChatProductSeq(Integer chatProductSeq) {
		this.chatProductSeq = chatProductSeq;
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
	public Integer getPdSeq() {
		return pdSeq;
	}
	public void setPdSeq(Integer pdSeq) {
		this.pdSeq = pdSeq;
	}
	public Integer getPdState() {
		return pdState;
	}
	public void setPdState(Integer pdState) {
		this.pdState = pdState;
	}
	public String getPdTitle() {
		return pdTitle;
	}
	public void setPdTitle(String pdTitle) {
		this.pdTitle = pdTitle;
	}
	public String getPdPrice() {
		return pdPrice;
	}
	public void setPdPrice(String pdPrice) {
		this.pdPrice = pdPrice;
	}
	public String getPdPath() {
		return pdPath;
	}
	public void setPdPath(String pdPath) {
		this.pdPath = pdPath;
	}
	public String getPdUuidName() {
		return pdUuidName;
	}
	public void setPdUuidName(String pdUuidName) {
		this.pdUuidName = pdUuidName;
	}
	
	
	
}
