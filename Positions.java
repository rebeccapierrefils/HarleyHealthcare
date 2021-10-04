package edu.fau.Group1.model;
//page will create position page that is used to stare various choices

public class Positions {

	private int positionId;
	private String position;
	
	
	public Positions() {
		// TODO Auto-generated constructor stub
	}

//overloaded constructor
	public Positions(int positionId, String position) {
		super();
		this.positionId = positionId;
		this.position = position;
	}


	public int getPositionId() {
		return positionId;
	}


	public void setPositionId(int positionId) {
		this.positionId = positionId;
	}


	public String getPosition() {
		return position;
	}


	public void setPosition(String position) {
		this.position = position;
	}
	
	
	
}
