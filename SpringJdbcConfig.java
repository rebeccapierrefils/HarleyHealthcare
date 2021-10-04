package edu.fau.Group1.Config;
import javax.sql.DataSource;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
@Configuration
@ComponentScan("edu.fau.Group1") //what is the right label
//Grabs the connection to mysql server and initiates database connection with validated login
public class SpringJdbcConfig {
	String DATABASE_URL = "jdbc:mysql://66.228.61.104:3306/DBSPRING21G1";
	String DATABASE_USERNAME = "group1spring21db";
	String DATABASE_PASSWORD = "group1ism4243";
	
//Permits JDCT templates to subclasses
	@Bean 
	public DataSource mysqlDataSource (){
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl(DATABASE_URL);
		dataSource.setUsername(DATABASE_USERNAME); 
		dataSource.setPassword(DATABASE_PASSWORD); 
		return dataSource;
	}
}
