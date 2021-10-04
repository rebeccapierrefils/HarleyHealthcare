package edu.fau.Group1.services;

import java.util.List; //imports ability to produce lists


import javax.sql.DataSource; //imports connection to SQL tables

import org.springframework.beans.factory.annotation.Autowired; //responsible for getting appropriate configuration details
import org.springframework.stereotype.Component; //imports JDBC framework components

import edu.fau.Group1.model.User; //imports User model class

@Component
//Creates concrete class extending the methods of our BaseService file
public class UserService extends BaseService<User>{
	
	@Autowired
	//SQL data connection
	public UserService(DataSource dataSource) {
		super(dataSource);
		
	}

	//returns all rows from User table that have specified user_ID
	@Override
	public User getById(int id) {
		String query = "select * from User where user_ID = ?";
		return jdbcTemplate.queryForObject(query, new Object[] {id}, new UserMapper());
	}

	@Override
	//returns a list of all existing Users listed in User table
	public List<User> getAll() {
		String query ="select * from User";
		return jdbcTemplate.query(query, new UserMapper());
	}

	@Override
	//inserts a new row into the User table
	public boolean create(User user) {
		String query ="insert into User (username, password) "
				+ "values(?, ?)";
		return jdbcTemplate.update(query,  user.getUsername(), user.getPassword())>0;
	}

	@Override
	//updates existing row in User table for specified user_ID
	public boolean update(User user) {
		String sql = "update User set username=?, password=? where user_ID=?";
		return jdbcTemplate.update(sql, user.getUserId(), user.getUsername(), user.getPassword())>0;
	}

	@Override
	//deletes existing row in User table by specified user_ID
	public boolean delete(int id) {
		String sql = "delete from user_ID where user_ID=?";
		return jdbcTemplate.update(sql, id)>0;
	}

	@Override
	//returns a list of all existing Users by name
	public List<User> getByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}


}
