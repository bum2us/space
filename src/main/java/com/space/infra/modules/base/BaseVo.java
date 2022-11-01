package com.space.infra.modules.base;

public class BaseVo {
	
	private String shValue;
	private Integer shOption;
	private Integer shDateOption;
	private String shDateStart;
	private String shDateEnd;
	
	private Integer pageNumber;
	private Integer pageSize;
	private Integer pageRange;
	private Integer pageTotal;
	
	public String getShValue() {
		return shValue;
	}
	public void setShValue(String shValue) {
		this.shValue = shValue;
	}
	public Integer getShOption() {
		return shOption;
	}
	public void setShOption(Integer shOption) {
		this.shOption = shOption;
	}
	public Integer getShDateOption() {
		return shDateOption;
	}
	public void setShDateOption(Integer shDateOption) {
		this.shDateOption = shDateOption;
	}
	public String getShDateStart() {
		return shDateStart;
	}
	public void setShDateStart(String shDateStart) {
		this.shDateStart = shDateStart;
	}
	public String getShDateEnd() {
		return shDateEnd;
	}
	public void setShDateEnd(String shDateEnd) {
		this.shDateEnd = shDateEnd;
	}
	public Integer getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(Integer pageNumber) {
		this.pageNumber = pageNumber;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getPageRange() {
		return pageRange;
	}
	public void setPageRange(Integer pageRange) {
		this.pageRange = pageRange;
	}
	public Integer getPageTotal() {
		return pageTotal;
	}
	public void setPageTotal(Integer pageTotal) {
		this.pageTotal = pageTotal;
		
		if(this.pageNumber == null)
			this.pageNumber = 1;
		if(this.pageSize == null)
			this.pageSize = 10;
		this.pageRange = (this.pageNumber - 1) * this.pageSize;
	}
	
}
