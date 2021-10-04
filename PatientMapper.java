package edu.fau.Group1.services;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import edu.fau.Group1.model.Patient;


public class PatientMapper implements RowMapper<Patient>{ //mapping each row as a result object to read per line on sql db


	
	public Patient mapRow(ResultSet rs, int rowNum) throws SQLException {
		Patient p = new Patient();
		p.setPatient_ID(rs.getInt(1));
		p.setFirstName(rs.getString(2));
		p.setLastName(rs.getString(3));
		p.setEmail(rs.getString(4));
		p.setPhoneNumber(rs.getString(5));
		p.setDob(rs.getString(6));
		p.setSsnum(rs.getString(7));
		p.setAddress(rs.getString(8));
		p.setAddress2(rs.getString(9));
		p.setCity(rs.getString(10));
		p.setState(rs.getString(11));
		p.setZipcode(rs.getString(12));
		return p; //object created and called for as defined by p
		
		
		
		
	
		
	

}
}