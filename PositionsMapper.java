package edu.fau.Group1.services;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import edu.fau.Group1.model.Positions;

public class PositionsMapper implements RowMapper<Positions>{//mapping each row as a result object to read per line on sql db
	
	public Positions mapRow(ResultSet rs, int rowNum) throws SQLException {
		Positions pos = new Positions();
		pos.setPositionId(rs.getInt(1));
		pos.setPosition(rs.getString(2));
		return pos; //object created and called for as defined by pos
	}
	

}
