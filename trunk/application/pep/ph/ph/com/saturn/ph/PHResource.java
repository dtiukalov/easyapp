package com.saturn.ph;

import java.util.List;

public class PHResource {
	  
    private int id;
    private String text;
    private String path;
    
	public static String generateTreeJSON(List<PHResource> resource) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("[");
		for (PHResource vo : resource) {
			buffer.append("{");
			buffer.append("\"id\":" + "\"" + vo.getId() + "\"" + ",");
			buffer.append("\"text\":" + "\"" + vo.getText() + "\"" + ",");
		
			if (vo.getPath() != null) {
				buffer.append("\"attributes\":{\"path\":" + "\""
						+ vo.getPath() + "\"" + "}");
			} else {
				buffer.append("\"attributes\":null");
			}
			buffer.append("}," + "\n");
		}
		buffer.append("]");
		return buffer.toString().replaceFirst(",\n]", "]");
	}
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
}
