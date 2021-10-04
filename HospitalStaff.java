package edu.fau.Group1.model;

//This is the class to create the employees object in the back end 

public class HospitalStaff {
	private int employee_ID;
	private String firstname;
	private String lastname;
	private int fk_positionId;
	private String position;
	private String email;
	private String phonenumber;
	private String dob;
	private String ssnum;
	private String address;
	private String address2;
	private String city;
	private String state;
	private String zipcode;
	private int patient_ID;
	
	public HospitalStaff() {
		// TODO Auto-generated constructor stub
	}

// overloaded constructor 
public HospitalStaff(int employee_ID, String firstname, String lastname, String position, String email, String phonenumber, String dob, String ssnum,
			String address, String address2, String city, String state, String zipcode, int patient_ID) {
		super();
		
		this.employee_ID = employee_ID;
		this.firstname = firstname;
		this.lastname = lastname;
		this.fk_positionId = fk_positionId;
		this.position = position;
		this.email = email;
		this.phonenumber = phonenumber;
		this.dob = dob;
		this.ssnum = ssnum;
		this.address = address;
		this.address2 = address2;
		this.city = city;
		this.state = state;
		this.zipcode = zipcode;
		this.patient_ID = patient_ID;
}

public HospitalStaff(String firstname, String lastname, String position, String email, String phonenumber, String dob, String ssnum,
		String address, String address2, String city, String state, String zipcode) {
	super();
	
	this.firstname = firstname;
	this.lastname = lastname;
	this.fk_positionId = fk_positionId;
	this.position = position;
	this.email = email;
	this.phonenumber = phonenumber;
	this.dob = dob;
	this.ssnum = ssnum;
	this.address = address;
	this.address2 = address2;
	this.city = city;
	this.state = state;
	this.zipcode = zipcode;
}



public String getPosition() {
	return position;
}


public void setPosition(String position) {
	this.position = position;
}


public int getEmployee_ID() {
	return employee_ID;
}



public void setEmployee_ID(int employee_ID) {
	this.employee_ID = employee_ID;
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



public int getFk_positionId() {
	return fk_positionId;
}


public void setFk_positionId(int fk_positionId) {
	this.fk_positionId = fk_positionId;
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



public String getDob() {
	return dob;
}



public void setDob(String dob) {
	this.dob = dob;
}



public String getSsnum() {
	return ssnum;
}



public void setSsnum(String ssnum) {
	this.ssnum = ssnum;
}



public String getAddress() {
	return address;
}



public void setAddress(String address) {
	this.address = address;
}



public String getAddress2() {
	return address2;
}



public void setAddress2(String address2) {
	this.address2 = address2;
}



public String getCity() {
	return city;
}



public void setCity(String city) {
	this.city = city;
}



public String getState() {
	return state;
}



public void setState(String state) {
	this.state = state;
}



public String getZipcode() {
	return zipcode;
}



public void setZipcode(String zipcode) {
	this.zipcode = zipcode;
}

public int getPatient_ID() {
	return patient_ID;
}

public void setPatient_ID(int patient_ID) {
	this.patient_ID = patient_ID;
}




	
}


