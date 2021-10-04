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
<title>Harley Healthcare</title>
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
  border-style: solid;
  border-color: #DDB1F1;
  border-bottom: none;
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
    border-style: solid;
    border-right: none;
  border-color: #DDB1F1;
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
  width: calc(100% - 200px - 26%);
  text-align: left;
  align-items: left;
  border-style: solid;
  border-color: #DDB1F1;
  border-right: none;
  position: relative;
  float: left;
  display: box;          
}

/* News Feed */
div.newsfeed {
  padding: 1px 16px;
  height: 100%;
  width:20%%;
  display: box;
  float: right;
  fixed;
  text-align: left;
  align-items: left;
  border-style: solid;
  border-color: #DDB1F1;
  background-color: #D8BFD8;
                
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
	
	h3{
	font-size:23px;
	}
	p{
	
	font-size:20px;
	}
       
/* Body */
.welcomemessage {
  background: #fff;
  padding: 30px;
  max-width: 55%;
  max-height: 250px;
  float: left;
  margin: 0 auto 0;
  border-radius: 2px;
}

/* checkin button */
.checkin {
   float: right;
   padding: 30px;
   padding-bottom: 20px;
   border:solid;
   border-color: white;
   background-color: white;
   text-align: right;
   text-transform: uppercase;
   max-height: 250px;
   max-wifth: 250px;
   background: white;
   text-shadow:0 1px 3px darken($button, 30%);
                
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

 /* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgba(148,175,101,1); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  
}

/* Modal Content/Box */
.modal-content {
  background-color: rgba(148,175,101,1);;
  margin: 15% auto; /* 15% from the top and centered */
  padding: 20px;
  border: 1px solid #888;
  width: 50%; /* Could be more or less, depending on screen size */
  text-align-last: center;
  
  
}

/* The Close Button */
.close {
  color: black;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}  

.docdir {
	border: solid;
	border-color: black;
	display: block;
	float: left;
	height:auto;
	width: 100%;
	background-color: #FFDE59;
	content-align: center;
}  

/* Style the dropdown fields */
select {
  padding: 10px;
  width: 100%;
  font-size: 17px;
  border: 1px solid #aaaaaa;
  height: 50px;
    border-right: 100px;
  border-color: white;
}




form { 
position: relative;
float: center; 
width:100%;
padding-left: 10px;
padding-right: 10px;
padding-bottom: 70px;
}
        
            
            iframe:focus {
  outline: none;
  height: 100%;
}

iframe[seamless] {
  display: block;
  height: auto;
}
 

  /* Submit button */
a {
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

   .footer{
            background-color: #1963DB;
            height: 50px;
            width: 100%;
            text-align: center;
            color:white;
            bottom: 0;
            position: fixed;
            }     

    </style>
    
  </head>
<body> 

<%
	// AUTHENTICATION
		Integer uid = (Integer)session.getAttribute("sessionID");
		if (uid == null) {
			%>
				<jsp:forward page="PatientLoginScreen.html"/>
			<%	
		}// END AUTHENTICATION
		
				User user = DBUtil.getUserById(uid);
				String username = user.getUsername();
	%>
	
	
	
<!-- Header -->
 <div class="header">
 	<img src="images/HarleyLogo.png" style="float:top;width:350px;height:300px;">  
</div>
<!-- The navigation -->
<div class="navigation">
  <a  href="index.html">Home</a>
  <a  href="VisitorPortal.html">Visitors</a>
  <a href="PatientLoginScreen.html">Patients</a>
  <a class="active" href="HospitalStaffLogin.html">Hospital Staff</a>
  <a class="logout" href="logout.jsp">Logout</a>
</div>
<!-- Page content -->
        <div class="content">
                    <h2>Welcome to the the Employee portal!</h2><br>
	 <img src="images/employeeportal.jpg" style="padding-bottom:30px;float:left;width:100%;height:300px;">
               <br>
                <div class="welcomemessage">
    <h1 style="font-size:25px">Welcome to Harley Healthcare! Please use this portal to clock-in for work, view news, and search the directory.</h1>
	<br>

	</div>


 <br>
 
	<!-- check-in button -->
    
    <!-- Trigger/Open The Modal -->
    <div class="checkin">
		<button id="myBtn" style="background color: white; hover: none; font-size:17px; color:#008037;width:100%;
		position: relative;float:right;margin-left:20px;padding:10px;border:solid;border-color:black;"><strong>CHECK IN</strong></button>
	</div>
	
	<!-- The Modal -->
	<div id="myModal" class="modal">

  	<!-- Modal content -->
  	<div class="modal-content">
    <span class="close">&times;</span>
    <div class="checkintext">
    <p><strong>You are now clocked in!</strong><br><br>~ Harley Healthcare ~</p>
    </div>
  </div>

</div>

    <br>
    <br>
    </br>
    
    <div class="checkin" style="background-color: #FFDE59; float:left;text-transform: capitalize;width:40%">
    <p style="text-align: center;"><b>Add Patient to Your Care</b><br><input type="text" name="empID" id="empID" value="Enter Your Employee ID" style="height:100px;width:60%;font-size:20px;">
    <input style="text-align: left;background color: grey; color:#008037;width:30%;position: relative;float:right;margin-left:10px;padding:0;border:solid;border-color:black;" type="submit" value="Search" onclick="searchEmpById()"></p> 
           
            </div>   
            	<br>
	<br>
	<br>
	<br>
	 <img src="images/selectPatient.jpg" style="float:right;width:50%;height:220px;">
       
        <br><br><br>
                        <div id="docnotes" style="float:left;margin:30px;">
                    
                   
                </div>
                <br>
                <hr>
                

    <br>
    
    
   <!-- Doctor directory java and javascript code -->
   <div class="docdir">
           
         <% // java code to get nurse and doctor for first drop down
		
		// list to get all HospitalStaff
		List<HospitalStaff> nameList = DBUtil.getAllHospitalStaff();
		// list to get all Positions
		List<Positions> posList = DBUtil.getAllPositions();
		
		// initializing variable
		Integer positionId = 0;
	
	
		try {
			positionId = Integer.parseInt(request.getParameter("POSID"));
		}
		catch (NumberFormatException e) {
			positionId =1;
		} // for position
		
			// list to add hospitalstaff objects
			List<HospitalStaff> staffWithPosition = new ArrayList<>();
				
			// matches the foreign key for positionId to actual positionId. If true, adds staff object
			for (HospitalStaff staff : nameList) {
				if (staff.getFk_positionId() == positionId) {
					staffWithPosition.add(staff);
				}
			};
		
	// end java code to get nurse and doctor
	%>
	
	
	<!-- Header for doctor directory -->
	<h2>Doctor Directory: Please select Health Care Type</h2>

	<!-- This is a div for the selection drop down -->
	<form>
	<!-- 1st selection tool/drop down for nurse and doctor -->
	<select name="position" id="selectPosition" style=" padding-left: 30px; width: 25%; float: left;">
	
	
		<% // This java code creates a list of either the names of doctors or nurses and puts it in another selection drop down
		
			// Gets list based on employee_ID and displays names in drop down list
			for(int index=0; index<posList.size(); index++) {
				if (positionId == posList.get(index).getPositionId())
					out.print("<option value =" +posList.get(index).getPositionId() + " selected>" + posList.get(index).getPosition() + "</option>");
				else
					out.print("<option value=" + posList.get(index).getPositionId() + ">" + posList.get(index).getPosition() + "</option>");
			} // end for loop
			out.print("</select>");
					
			// end java code for names drop down		
		%> 
		</select>
		<input type="button" value="Search" onclick="displayDocs()" style="margin-left: 20px; margin-right: 20px; background-color: #008037; color: white; width: 25%; float: left;">
		<select name = "docname" id="selectDocName" style=" padding-left: 30px; width: 40%; float: left;"> 
		
		<% // creates list that shows the names of either doctors or nurses
			for (int i=0; i < staffWithPosition.size(); i++) { 
				out.print("<option value=" + staffWithPosition.get(i).getEmployee_ID() + ">" + staffWithPosition.get(i).getLastName() + "</option>");
			}
		// end list that shows doctors or nurses
		%>
		
		<!-- The button that will generate doctor or nurse names -->
		</select><!-- End select for doctor and nurse names -->
		<br><br><br><br>
		<a href="allEmployees.jsp" style="margin-left: 20px; background-color: #008037; color: white; width: 90%; float: left;">Dispay All Staff</a>

		</form> <!-- end of form -->
    
    	</div> <!-- end div for docdir --> 
    	
    	   
</div> <!-- End Page content --> 

 <div class="newsfeed">
            <h1>News Feed</h1>
            <iframe float="right" font-size="9px" width="100%" height="100%" src="https://rss.app/embed/v1/G0lXj4dI3OJ7Ejeh" frameBorder="0"></iframe>
            
        </div>
    
   <div class="footer"><br>FINDING NEW WAYS TO HEAL</div>
</body>

<!-- Javascript for modal check-in popup -->
                <script>
             // Get the modal
                var modal = document.getElementById("myModal");

                // Get the button that opens the modal
                var btn = document.getElementById("myBtn");

                // Get the <span> element that closes the modal
                var span = document.getElementsByClassName("close")[0];

                // When the user clicks on the button, open the modal
                btn.onclick = function() {
                  modal.style.display = "block";
                }

                // When the user clicks on <span> (x), close the modal
                span.onclick = function() {
                  modal.style.display = "none";
                }

                // When the user clicks anywhere outside of the modal, close it
                window.onclick = function(event) {
                  if (event.target == modal) {
                    modal.style.display = "none";
                  }
                } 
                
                
              
                
    			// Javascript that will select either doctors or nurse based on positionId on click of button
    			function displayDocs() {
    				var selectedIndex = document.getElementById("selectPosition").selectedIndex;
    				var posId = document.getElementById("selectPosition").value;
    				console.log(posId);
    				window.location.replace("patientPortal.jsp?POSID="+posId);
    				
    			} // end displayDocs function
    			
    
                </script>

</html>