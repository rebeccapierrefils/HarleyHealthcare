<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"

    import = "edu.fau.Group1.util.DBUtil"
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
<title>Check In</title>
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

/* Form title */
h2{
background-color: #f1f1f1;
}

/* Style the form */
#VisitorForm {
  background-color: #ffffff;
  width: 100%;
  min-width: 300px;
  align: center;
}

/* Style the input fields */
input {
  padding: 10px;
  width: 100%;
  font-size: 17px;
  border: 1px solid #aaaaaa;
}

/* Mark input boxes that gets an error on validation: */
input.invalid {
  background-color: #ffdddd;
}

/* Hide all steps by default: */
.tab {
  display: none;
}

/* Make circles that indicate the steps of the form: */
.step {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbbbbb;
  border: none;
  border-radius: 50%;
  display: inline-block;
  opacity: 0.5;
}

/* Mark the active step: */
.step.active {
  opacity: 1;
}

/* Mark the steps that are finished and valid: */
.step.finish {
  background-color: #4CAF50;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
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

/* Dropdown for State */            
select{
 display: block;
 box-sizing: border-box;
 width: 100%;
 height: 50px;
 margin:0;
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
<form id="VisitorForm" action="AddVisitor.jsp" onsubmit="return validateForm()" method="post">

<h2>Register as a New Visitor</h2>

<!-- One "tab" for each step in the form: -->
<div class="tab">
    <p><input placeholder="First Name" oninput="this.className = ''" name="firstname"></p>
    <p><input placeholder="Last Name" oninput="this.className = ''" name="lastname"></p>
  </div>
  <div class="tab">
    <p><input placeholder="Email" oninput="this.className = ''" name="email"></p>
    <p><input placeholder="Phone Number" oninput="this.className = ''" name="phonenumber" maxlength="10"></p>
  </div>
<div class="tab">Select Patient you are Visiting
<select name="patid" style="width:100%;" >

  <% // java code to get nurse and doctor for first drop down
		
  
  // list to get all patients
	Patient p = DBUtil.getPatById(1); 		
  List<Patient> patList = DBUtil.getAllPatient();
  String patFirstName = p.getFirstName();
	String patLastName = p.getLastName();
				

		
	// end java code to get nurse and doctor
	%>
	
	
<%
for(int index=0; index < patList.size(); index++){
if(patList.get(index).getPatient_ID() ==p.getPatient_ID())
out.print("<option value="+ patList.get(index).getPatient_ID() + " selected>" 
+ patList.get(index).getFirstName() + " " + patList.get(index).getLastName() + "</option>");
else{
out.print("<option value="+ patList.get(index).getPatient_ID() + ">" 
+ patList.get(index).getFirstName() + " " + patList.get(index).getLastName() + "</option>");
}
}
%>
								</select>
  </div>

  <div style="overflow:auto;">
    <div style="float:right;">
      <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
      <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
    </div>
  </div>

<!-- Circles which indicates the steps of the form: -->
<div style="text-align:center;margin-top:40px;">
  <span class="step"></span>
  <span class="step"></span>
  <span class="step"></span>

</div>

	<!-- Sign in button -->
<div class="signin">
		<span>Not Ready to Check In? <a href="VisitorPortal.html">Return to Visitor Portal</a>.</span>
  </div>
</form>
</div>
 <div class="footer"><br>FINDING NEW WAYS TO HEAL</div>



<script>
var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the current tab

function showTab(n) {
  // This function will display the specified tab of the form...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  //... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) {
    document.getElementById("nextBtn").innerHTML = "Submit";
  } else {
    document.getElementById("nextBtn").innerHTML = "Next";
  }
  //... and run a function that will display the correct step indicator:
  fixStepIndicator(n)
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()) return false;
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form...
  if (currentTab >= x.length) {
    // ... the form gets submitted:
    document.getElementById("VisitorForm").submit();
    return false;
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
}

function validateForm() {
  // This function deals with validation of the form fields
  var x, y, i, valid = true;
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");
  // A loop that checks every input field in the current tab:
  for (i = 0; i < y.length; i++) {
    // If a field is empty...
    if (y[i].value == "") {
      // add an "invalid" class to the field:
      y[i].className += " invalid";
      // and set the current valid status to false
      valid = false;
    }
  }
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid; // return the valid status
}

function fixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class on the current step:
  x[n].className += " active";
}
</script>

</body>
</html>