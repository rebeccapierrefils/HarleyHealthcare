package edu.fau.Group1.services;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import edu.fau.Group1.services.BaseService;
import edu.fau.Group1.model.TimeApp;
import edu.fau.Group1.services.TimeAppMapper;

// TimeAppService implements methods to query the database
@Component
public class TimeAppService extends BaseService<TimeApp> {
	@Autowired
	public TimeAppService(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}
	// selects all and returns those values from the TimeApp table
	@Override
	public List<TimeApp> getAll() {
		String sql = "select * from TimeApp";
		return jdbcTemplate.query(sql, new TimeAppMapper());
	}

	// selects all from the table TimeApp where the ID is equal to a specified integer and returns those values
	@Override
	public TimeApp getById(int id) {
		String sql = "select * from TimeApp where id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[]{id}, new TimeAppMapper());
	}

	// creates a new visitor
	@Override
	public boolean create(TimeApp t) {
		// TODO Auto-generated method stub
		return false;
	}
	
	// updates the TimeApp table
	@Override
	public boolean update(TimeApp t) {
		// TODO Auto-generated method stub
		return false;
	}
	// future functionality
	public List<TimeApp> availability(String s) {
		// TODO Auto-generated method stub
		return null;
	}

	// future functionality
	public boolean delete(TimeApp t) {
		// TODO Auto-generated method stub
		return false;
	}

	// future functionality
	@Override
	public List<TimeApp> getByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	// future functionality
	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return false;
	}

} // end TimeAppService


