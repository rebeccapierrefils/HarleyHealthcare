package edu.fau.Group1.services; 

import java.sql.ResultSet; //imports resultset which maintains a table whose rows can be retrieved

import java.sql.SQLException; //imports ability to handle SQL exceptions and translate them to a more error-specific exception

import org.springframework.jdbc.core.RowMapper;

import edu.fau.Group1.model.User; //imports User model class

//method will return one instance of User model class
public class UserMapper implements RowMapper<User>{ 

	//ResultSet will receive data for User object and create this object using the following setters to set the data for the User Object
	public User mapRow(ResultSet rs, int rowNum) throws SQLException { 
		User user = new User();
		user.setUserId(rs.getInt("user_ID")); //
		user.setUsername(rs.getString("username"));		
		user.setPassword(rs.getString("password"));
		return user;
	}
}
