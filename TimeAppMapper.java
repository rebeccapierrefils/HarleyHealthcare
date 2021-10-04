package edu.fau.Group1.services;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import edu.fau.Group1.model.TimeApp;

// This mapper sets the result set to the ta object and returns the ta object
public class TimeAppMapper implements RowMapper<TimeApp> {

	public TimeApp mapRow(ResultSet rs, int rowNum) throws SQLException {
		TimeApp ta = new TimeApp(); // new TimeApp object
		ta.setId(rs.getInt(1)); // rs is the result set from the services page
		ta.setTime(rs.getString(2));
		ta.setDisplay(rs.getString(3));
		return ta;
	} // end TimeApp mapRow implementation 

} // end TimeAppMapper mapRow

