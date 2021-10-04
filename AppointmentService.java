package edu.fau.Group1.services;
import java.util.List;


import edu.fau.Group1.model.Appointment;
import edu.fau.Group1.services.AppointmentMapper; 


import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Component;

@Component
public class AppointmentService extends BaseService<Appointment> { //extends BaseService
	@Autowired
	public AppointmentService(DataSource dataSource) {
		super(dataSource); //referring to dataSource as the parent object
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<Appointment> getAll() { //getting all appointments from list
		String sql = "select * from Appointments";
		return jdbcTemplate.query(sql, new AppointmentMapper()); //returning the query 
	}

	@Override
	public Appointment getById(int id) { //getting all Appointments by ID
		String sql = "select * from Appointments where id = ?"; //returning appointment based on user specified ID
		return jdbcTemplate.queryForObject(sql, new Object[]{id}, new AppointmentMapper());
	}
	
	public List<Appointment> getByPatient_Id(int id) { //getting all Appointments by their respective patient ID
		String sql = "select * from Appointments where patent_id = ?"; // returning appointments booked by patient
		return jdbcTemplate.query(sql, new Object[]{id},new AppointmentMapper());
	}

	@Override
	public boolean create(Appointment b) { //creating a new appointment
		String sql = "insert into Appointments (checkin, checkout, patient_ID, employee_ID) " //adding appointment row into Appointment table
				+ " values (?,?,?,?)";
		try {
			return jdbcTemplate.update(sql, b.getCheckin().toString().replace("T", " "), b.getCheckout().toString().replace("T", " "), 
					b.getPatient_ID(), b.getEmployee_ID())>0 ;
		}
		catch (DuplicateKeyException ex){
			return false; //catching duplicate appointments to prevent double booking
		}
	}

	@Override
	public boolean update(Appointment t) { //update appointment
		// TODO Auto-generated method stub
		return false;
	}

	public List<Appointment> availability(String s) { //read through availability list
		// TODO Auto-generated method stub
		return null;
	}


	public boolean delete(Appointment t) { //delete appt
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Appointment> getByName(String name) { //read through names associated with Appointments
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(int id) { //deleting appointment id
		// TODO Auto-generated method stub
		return false;
	}

}
