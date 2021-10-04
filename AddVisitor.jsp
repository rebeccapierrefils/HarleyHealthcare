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

            

/* Visitor details */ 
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

     .footer{
            background-color: #1963DB;
            height: 50px;
            width: 100%;
            text-align: center;
            color:white;
            bottom: 0;
            position: fixed;
            }

	/* Page title */ 
	h2{
		background-color: #FFDE59;
		padding: 30px;
		text-align:center;
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
	
</style>
</head>
<body>
<!-- Header -->
  <div class="header">
 	<img src="images/HarleyLogo.png" style="float:top;width:350px;height:300px;">  
</div>

<!-- The navigation -->
<div class="navigation">
  <a  href="index.html">Home</a>
  <a class="active" href="VisitorPortal.html">Visitors</a>
  <a href="PatientLoginScreen.html">Patients</a>
  <a href="HospitalStaffLogin.html">Hospital Staff</a>
  <a class="logout" href="logout.jsp">Logout</a>
</div>

<!-- Page content -->
		
<!-- Form -->
<div class="content">
	<div class="result">
		<div class="resultcontent">
	
	<%
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String phonenumber = request.getParameter("phonenumber");
		int patient_ID = Integer.parseInt(request.getParameter("patid"));
		
		Visitors v = new Visitors(firstname, lastname, email, phonenumber, patient_ID);
		
		boolean didSave = DBUtil.createVisitor(v);
		
		if (didSave){
			out.print("<h2>Thank You for Registering!</h2>");
			out.print("<h3>Visitor name: "+ v.getFirstName() + " " + v.getLastName() + "</h3>");
		}
		else if (didSave==false){
			out.print("<h3>Id " + v.getVisitor_ID()+ " already exist! "+ "</h3>");
		}
		
		else {
			out.print("<h3>Error registering, contact helpdek</h3>");
		}
	%>

 <input type="button" style="width:100%; heigh: 100%;" value="View Visitor ID" onclick="newDoc()">
  		</div>
		</div>
		</div>
		  <div class="footer"><br>FINDING NEW WAYS TO HEAL</div>
</body>
<script>
function newDoc() {
			  window.location.assign("visitorDirectory.jsp")
			}
</script>
</html>