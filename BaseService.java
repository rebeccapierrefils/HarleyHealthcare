package edu.fau.Group1.services;

import java.util.List;


import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

public abstract class BaseService<T> { //generic class
	protected JdbcTemplate jdbcTemplate;
	
	public BaseService(DataSource dataSource){
		this.jdbcTemplate = new JdbcTemplate(dataSource); //allows us to interact with template
	}
	
	//common methods going to run
	
	public abstract List<T> getAll(); //get array list of object
	
	public abstract T getById(int id); //get object by id
	
	public abstract List<T> getByName(String name); //list of object
	
	public abstract boolean create(T t); //insert record true
	
	public abstract boolean update(T t); //update record true
	
	public abstract boolean delete(int id); //delete by id

}

