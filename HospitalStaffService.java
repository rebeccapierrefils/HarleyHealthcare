package edu.fau.Group1.services;

import java.util.*;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import edu.fau.Group1.model.*;
import edu.fau.Group1.services.HospitalStaffMapper;
import org.springframework.dao.EmptyResultDataAccessException;

@Component
public class HospitalStaffService extends BaseService<HospitalStaff>{ //extends Base Service
	
	@Autowired 
	public HospitalStaffService(DataSource jdbcTemplate) {
		super(jdbcTemplate); //referring to jdbc template as parent object
		
	}

	@Override
	public List<HospitalStaff> getAll() { //getting all hospital staff objects in the list
		String sql = "select * from HospitalStaff";
		return jdbcTemplate.query(sql, new HospitalStaffMapper());
	}

	@Override
	public HospitalStaff getById(int id) { //getting hospital staff by PK, ID
		String sql = "select * from HospitalStaff where employee_ID = ?"; // reading all fields in a table to return based ID
		try {
			return (HospitalStaff) jdbcTemplate.queryForObject(sql, new Object[]{id}, new HospitalStaffMapper()); // if found, hospital staff object will be returned
		} catch (EmptyResultDataAccessException ex) { // if user specified ID is not in table, a null will be returned
			return null;
		}
	}

	@Override
	public List<HospitalStaff> getByName(String name) { //reading Hospital Staff table and returning object based on name
		String sql = "select * from HospitalStaff where lastname= ?"; // searching HospitalStaff table by last name
		return jdbcTemplate.query(sql, new Object[]{name}, new HospitalStaffMapper()); //returning result of query with HospitalStaff object
	}
	
	
	
	@Override
	public boolean create(HospitalStaff hs) { //creating a new HospitalStaff account to add to database
		String sql = "insert into HospitalStaff(firstname, lastname, position, email, phonenumber, dob, ssnum, address, address2, city, state, zipcode)"
				+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";  // Adding object to HospitalStaff table upon finishing form
		return jdbcTemplate.update(sql, hs.getFirstName(), hs.getLastName(), hs.getPosition(),
				hs.getEmail(), hs.getPhoneNumber(), hs.getDob(), hs.getSsnum(), hs.getAddress(), hs.getAddress2(), hs.getCity(), hs.getState(), hs.getZipcode())> 0; //establishing this entity in the system by getting the information
	}

	@Override
	public boolean update(HospitalStaff hs) { //Method to update HospitalStaff row
		String sql = "update HospitalStaff set firstname=?, lastname=?, position=?, email=?, phonenumber=?, dob=?, ssnum=?, address=?, address2=?, city=?, state=?, zipcode=?, patient_ID=? where employee_ID=?";
		return jdbcTemplate.update(sql, hs.getFirstName(), hs.getLastName(), hs.getPosition(),
				hs.getEmail(), hs.getPhoneNumber(), hs.getDob(), hs.getSsnum(), hs.getAddress(), hs.getAddress2(), hs.getCity(), hs.getState(), hs.getZipcode(), hs.getPatient_ID(), hs.getEmployee_ID())> 0; //returning object as establishing in the database
	}

	@Override
	public boolean delete(int id) { //deleting entity in HospitalStaff table
		String sql = "delete from HospitalStaff where employee_ID=?"; 
		return jdbcTemplate.update(sql, id)>0;
	}


}
