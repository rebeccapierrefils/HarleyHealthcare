package edu.fau.Group1.services;

import java.util.*;
import javax.sql.DataSource;
import edu.fau.Group1.model.*;
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;

// This class sends queries to the database to retrieve data from the Visitors table and returns those values
@Component
public class VisitorsService extends BaseService<Visitors>{

	@Autowired
	public VisitorsService(DataSource jdbcTemplate) {
		super(jdbcTemplate);
		// TODO Auto-generated constructor stub
	}
	
	// selects all from the table Visitors where the ID is equal to a specified integer and returns those values
	@Override
	public Visitors getById(int id) {
		String sql = "select * from Visitors where visitor_ID = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[]{id}, new VisitorsMapper());
		} catch (EmptyResultDataAccessException ex) {
			return null;
		}
	}
	
	// selects all and returns the values based on the lastname column
	@Override
	public List<Visitors> getByName(String name) {
		String sql = "select * from Visitors where lastname = ?";
		
		return jdbcTemplate.query(sql,  new Object[] {name}, new VisitorsMapper());
	}
	
	// selects all and returns those values from the Visitors table
	@Override
	public List<Visitors> getAll() {
		String sql = "select * from Visitors";
		return jdbcTemplate.query(sql,  new VisitorsMapper());
	}

	// allows us to create a new visitor
	@Override
	public boolean create(Visitors v) {
		String sql = "insert into Visitors(firstname, lastname, email, phonenumber, patient_ID)"
				+ "values(?, ?, ?, ?, ?)";
		return jdbcTemplate.update(sql, v.getFirstName(), v.getLastName(), v.getEmail(),
				v.getPhoneNumber(), v.getPatient_ID())>0;
	}
	
	// allows us to update the Visitor table with new visitor data
	@Override
	public boolean update(Visitors v) {
		String sql = "UPDATE Visitors SET firstname=?, lastname=?, email=?, phonenumber=?, patient_ID=? where visitor_ID=?";
		
		return jdbcTemplate.update(sql, v.getFirstName(), v.getLastName(), 
				v.getEmail(), v.getPhoneNumber(), v.getPatient_ID(), v.getVisitor_ID())>0;
	}

	// allows us to delete a visitor from the table where the ID equals a specified integer
	public boolean delete(Visitors v) {
		String query = "DELETE FROM Visitors WHERE visitor_ID=?";
		return jdbcTemplate.update(query, v.getVisitor_ID())>0;
	}

	// allows us to delete a visitor from the table where the ID equals a specified integer
	@Override
	public boolean delete(int id) {
		String sql = "delete from Visitors where visitor_ID=?";
		return jdbcTemplate.update(sql, id)>0;
	}


} // end VisitorsService
