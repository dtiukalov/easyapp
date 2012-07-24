package com.customer.foton.picture.excel;

/**
 * 
 * @author emily
 * 
 */
public class PictureVO {

	//private JPEG jpg; // TC中的图片对象
	
	private byte[] imageData;
	
	private int row;
	
	private int col;
	
	private String pictureName;

	private String jpgPath = ""; // 图片路径（服务器/客户端缓存）

	private String country = ""; // 国家

	private String band = "";// 品牌

	private String subBand = "";// 子品牌

	private String year = "";// 年代

	private String interOunter = "";// 内外饰

	private String angle = "";// 角度

	private String outer = "";// 外饰局部

	private String Inter = "";// 内饰局部

	private String carType = "";// 车种

	private String createDateBefore = "";

	private String createDateAfter = "";

	private String updateDateBefore = "";

	private String updateDateAfter = "";

	private String offerDateBefore = "";

	private String offerDateAfter = "";

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getBand() {
		return band;
	}

	public void setBand(String band) {
		this.band = band;
	}

	public String getSubBand() {
		return subBand;
	}

	public void setSubBand(String subBand) {
		this.subBand = subBand;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getInterOunter() {
		return interOunter;
	}

	public void setInterOunter(String interOunter) {
		this.interOunter = interOunter;
	}

	public String getAngle() {
		return angle;
	}

	public void setAngle(String angle) {
		this.angle = angle;
	}

	public String getOuter() {
		return outer;
	}

	public void setOuter(String outer) {
		this.outer = outer;
	}

	public String getInter() {
		return Inter;
	}

	public void setInter(String inter) {
		Inter = inter;
	}

	public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
	}

	public String getCreateDateBefore() {
		return createDateBefore;
	}

	public void setCreateDateBefore(String createDateBefore) {
		this.createDateBefore = createDateBefore;
	}

	public String getCreateDateAfter() {
		return createDateAfter;
	}

	public void setCreateDateAfter(String createDateAfter) {
		this.createDateAfter = createDateAfter;
	}

	public String getUpdateDateBefore() {
		return updateDateBefore;
	}

	public void setUpdateDateBefore(String updateDateBefore) {
		this.updateDateBefore = updateDateBefore;
	}

	public String getUpdateDateAfter() {
		return updateDateAfter;
	}

	public void setUpdateDateAfter(String updateDateAfter) {
		this.updateDateAfter = updateDateAfter;
	}

	public String getOfferDateBefore() {
		return offerDateBefore;
	}

	public void setOfferDateBefore(String offerDateBefore) {
		this.offerDateBefore = offerDateBefore;
	}

	public String getOfferDateAfter() {
		return offerDateAfter;
	}

	public void setOfferDateAfter(String offerDateAfter) {
		this.offerDateAfter = offerDateAfter;
	}

	public String getJpgPath() {
		return jpgPath;
	}

	public void setJpgPath(String jpgPath) {
		this.jpgPath = jpgPath;
	}

	public int getRow() {
		return row;
	}

	public void setRow(int row) {
		this.row = row;
	}

	public int getCol() {
		return col;
	}

	public void setCol(int col) {
		this.col = col;
	}

	public byte[] getImageData() {
		return imageData;
	}

	public void setImageData(byte[] imageData) {
		this.imageData = imageData;
	}

	public String getPictureName() {
		return pictureName;
	}

	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}
}
