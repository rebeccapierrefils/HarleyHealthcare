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


<!-- visitor credentials are inputed here to search in the database by their ID -->
	<%
		
	//primary key in visitor table to retrieve visitors by their ID
		String sVisid = request.getParameter("ID");
		
	//if stmt to compare visitor ID entered by the user and existing visitor IDs in the visitor table
			if (sVisid.equals("")){
		
				%>
				<script>
					alert("Enter Visitor ID");
					window.open("VisitorPortal.html", "_self");
					//window.location.href = 'MenuWeek12.html';
				</script>
				
				<%
			}	
			else {	
				int vis = Integer.parseInt(sVisid); // PK to match the search
				out.print("Visitor id: " + vis + " ");
				Visitors v = DBUtil.getVisById(vis); //retrive visitor from visitor table by id
				out.print("Visitor name: " + v.getFirstName());
				
				Patient p = DBUtil.getPatById(v.getPatient_ID()); //retrieving patID from patient table
	 			List<Patient> patList = DBUtil.getAllPatient(); //List all patients
	 			String patFirstName = p.getFirstName();
	 			String patLastName = p.getLastName();
	 			
				if (v != null){ 
					
%>
<br><br><br>
					
					<form action="SaveVisitor.jsp" id="frm1" name="frm1" method="post">
						<fieldset style="width:100%;"><legend><em><strong>Please Ensure Your Information is Up-to-Date
							
							<div id="div1">
								
								<input type="hidden" id="txtid" name="txtid" value=<%=v.getVisitor_ID() %>>
							</div>									</strong></em></legend><br>
																	
					
								<p style="float: center;" display: block;>First Name:
								<input type="text" id="txtname" name="txtname" style="width:50%;" value="<%=v.getFirstName() %>" disabled>
						
				
								
								Last Name:
								<input type="text" id="txtlastname" name="txtlastname" style="width:50%;" value="<%=v.getLastName() %>" disabled>
								</p>		<br>
							<p style="float: center;">Email:
								<input type="text" id="txtemail" name="txtemail" style="width:50%;" value=<%=v.getEmail() %> disabled>
										
							
								Phone Number:
								<input type="text" id="txtphonenumber" name="txtphonenumber" style="width:50%;" value=<%=v.getPhoneNumber() %> disabled>
							</p>
							<br><br>
							<p style="float: center;"><legend><em><strong>Please Verify Patient you are Visiting</strong></em></legend>
							
							<select disabled name="patid" style="width:100%;" >
									<%
									
										for(int index=0; index < patList.size(); index++){
											if(patList.get(index).getPatient_ID() ==v.getPatient_ID())
											   out.print("<option value="+ patList.get(index).getPatient_ID() + " selected>" + patList.get(index).getFirstName() + " " + patList.get(index).getLastName() + "</option>");
											else{
												out.print("<option value="+ patList.get(index).getPatient_ID() + ">" + patList.get(index).getFirstName() + " " + patList.get(index).getLastName() + "</option>");
											}
										}
									
									%>
								</select>
								</p>
											
							<div id="div8">
								<input type="button" value="Confirm Information (Required)" onclick="enableForm()"/ >
								<input type="submit" value="Continue"/>
							</div>
						</fieldset>
					</form>
	
					
					<% 

				}
				else {
					out.print("<h2>Visitor not found!</h2>");
				}
			}	
	%>
	</div>
	  <div class="footer"><br>FINDING NEW WAYS TO HEAL</div>
</body>
	<script>
		function enableForm(){
            var inputs = document.getElementsByTagName("input");
            for (var i=0; i < inputs.length; i++){
                  inputs[i].disabled = false;
                  console.log("inside loop");
            }
            
            var selects = document.getElementsByTagName("select");
            for (var i=0; i < selects.length; i++){
                  selects[i].disabled = false;
            }
			
			
		}
	
	</script>
	
	

</html>