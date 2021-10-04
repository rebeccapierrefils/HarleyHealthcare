<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "edu.fau.Group1.util.*"
    import = "edu.fau.Group1.model.HospitalStaff"
    import = "edu.fau.Group1.model.*"
    import = "java.util.List"
    import = "edu.fau.Group1.services.*"
     import = "java.time.*"
    import = "java.time.format.DateTimeFormatter"
    
    %>
<!DOCTYPE hmtl>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<html>
<head>
<title>Schedule Appointment</title>
 <style>
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
  height: 100%;
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


.navigation a.logout{
  color: red;
}

/* Page content. The value of the margin-left property should match the value of the sidebar's width property */
div.content {
  padding: 1px 16px;
  height: auto;
  width:800px;
  text-align: left;
  align-items: left;
  margin-bottom: 60px;
  margin-left: 10%;
  margin-top: 50px;
  border-style: solid;
  padding-top:20px;
  border-color: #DDB1F1;
  align: center;
  position: static;
  float: left;
  display: box;

               
}

 /* Submit Button */
$button: rgba(148,186,101,0.7);
  
/* Whole Form */
form {
  background: #fff;
  padding: 4em 4em 2em;
  max-width: 400px;
  margin: 50px auto 0;
  border-radius: 2px;
  height: 700px;
}
            
/* Each line of form */           
p {
  display: flex;
  max-height: 30px;
  margin-bottom: 30px;
  position: relative;
}

	/* Form title */ 
	h2{
		background-color: #f1f1f1;
	}
    
/* Each field of form */
input {
  box-sizing: border-box;
  width: 100%;
  height:50px;
  outline: none;
  margin:0;
}     
            
/* Space for entry in fields */           
input[type="text"] {
  background: #fff;
  border: 1px solid #dbdbdb;
  font-size: 1 em;
  padding: .8em .5em;
  border-radius: 2px;
  float:left;
  margin: 10px;
}

/* Submit button */
input[type="submit"] {
  background: $button;
  box-shadow: 0 3px 0 0 darken($button, 10%);
  border-radius: 2px;
  border: none;
  color: #fff;
  cursor: pointer;
  display: block;
  font-size: 1.5em;
  line-height: 1.6em;
  text-align: center;
  margin: .5em 0 0;
  outline: none;
  padding: 0em 0;
  text-shadow: 0 1px #008037;
}
	
/* Submit button on mouse-over */
input[type="submit"]:hover {
  background: rgba(148,175,101,1);
  text-shadow:0 1px 3px darken($button, 30%);
}
      
/* Submit button on mouse-over */
input[type="button"]:hover {
  background: rgba(148,175,101,1);
  text-shadow:0 1px 3px darken($button, 30%);
}
     
        
/* Submit button */
input[type="button"] {
  background: $button;
  box-shadow: 0 3px 0 0 darken($button, 10%);
  border-radius: 2px;
  border: none;
  color: #fff;
  cursor: pointer;
  display: block;
  font-size: 1.5em;
  line-height: 1.6em;
  text-align: center;
  margin: .5em 0 0;
  outline: none;
  padding: 0em 0;
  text-shadow: 0 1px #008037;
}

	/* Page title */ 
	h2{
		background-color: #FFDE59;
		padding: 30px;
		text-align:center;
	}
       




     .footer{
            background-color: #1963DB;
            height: 50px;
            width: 100%;
            text-align: center;
            color:white;
            bottom: 0;
            position: fixed;
            }
th{
text-align: left;
}

            /* Submit button */
input[type="button"] {
  background: $button;
  box-shadow: 0 3px 0 0 darken($button, 10%);
  border-radius: 2px;
  border: none;
  color: #fff;
  cursor: pointer;
  display: block;
  font-size: 1.5em;
  line-height: 1.6em;
  text-align: center;
  margin: .5em 0 0;
  outline: none;
  padding: 0em 0;
  text-shadow: 0 1px #008037;
}

/* Submit button on mouse-over */
input[type="button"]:hover {
  background: rgba(148,175,101,1);
  text-shadow:0 1px 3px darken($button, 30%);
}

p{
font-size: 25px;
font-weight: bold;
text-align:center;
}
    </style>
    
  </head>
<body> 

<%
	// AUTHENTICATION
	Integer uid = (Integer)session.getAttribute("sessionID");
	if (uid == null) {
	%>
	<jsp:forward page="patientPortal.jsp"/>
	<%
	}// END AUTHENTICATION
	
	User user = DBUtil.getUserById(uid);
	String name = user.getUsername();
	%>

	<!-- Header -->
 <div class="header">
 	<img src="images/HarleyLogo.png" style="float:top;width:350px;height:300px;">  
</div>
 <!-- The navigation -->

<div class="navigation">
  <a href="index.html">Home</a>
  <a  href="VisitorPortal.html">Visitors</a>
  <a class="active" href="PatientLoginScreen.html">Patients</a>
  <a href="HospitalStaffLogin.html">Hospital Staff</a>
  <a class="logout" href="logout.jsp">Logout</a>
</div>
<!-- Page content -->
<div class="content">
<form>

<%
	String appointment = request.getParameter("schedule");
	String timeforappt = request.getParameter("TimeApp");
	
	int empId = Integer.parseInt(request.getParameter("Employee"));
	String chkin = appointment + " " + timeforappt;
	String chkout = appointment + " " + LocalTime.parse(timeforappt).plusMinutes(30)+ ":00";
	Appointment a = new Appointment();
	a.setPatient_ID(user.getUserId());
	a.setEmployee_ID(empId);
	DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	
	a.setCheckin(LocalDateTime.parse(chkin , df));
	a.setCheckout(LocalDateTime.parse(chkout , df));
	out.print(a.getCheckout());
	
	
	if (DBUtil.createAppointment(a)){
	
		out.print("<h2>Appointment Confirmation</h2>");
		
		String empname = DBUtil.gethsById(empId).getLastName();
		//String empfname = DBUtil.gethsById(empId).getFirstName();
		out.print("<p>Patient name: " + name + "</p>");
		out.print("<p>Hospital Staff name: " + empname + "</p>");
		out.print("<p>Appointment from: " + chkin + "</p>");
		out.print("<p>to: " + chkout + "</p>");
	}
	
	else {
		out.print("<p>Error</p>");
	}
	
		
		
		
 %>
 </form>
 <input type="button" style="width:100%; heigh: 100%;" value="PROCEED TO PATIENT PORTAL" onclick="newDoc()"><br><br>
	
	 <div class="footer"><br>FINDING NEW WAYS TO HEAL</div>		 
</body>
  <script>
  
  function newDoc() {
	  window.location.assign("patientPortal.jsp")
	}
  
  </script>
</html>