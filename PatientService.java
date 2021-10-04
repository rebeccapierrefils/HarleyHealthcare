package edu.fau.Group1.services;


import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import edu.fau.Group1.model.Patient;
import edu.fau.Group1.services.PatientMapper;

@Component
public class PatientService extends BaseService<Patient>{//extends base service to patient
	
	@Autowired
	public PatientService(DataSource dataSource) {
		super(dataSource);
		
	}

	@Override
	public List<Patient> getAll() { //gets all patients from a list
		String sql = "select * from Patient"; //querying all patient objects from sql database
		return jdbcTemplate.query(sql, new PatientMapper());
	}

	@Override
	public Patient getById(int id) { //getting patient by pk, ID
		String sql = "select * from Patient where patient_ID = ?"; //query to return patients with a specific ID
		return jdbcTemplate.queryForObject(sql, new Object[]{id}, new PatientMapper());
	}

	@Override
	public List<Patient> getByName(String name) { //getting patient by their name
		String sql = "select * from Patient where firstname= '?'"; //query to return patients with a specific first name
		return jdbcTemplate.query(sql,  new PatientMapper());
	}
	
	@Override
	public boolean create(Patient p) { //creating patient to add to database
		String sql = "insert into Patient(firstname, lastname, email, phonenumber, dob, ssnum, address, address2, city, state, zipcode) "
				+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";  
		return jdbcTemplate.update(sql, p.getFirstName(), p.getLastName(),  //updating the database and saving the new patient object
				p.getEmail(), p.getPhoneNumber(), p.getDob(), p.getSsnum(), p.getAddress(), p.getAddress2(), p.getCity(), p.getState(), p.getZipcode())>0;
	}

	@Override
	public boolean update(Patient p) { //updating patient table in database with new edit
		String sql = "update Patient set firstname=?, lastname=?, email=?, phonenumber=?, dob=?, ssnum=?, address=?, address2=?, city=?, state=?, zipcode=?, username=?. password=?, where patient_ID=?";
		return jdbcTemplate.update(sql, p.getFirstName(), p.getLastName(),  //returning new patient object while saving new info
				p.getEmail(), p.getPhoneNumber(), p.getDob(), p.getSsnum(), p.getAddress(), p.getAddress2(), p.getCity(), p.getState(), p.getZipcode(), p.getPatient_ID())> 0;
	}

	@Override
	public boolean delete(int id) { //delete patient entity based on pk, ID
		String sql = "delete from Patient where patient_ID=?";
		return jdbcTemplate.update(sql, id)>0;
	}


}
