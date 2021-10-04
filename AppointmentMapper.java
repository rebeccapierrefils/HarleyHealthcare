package edu.fau.Group1.services;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import edu.fau.Group1.model.Appointment;

public class AppointmentMapper implements RowMapper<Appointment>{ //mapping each row as a result object to read per line on sql db

public Appointment mapRow(ResultSet rs, int rowNum) throws SQLException { 
		Appointment as = new Appointment();
		as.setId(rs.getInt(1));
		as.setPatient_ID(rs.getInt(2));
		as.setEmployee_ID(rs.getInt(3));
		as.setCheckin(rs.getTimestamp(4).toLocalDateTime());
		as.setCheckout(rs.getTimestamp(5).toLocalDateTime());
		
		return as; //object created and called for as defined by as
	}
	


}
