package edu.fau.Group1.model;

import org.springframework.jdbc.core.PreparedStatementSetter;
//This is the object for the visitors when they create a visitor account 
public class Visitors {

	private int visitor_ID;
	private String firstname;
	private String lastname;
	private String email;
	private String phonenumber;
	private int patient_ID;

	public Visitors() {
		// constructor
	}

	// overloaded constructor
	public Visitors(int visitor_ID, String firstname, String lastname, String email, String phonenumber,
			int patient_ID) {
		super();
		this.visitor_ID = visitor_ID;
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.phonenumber = phonenumber;
		this.patient_ID = patient_ID;
	}

	// overloaded constructor
		public Visitors(String firstname, String lastname, String email, String phonenumber, int patient_ID) {
			super();
			this.firstname = firstname;
			this.lastname = lastname;
			this.email = email;
			this.phonenumber = phonenumber;
			this.patient_ID = patient_ID;
		}
		
	public int getVisitor_ID() {
		return visitor_ID;
	}

	public void setVisitor_ID(int visitor_ID) {
		this.visitor_ID = visitor_ID;
	}

	public String getFirstName() {
		return firstname;
	}

	public void setFirstName(String firstname) {
		this.firstname = firstname;
	}

	public String getLastName() {
		return lastname;
	}

	public void setLastName(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phonenumber;
	}

	public void setPhoneNumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public int getPatient_ID() {
		return patient_ID;
	}

	public void setPatient_ID(int patient_ID) {
		this.patient_ID = patient_ID;
	}

	public PreparedStatementSetter getId() {
		// TODO Auto-generated method stub
		return null;
	}

} // end public class visitors