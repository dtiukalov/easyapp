package foton.picture.vo;

import com.teamcenter.soa.client.model.strong.Dataset;

/**
 * 
 * @author emily
 * 
 */
public class PictureVO {
	
	private String key;  //唯一标识一个picture 取值是item_id

	private Dataset jpg; // TC中的图片对象
	
	private Dataset sp_jpg; // TC中的小图片对象

	private String jpgPath = ""; // 图片路径
	
	private String jpgName = ""; //图片名称
	
	private String sp_jpgPath = ""; // 小图片路径
	
	private String sp_jpgName = "";//小图片名称

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

	public Dataset getJpg() {
		return this.jpg;
	}

	public void setJpg(Dataset jpg) {
		this.jpg = jpg;
	}

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

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getJpgName() {
		return jpgName;
	}

	public void setJpgName(String jpgName) {
		this.jpgName = jpgName;
	}

	public Dataset getSp_jpg() {
		return this.sp_jpg;
	}

	public void setSp_jpg(Dataset sp_jpg) {
		this.sp_jpg = sp_jpg;
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
