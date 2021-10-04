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
<title>Visitor Information</title>
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

  padding-top:20px;
  border-color: #DDB1F1;
  align: center;
  position: static;
  float: left;
  display: box;

               
}

table{
height: auto;
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
  <a class="active" href="VisitorPortal.html">Visitors</a>
  <a href="PatientLoginScreen.html">Patients</a>
  <a href="HospitalStaffLogin.html">Hospital Staff</a>
  <a class="logout" href="logout.jsp">Logout</a>
</div>
<!-- Page content -->
<div class="content">
<h2>WELCOME TO HARLEY HEALTHCARE</h2>
 <input type="button" style="width:100%; heigh: 100%;" value="PRINT YOUR VISITOR PASS" onclick="newDoc()">
</div>

  <div class="footer"><br>FINDING NEW WAYS TO HEAL</div>

</body>
  	
	<script type="text/javascript">
		var answer = confirm('Ready to Print Your Visitor Pass?');

		if (answer){
			<%
			int visitor_ID = Integer.parseInt(request.getParameter("txtid"));
			String firstname = request.getParameter("txtname");
			String lastname = request.getParameter("txtlastname");
			String email = request.getParameter("txtemail");
			String phonenumber = request.getParameter("txtphonenumber");
			int patient_ID = Integer.parseInt(request.getParameter("patid"));
			
			Visitors v = new Visitors(visitor_ID, firstname, lastname, email, phonenumber, patient_ID);
			boolean didSave = DBUtil.updateVisitor(v);
			if (didSave){
				%>
				alert("Visitor " + <%=firstname%> + "" + <%=lastname%> + " added");
				 window.location.assign("VisitorPortal.html")
				<%	
			}
							
			else {
				%>
				alert("No Visitor Pass Printed")
				 window.location.assign("VisitorPortal.html")
			<%}
			%>
		}
		else if (answer ==false) {
			alert("No Visitor Pass Printed")
			 window.location.assign("VisitorPortal.html")
		}
		
		
		function newDoc() {
			  window.location.assign("VisitorPortal.html")
			}
	</script>
</html>