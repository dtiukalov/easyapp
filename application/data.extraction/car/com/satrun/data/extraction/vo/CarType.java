package com.satrun.data.extraction.vo;


public class CarType {
	//��ϵ
	private String brandId;  //Ʒ��ID
	private String brand;  //Ʒ��
	private String brandLogo; //Ʒ��LOGO
	
	private String carTypeId; //��ϵID
	private String carType; //��ϵ
	private String carTypeLogo; //��ϵLOGO
	
	
	private String company; //����
	private String companyType; //��������
	
	private String isStop; //�Ƿ�ͣ��
	
	private String url; //��ϵ����
	
	public String getBrandId() {
		return brandId;
	}
	public void setBrandId(String brandId) {
		this.brandId = brandId;
	}
	public String getCarTypeId() {
		return carTypeId;
	}
	public void setCarTypeId(String carTypeId) {
		this.carTypeId = carTypeId;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getCarType() {
		return carType;
	}
	public void setCarType(String carType) {
		this.carType = carType;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getBrandLogo() {
		return brandLogo;
	}
	public void setBrandLogo(String brandLogo) {
		this.brandLogo = brandLogo;
	}
	public String getCarTypeLogo() {
		return carTypeLogo;
	}
	public void setCarTypeLogo(String carTypeLogo) {
		this.carTypeLogo = carTypeLogo;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getCompanyType() {
		return companyType;
	}
	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}
	public String getIsStop() {
		return isStop;
	}
	public void setIsStop(String isStop) {
		this.isStop = isStop;
	}
	
}
