package edu.fau.Group1.model;
import java.time.LocalDateTime;
//This is the class for the Appointments table, This will be used to create the appoints 
public class Appointment {
	int id;
	int patient_ID;
	int employee_ID;
	LocalDateTime checkin;
	LocalDateTime checkout;

// this is the overloaded construct
	public Appointment(int id, int patient_ID, int employee_ID, LocalDateTime checkin, LocalDateTime checkout) {
		super();
		this.id = id;
		this.patient_ID = patient_ID;
		this.employee_ID = employee_ID;
		this.checkin = checkin;
		this.checkout = checkout;
	}
	public Appointment() {
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPatient_ID() {
		return patient_ID;
	}
	public void setPatient_ID(int patient_ID) {
		this.patient_ID = patient_ID;
	}
	public int getEmployee_ID() {
		return employee_ID;
	}
	public void setEmployee_ID(int employee_ID) {
		this.employee_ID = employee_ID;
	}
	public LocalDateTime getCheckin() {
		return checkin;
	}
	public void setCheckin(LocalDateTime checkin) {
		this.checkin = checkin;
	}
	public LocalDateTime getCheckout() {
		return checkout;
	}
	public void setCheckout(LocalDateTime checkout) {
		this.checkout = checkout;
	}
	

}
