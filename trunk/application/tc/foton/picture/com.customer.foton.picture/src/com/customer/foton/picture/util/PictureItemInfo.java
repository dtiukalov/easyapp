package com.customer.foton.picture.util;

/**
 * 
 * @author emily
 * 
 */
public class PictureItemInfo {

	// private JPEG jpg; // TC中的图片对象

	private String itemId = ""; //$NON-NLS-1$

	private String version = ""; //$NON-NLS-1$

	private String jpgPath = ""; // 图片路径 //$NON-NLS-1$

	private String jpgName = ""; // 图片名称 //$NON-NLS-1$

	private String sp_jpgPath = ""; // 小图片路径 //$NON-NLS-1$

	private String sp_jpgName = ""; // 小图片名称 //$NON-NLS-1$

	private String country = ""; // 国家 //$NON-NLS-1$

	private String band = "";// 品牌 //$NON-NLS-1$

	private String subBand = "";// 子品牌 //$NON-NLS-1$

	private String year = "";// 年代 //$NON-NLS-1$

	private String interOunter = "";// 内外饰 //$NON-NLS-1$

	private String angle = "";// 角度 //$NON-NLS-1$

	private String outer = "";// 外饰局部 //$NON-NLS-1$

	private String Inter = "";// 内饰局部 //$NON-NLS-1$

	private String carType = "";// 车种 //$NON-NLS-1$

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

	public String getJpgPath() {
		return jpgPath;
	}

	public void setJpgPath(String jpgPath) {
		this.jpgPath = jpgPath;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getJpgName() {
		return jpgName;
	}

	public void setJpgName(String jpgName) {
		this.jpgName = jpgName;
	}

	public StringBuffer getInfoString() {
		StringBuffer buffer = new StringBuffer(this.carType + "|" //$NON-NLS-1$
				+ this.country + "|" + this.band + "|" + this.subBand + "|" //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
				+ this.year + "|" + this.interOunter); //$NON-NLS-1$

		if (!"".equals(this.Inter)) { //$NON-NLS-1$
			buffer.append(Messages.getString("PictureItemInfo.innerpart") + this.Inter); //$NON-NLS-1$
		}
		if (!"".equals(this.outer)) { //$NON-NLS-1$
			buffer.append(Messages.getString("PictureItemInfo.outerpart") + this.outer); //$NON-NLS-1$
		}
		if (!"".equals(this.angle)) { //$NON-NLS-1$
			buffer.append(Messages.getString("PictureItemInfo.zhengti") + this.angle); //$NON-NLS-1$
		}
		buffer.append("|" + this.jpgName); //$NON-NLS-1$

		return buffer;
	}

	public String getSp_jpgPath() {
		return sp_jpgPath;
	}

	public void setSp_jpgPath(String sp_jpgPath) {
		this.sp_jpgPath = sp_jpgPath;
	}

	public String getSp_jpgName() {
		return sp_jpgName;
	}

	public void setSp_jpgName(String sp_jpgName) {
		this.sp_jpgName = sp_jpgName;
	}
}
