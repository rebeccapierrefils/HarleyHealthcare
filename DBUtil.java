package edu.fau.Group1.util;



import java.util.List;


import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.dao.DuplicateKeyException;

import edu.fau.Group1.Config.*;
import edu.fau.Group1.model.*;
import edu.fau.Group1.services.*;




//establishes link between jsp files and database with the model files
public class DBUtil {
	
 // Connects DBUtil to Service class to call methods that are necessary for functionality
	final static AnnotationConfigApplicationContext CONTEXT = new 
 AnnotationConfigApplicationContext(SpringJdbcConfig.class);
 //Extending the Patient model class
	final static PatientService PATIENT_SERVICE = CONTEXT.getBean(PatientService.class);
 //Extending the Visitors model class
	final static VisitorsService VISITOR_SERVICE = CONTEXT.getBean(VisitorsService.class);
 //Extending the Hospital staff model class
	final static HospitalStaffService HOSPITALSTAFF_SERVICE = CONTEXT.getBean(HospitalStaffService.class);
 //Extends the User  model class
	final static UserService USER_SERVICE = CONTEXT.getBean(UserService.class);
 //Extends the Positions  model class
	final static PositionsService POSITIONS_SERVICE = CONTEXT.getBean(PositionsService.class);
 //Extends the Appointment model class
	final static AppointmentService APPOINTMENT_SERVICE = CONTEXT.getBean(AppointmentService.class);
 //Extends the TimeApp model class
	final static TimeAppService TIMEAPP_SERVICE = CONTEXT.getBean(TimeAppService.class);

 //Calls for all Patients in Patient Service table and returns list
	public static List<Patient> getAllPatient(){
		return PATIENT_SERVICE.getAll();
	}//end method getAllPatient
	
 //Calls for all Visitors in Visitor Service table and returns list
	public static List<Visitors> getAllVisitor(){
		return VISITOR_SERVICE.getAll();
	} //end method getAllVisitor
	
//Calls for all Hospital Staff in Hospital Staff table and returns list
	public static List<HospitalStaff> getAllHospitalStaff(){
		return HOSPITALSTAFF_SERVICE.getAll();
	} //end method getAllHospitalStaff
	
 //Calls for all Users in User table and returns list
	public static List<User> getAllUsers(){
		return USER_SERVICE.getAll();
}//end method getAllUsers
	
 //Calls for all Positions in Positions table and returns list
	public static List<Positions> getAllPositions() {
		return POSITIONS_SERVICE.getAll();
	}//end method getAllPositions
 
	//Implements Patients by using their name from Patient table and returns all patients by their name
	public static List<Patient> getPatByName(String name){
		return PATIENT_SERVICE.getByName(name);
	}//end method getPatByName
	
 //Implements Visitors by using their name from Visitor table and returns all visitors by their name
	public static List<Visitors> getVisByName(String name){
		return VISITOR_SERVICE.getByName(name);
	} // end method getVisByName
 
	//Implements Hospital Staff by using their names from Hospital Staff table and returns all hospital staff by their name
	public static List<HospitalStaff> gethsByName(String name){
		return HOSPITALSTAFF_SERVICE.getByName(name);
	}//end method gethsByName
	
 //Implements patient by using their ID from Patient table and returns patients by ID
	public static Patient getPatById(int id){
		return PATIENT_SERVICE.getById(id);
	}//end method getPatById
	
 //Implements visitors by using their ID from visitor table and returns visitors by their ID
	public static Visitors getVisById(int id){
		return VISITOR_SERVICE.getById(id);
	} //end method getVisById
	
	 //Implements users by using their ID from user table and returns users by their ID
 public static User getUserById(int id){
		return USER_SERVICE.getById(id);
	} //end method getUserById
	
	 //Implements Hospital Staff by using their ID from Hospital Staff table and returns staff by their ID
 public static HospitalStaff gethsById(int id){
		return HOSPITALSTAFF_SERVICE.getById(id);
	}//end method gethsById
	
  //Implements Positions by using their ID from Positions table and returns positions by their ID
	public static Positions getposById(int id) {
		return POSITIONS_SERVICE.getById(id);
	}//end method getposById
	
 
 //Assures username and password match. If true, will return user object. If not will be invalid and return -1
	public static int checkUsernameAndPassword(String username, String password){
		List<User> userList = USER_SERVICE.getAll();
		
		for	(int i = 0 ; i < userList.size() ; i++){
			if (userList.get(i).getUsername().equals(username)){
				if (userList.get(i).getPassword().equals(password)){
					return userList.get(i).getUserId();
				}
				break;
			}
		}return -1;
	}//end method checkUsernameAndPassword

	//Method creates new patient through Patient Service 
 public static boolean createPatient(Patient p){
		return PATIENT_SERVICE.create(p);
	} //end method createPatient
	
 //Method creates new User through User Service 
 public static boolean createUser(User user){
		return USER_SERVICE.create(user);
	}//end method createUser
	
 
 //Method creates new Visitor through Visitor Service 
 public static boolean createVisitor(Visitors v){
		return VISITOR_SERVICE.create(v);
	}//end method createVisitor
	
 //Method creates new Hospital Staff through HospitalStaff Service 
 public static boolean createHospitalStaff(HospitalStaff hs){
		return HOSPITALSTAFF_SERVICE.create(hs);
	}//end method createHospitalStaff
 
	 //Method updates existing Patient through Patient Service 
	public static boolean updatePatient(Patient p){
		return PATIENT_SERVICE.update(p);
	}//end method updatePatient
	
  //Method updates existing Visitor through Visitor Service 
	public static boolean updateVisitor(Visitors v){
		return VISITOR_SERVICE.update(v);
	}//end method updateVisitor
	
  //Method updates existing Hospital through Hospital Service 
	public static boolean updateHospitalStaff(HospitalStaff hs){
		return HOSPITALSTAFF_SERVICE.update(hs);
	}//end method updateHospitalStaff

	 //Method deletes existing Patient through Patient Service 
 public static boolean deletePatient(int id){
		return PATIENT_SERVICE.delete(id);
	}//end method deletePatient
	
  //Method deletes existing Visitor through Visitor Service 
	public static boolean deleteVisitor(int id){
		return VISITOR_SERVICE.delete(id);
	}//end method deleteVisitor
	
	//Method deletes existing Hospital Staff through Hospital Staff Service
 public static boolean deleteHospitalStaff(int id){
		return HOSPITALSTAFF_SERVICE.delete(id);
	}//end method deleteHospitalStaff
 
 //Lists all appointments existing in Appointments table
 public static List<Appointment> getAllAppointment(){
	 	return APPOINTMENT_SERVICE.getAll();
	}// end method getAllAppointment
 
//returns existing bookings from Appointment table by ID
 public static Appointment getBookingById(int id){
	 	return APPOINTMENT_SERVICE.getById(id);
	}// end method getBookingById

 //returns list of all appointments by specified patient_ID
 public static List<Appointment> getByPatient_ID(int id){
		return APPOINTMENT_SERVICE.getByPatient_Id(id);
 	}// end method getByPatient_ID

 //inserts new appointment in Appointment table
 public static boolean createAppointment(Appointment a){
	 	return APPOINTMENT_SERVICE.create(a);
 	}// end method createAppointment

 //returns list of all time slots from TimeApp table
 public static List<TimeApp> getAllTime(){
	 	return TIMEAPP_SERVICE.getAll();
 	}// end method getAllTime

 //returns time slot from TimeApp table by specified ID
 public static TimeApp getTimeById(int id){
	 	return TIMEAPP_SERVICE.getById(id);
 	}//end method getTimeById
 
}//end DBUTIL
