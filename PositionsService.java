package edu.fau.Group1.services;



import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import edu.fau.Group1.model.Positions;
import edu.fau.Group1.services.PositionsMapper;

@Component
public class PositionsService extends BaseService<Positions>{
	
	@Autowired
	public PositionsService(DataSource dataSource) {
		super(dataSource);
		
	}

	@Override
	public List<Positions> getAll() {//getting all Positions available on HS_Positions table
		String sql = "select * from HS_Positions"; //selecting all from the HS_Positions table
		return jdbcTemplate.query(sql, new PositionsMapper());
	}

	@Override
	public Positions getById(int id) { //getting all positions by pk,ID
		String sql = "select * from HS_Positions where positionId = ?"; //querying all positions based on position ID
		return jdbcTemplate.queryForObject(sql, new Object[]{id}, new PositionsMapper());
	}

	@Override
	public List<Positions> getByName(String name) { //getting positions by their name
		String sql = "select * from Patient where firstname= '?'"; //querying patient with specific first name
		return jdbcTemplate.query(sql,  new PositionsMapper());
	}
	
	@Override // change the sql here
	public boolean create(Positions p) { //creating new positions object
		String sql = "insert into Patient(positionId, position) "
				+ "values (?, ?)";   //inserting new positions object in HS_Positions table
		return jdbcTemplate.update(sql, p.getPositionId(), p.getPosition())> 0;
	}

	@Override
	public boolean update(Positions p) { //updating positions entity on HS_Positions table
		String sql = "update Positions set positonId=?, position=?"; //setting new position ID and updating it in database
		return jdbcTemplate.update(sql, p.getPositionId(), p.getPosition())> 0;
	}

	@Override
	public boolean delete(int id) {//deleting positions on table based on ID
		String sql = "delete from Positions where positionId=?";
		return jdbcTemplate.update(sql, id)>0;
	}


}
