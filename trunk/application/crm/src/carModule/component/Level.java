package carModule.component;

public class Level {

	private String cardid;//档案主键
	private String carcardlevel;//档案级别 101001 101002 101003 101004 101005 101006
	private String carsource;//车辆来源 103001 103002 103003
	private String carselldate;//销售日期
	private String carvin;//车辆vin
	public String getCardid() {
		return cardid;
	}
	public void setCardid(String cardid) {
		this.cardid = cardid;
	}
	public String getCarcardlevel() {
		return carcardlevel;
	}
	public void setCarcardlevel(String carcardlevel) {
		this.carcardlevel = carcardlevel;
	}
	public String getCarsource() {
		return carsource;
	}
	public void setCarsource(String carsource) {
		this.carsource = carsource;
	}
	public String getCarselldate() {
		return carselldate;
	}
	public void setCarselldate(String carselldate) {
		this.carselldate = carselldate;
	}
	public String getCarvin() {
		return carvin;
	}
	public void setCarvin(String carvin) {
		this.carvin = carvin;
	}
	
	
}
