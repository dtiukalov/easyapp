package com.customer.fotonbm.report.utils.excel;

import java.awt.image.BufferedImage;

public class CellInfo {
	
	private String key; //对应数据的key值
	
	private int row; //行
	
	private int column; //列
	
	private String type; //类型
	
	private String imageFillType;
	
	private int toRow; //到..行
	
	private int toColumn; // 到...列
	
	private BufferedImage image;

	public CellInfo( int row, int column, String type) {
		this.row = row;
		this.column = column;
		this.type = type;
	}
	
	public CellInfo(String imageFillType, BufferedImage image) {
		this.type = "image";
		this.imageFillType = imageFillType;
		this.image = image;
	}
	
	public CellInfo(String imageFillType, BufferedImage image,int row, int col) {
		this.type = "image";
		this.imageFillType = imageFillType;
		this.image = image;
		this.row = row;
		this.column = col;
	}
	
	public CellInfo() {
		
	}
	
	public CellInfo(int row, int torow, int column, int tocolumn) {
		this.row = row;
		this.toRow = torow;
		this.column = column;
		this.toColumn = tocolumn;
	}
	
	public BufferedImage getImage() {
		return image;
	}

	public void setImage(BufferedImage image) {
		this.image = image;
	}

	public int getColumn() {
		return column;
	}

	public void setColumn(int colume) {
		this.column = colume;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public int getRow() {
		return row;
	}

	public void setRow(int row) {
		this.row = row;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return this.key + ", " + this.row + ", " + this.column + ", " + this.type;
	}

	public String getImageFillType() {
		return imageFillType;
	}

	public void setImageFillType(String imageFillType) {
		this.imageFillType = imageFillType;
	}

	public int getToColumn() {
		return toColumn;
	}

	public void setToColumn(int toColumn) {
		this.toColumn = toColumn;
	}

	public int getToRow() {
		return toRow;
	}

	public void setToRow(int toRow) {
		this.toRow = toRow;
	}
}
