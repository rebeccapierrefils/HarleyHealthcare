package edu.fau.Group1.model;
//User validation object this is what used to login 
public class User {
	private int user_ID;
	private String username;
	private String password;
	
	public User(){
		
	}
	
//overloaded constructor
	public User(int user_ID, String username, String password) {
		super();
		this.user_ID = user_ID;
		this.username = username;
		this.password = password;
	}

	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	
	public int getUserId() {
		return user_ID;
	}

	public void setUserId(int user_ID) {
		this.user_ID = user_ID;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	

}
