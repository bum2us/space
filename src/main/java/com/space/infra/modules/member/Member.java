package com.space.infra.modules.member;

import org.springframework.web.multipart.MultipartFile;

public class Member {
	
	private Integer mmSeq;
	private Integer mmGender;
	private Integer mmAge;
	private Integer mmTelecom;
	private String mmName;
	private String mmId;
	private String mmPassword;
	private String mmPhoneNumber;
	private String mmEmail;
	private String mmCreateDate;
	private String mmDob;

	private MultipartFile[] multipartFile;
	
	public Integer getMmSeq() {
		return mmSeq;
	}
	public void setMmSeq(Integer mmSeq) {
		this.mmSeq = mmSeq;
	}
	public Integer getMmGender() {
		return mmGender;
	}
	public void setMmGender(Integer mmGender) {
		this.mmGender = mmGender;
	}
	public Integer getMmAge() {
		return mmAge;
	}
	public void setMmAge(Integer mmAge) {
		this.mmAge = mmAge;
	}
	public Integer getMmTelecom() {
		return mmTelecom;
	}
	public void setMmTelecom(Integer mmTelecom) {
		this.mmTelecom = mmTelecom;
	}
	public String getMmName() {
		return mmName;
	}
	public void setMmName(String mmName) {
		this.mmName = mmName;
	}
	public String getMmId() {
		return mmId;
	}
	public void setMmId(String mmId) {
		this.mmId = mmId;
	}
	public String getMmPassword() {
		return mmPassword;
	}
	public void setMmPassword(String mmPassword) {
		this.mmPassword = mmPassword;
	}
	public String getMmPhoneNumber() {
		return mmPhoneNumber;
	}
	public void setMmPhoneNumber(String mmPhoneNumber) {
		this.mmPhoneNumber = mmPhoneNumber;
	}
	public String getMmEmail() {
		return mmEmail;
	}
	public void setMmEmail(String mmEmail) {
		this.mmEmail = mmEmail;
	}
	public String getMmCreateDate() {
		return mmCreateDate;
	}
	public void setMmCreateDate(String mmCreateDate) {
		this.mmCreateDate = mmCreateDate;
	}
	public String getMmDob() {
		return mmDob;
	}
	public void setMmDob(String mmDob) {
		this.mmDob = mmDob;
	}
	public MultipartFile[] getMultipartFile() {
		return multipartFile;
	}
	public void setMultipartFile(MultipartFile[] multipartFile) {
		this.multipartFile = multipartFile;
	}

	
	
}
