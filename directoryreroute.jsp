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
<title>Directory</title>
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

/* Page content. The value of the margin-left property should match 
the value of the sidebar's width property */
div.content {
  padding: 1px 16px;
  height: 700px;
  width:800px;
  text-align: left;
  align-items: left;
  margin-bottom: 60px;
  margin-left: 10%;
  margin-top: 50px;
  border-style: solid;
  border-color: #DDB1F1;
  border-bottom: none;
  align: center;
  position: static;
  float: left;
  display: box;

               
}

 /* Submit Button */
$button: rgba(148,186,101,0.7);
  
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
        

	/* Page title */ 
	h2{
		background-color: #FFDE59;
		padding: 30px;
		text-align:center;
	}
       


.checkin {
                float: right;
                padding: 30px;
                padding-bottom: 20px;
                border:solid;
                border-color: black;
                background-color: #FFDE59;
                text-align: right;
                text-transform: uppercase;
                max-height: 250px;
                max-wifth: 250px;
                
}
       
.print {
                float: right;
                padding: 30px;
                padding-bottom: 20px;
                border:solid;
                border-color: black;
                background-color: #FFDE59;
                text-align: left;
                text-transform: uppercase;
                max-height: 250px;
                max-width: 227px;
                margin-top:30px;
                     
                
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


th{
text-align: left;
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
  <a href="index.html">Home</a>
  <a href="VisitorPortal.html">Visitors</a>
  <a class="active" href="PatientLoginScreen.html">Patients</a>
  <a href="HospitalStaffLogin.html">Hospital Staff</a>
  <a class="logout" href="logout.jsp">Logout</a>
</div>
<!-- Page content -->
<div class="content">
    <h2>Hospital Staff Directory!</h2>
 	<%
 	//get a list of all hospital staff
		List<HospitalStaff> hsList = DBUtil.getAllHospitalStaff();
	%>
		<table style="width:100%; height:100%; padding-left:15%;">
		<th>Position</th><th>Full Name</th><th>Phone Number</th>
			</tr>
			<%
			
			//for loop to retrieve and display all employees listed in the hospital staff table
				for (int index=0; index < hsList.size(); index++){ 
				%>
				<tr>
					<td><%=hsList.get(index).getPosition()%></td>
					<td><%=hsList.get(index).getFirstName() + " " + hsList.get(index).getLastName()%></td>
					<td><%=hsList.get(index).getPhoneNumber() %></td>
					
				</tr>	
				<% }
			%>
		</table>
		 <input type="button" style="width:100%; heigh: 100%;" value="BACK TO PATIENT PORTAL" onclick="newDoc()">
</div>

    <div class="footer"><br>FINDING NEW WAYS TO HEAL</div>
</body>
<script>
		
		
		function newDoc() {
			  window.location.assign("patientPortal.jsp")
			}
	</script>
</html>