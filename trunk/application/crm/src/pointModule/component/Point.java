package pointModule.component;

public class Point {
	//point
	private Long p_id;
	private int p_decpoint;
	private int p_sumpoint;
	//pointrule
	private String pr_title;
	private int pr_point;
	public Long getP_id() {
		return p_id;
	}
	public void setP_id(Long p_id) {
		this.p_id = p_id;
	}
	public int getP_decpoint() {
		return p_decpoint;
	}
	public void setP_decpoint(int p_decpoint) {
		this.p_decpoint = p_decpoint;
	}
	public int getP_sumpoint() {
		return p_sumpoint;
	}
	public void setP_sumpoint(int p_sumpoint) {
		this.p_sumpoint = p_sumpoint;
	}
	public String getPr_title() {
		return pr_title;
	}
	public void setPr_title(String pr_title) {
		this.pr_title = pr_title;
	}
	public int getPr_point() {
		return pr_point;
	}
	public void setPr_point(int pr_point) {
		this.pr_point = pr_point;
	}
	

}
