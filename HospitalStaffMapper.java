package edu.fau.Group1.services;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import edu.fau.Group1.model.HospitalStaff;


public class HospitalStaffMapper implements RowMapper<HospitalStaff>{ //mapping each row as a result object to read per line on sql db

	
	public HospitalStaff mapRow(ResultSet rs, int rowNum) throws SQLException {
		HospitalStaff hs = new HospitalStaff();
		hs.setEmployee_ID(rs.getInt(1));
		hs.setFirstName(rs.getString(2));
		hs.setLastName(rs.getString(3));
		hs.setFk_positionId(rs.getInt(4));
		hs.setPosition(rs.getString(5));
		hs.setEmail(rs.getString(6));
		hs.setPhoneNumber(rs.getString(7));
		hs.setDob(rs.getString(8));
		hs.setSsnum(rs.getString(9));
		hs.setAddress(rs.getString(10));
		hs.setAddress2(rs.getString(11));
		hs.setCity(rs.getString(12));
		hs.setState(rs.getString(13));
		hs.setZipcode(rs.getString(14));
		hs.setPatient_ID(rs.getInt(15));
		return hs; //object created and called for as defined by hs
		
		
	

}
}