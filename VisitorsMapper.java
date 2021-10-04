package edu.fau.Group1.services;
import org.springframework.jdbc.core.RowMapper;
import edu.fau.Group1.model.*;
import java.sql.ResultSet;
import java.sql.SQLException;

// allows the data source to interact with the database - like the button "A" on the Wii remote
// only has one method that receives rs and int and returns on instance of class
// result set = the result of sql query

// This method allows the sets up the interaction of the database with the Visitors class and service files
public class VisitorsMapper implements RowMapper<Visitors>{

	public Visitors mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		Visitors v = new Visitors(); // rs is the result from sql query in the services page
		v.setVisitor_ID(rs.getInt(1));
		v.setFirstName(rs.getString(2));
		v.setLastName(rs.getString(3));
		v.setEmail(rs.getString(4));
		v.setPhoneNumber(rs.getString(5));
		v.setPatient_ID(rs.getInt(6));
		return v;
	}// end mapRow method
	

} // end public class visitorsMapper
