package com.example.listviewrowdto;

public class MyCustomDTO {

	int imgIcon;
	String title;
	String content;

	
	public MyCustomDTO(int imgIcon, String title, String content) {
		super();
		this.imgIcon = imgIcon;
		this.title = title;
		this.content = content;
	}


	public int getImgIcon() {
		return imgIcon;
	}


	public void setImgIcon(int imgIcon) {
		this.imgIcon = imgIcon;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}
	
	
	
	
}
