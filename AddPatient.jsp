<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import = "edu.fau.Group1.model.*"
    import = "edu.fau.Group1.util.*"
    import = "edu.fau.Group1.services.*"
    import = "java.Group1.util.*"
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Thank You For Registering</title>
<style type="text/css">
	
/* Font */
body {
  font-family: Arial, sans-serif;
}
	
/* Company Name */
.header {
  padding-bottom: 10px;
  margin-left: 200px;
  text-align: center; 
  background: #1963DB; 
  color: white;
  width: 100%;
  float: right;
  position: relative;
}


/* The left hand navigation menu */
.navigation {
  margin: 0;
  padding: 0;
  width: 200px;
  background-color: #f1f1f1;
  position: sticky;
  height: 1000px;
  overflow: auto;
  float: left;
}

/* Navigation links */
.navigation a {
  display: block;
  color: black;
  padding: 16px;
  text-decoration: none;
}

/* Active/current link */
.navigation a.active {
  background-color: rgba(148,175,101,1);
  color: white;
}

/* Links on mouse-over */
.navigation a:hover:not(.active) {
  background-color: #555;
  color: white;
}


/* Logout link*/
.navigation a.logout{
  color: red;
}

/* Page content. The value of the margin-left property should match the value of the sidebar's width property */
div.content {
  padding: 1px 16px;
  height: 700px;
  width:800px;
  text-align: left;
  align-items: left;
  margin-left: 10%;
  align: center;
  position: static;
  display: box;
  float: left;
  text-align: center;
  align-items: center;
  margin-bottom: 60px;
  margin-top: 50px;
}
            
/* Welcome message */           
h2 {
  display: flex;
  background: #f1f1f1;
  max-height: 30px;
  margin-bottom: 30px;
  position: relative;
  justify-content: center;
}
/* Patient details */ 
h3 {
  display: flex;
  max-height: 30px;
  margin-bottom: 30px;
  position: relative;
  justify-content: center;
    
}

/* Result Section */
.result {
  align: center;
  box-sizing: border-box;
  width: 100%;
  height:50px;
  outline: none;
  margin:0;
}

/*Footer*/
     .footer{
            background-color: #1963DB;
            height: 50px;
            width: 100%;
            text-align: center;
            color:white;
            bottom: 0;
            position: fixed;
            }

 
/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.register {
  padding: 10px;
  background-color: #f1f1f1;
  text-align: center;
}
</style>
</head>
<body>
<!-- New patient and all their details are added to the Patient table in our database and a thank you message is displayed 
with their Patient ID, and name -->
<!-- Header -->
 <div class="header">
 	<img src="images/HarleyLogo.png" style="float:top;width:350px;height:300px;">  
</div>
		
<!-- The navigation -->
<div class="navigation">
  <a  href="index.html">Home</a>
  <a href="VisitorPortal.html">Visitors</a>
  <a class="active" href="PatientLoginScreen.html">Patients</a>
  <a href="HospitalStaffLogin.html">Hospital Staff</a>
  <a class="logout" href="logout.jsp">Logout</a>
</div>

<!-- Page content -->
	
<!-- Form -->
<div class="content">
	<div class="result">
		<div class="resultcontent">
	<%
	//retrieves data inputted into the previous newPatientForm
	String firstname = request.getParameter("firstname");
	String lastname = request.getParameter("lastname");
	String email = request.getParameter("email");
	String phonenumber = request.getParameter("phonenumber");
	String dob = request.getParameter("dob");
	String ssnum = request.getParameter("ssnum");
	String address = request.getParameter("address");
	String address2 = request.getParameter("address2");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	String zipcode = request.getParameter("zipcode");
	
	//creates Patient object using the retrieved data to satisfy our required parameters	
		Patient p = new  Patient(firstname, lastname, email, phonenumber, dob, ssnum,
				address, address2, city, state, zipcode);
	
		// if true Store Patient object into SQL database
		boolean didSave = DBUtil.createPatient(p);
		// if saved to database, print confirmation screen with the following outputs, otherwise output error message
		if (didSave){
			out.print("<h2>Thank You for Registering!</h2>");
			out.print("<h3>Patient name: "+ p.getFirstName() + " " + p.getLastName() + "</h3>");
		}
		// if the patient already exists in our database an error message will be displayed
		else if (didSave==false){
			out.print("<h3>Id " + p.getPatient_ID()+ " already exist! "+ "</h3>");
		}
		// if the employee was not saved for a different reason an error message will occur	
		else {
			out.print("<h3>Error registering, contact helpdek</h3>");
		}
	%>
		<div class="register">
		<span style="font-size:20px">Time to Create a Username and Password&nbsp;&nbsp;<a href="CreateLogin.html">
		Create Login</a>.</span>
  		</div>
		</div>
		</div>
		</div>
		  <div class="footer"><br>FINDING NEW WAYS TO HEAL</div>
</body>
</html>