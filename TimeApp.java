package edu.fau.Group1.model;

//Create TimeApp object in which time is drawn and placed into appointments 
public class TimeApp {
	int id;
	String time;
	String display;
	
	public TimeApp() {
		super();
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getDisplay() {
		return display;
	}
	public void setDisplay(String display) {
		this.display = display;
	}
	
	
}
