<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Edit Employee -- JetAuction</title>
<script language="javascript" type="text/javascript">
// <!CDATA[

function Button1_onclick() {
	var wasFilledInProperly = checkIfFieldsNull();  
	
	//cehck for valid SSN
	if(wasFilledInProperly && !checkSSNValid() )
	{
	
		alert("Bad SSN provided!");
		
		wasFilledInProperly = false;
	}
	
	//check fro valid ZIP
	if(wasFilledInProperly && !checkIfZIPValid() )
	{
		alert("Bad zip code provided");
		
		wasFilledInProperly = false;
	}
	
	//check for valid telephone
	if(wasFilledInProperly && !checkIfTelephoneValid() )
	{
		alert("Bad phone number provided");
		
		wasFilledInProperly = false;
	}
	
	if(wasFilledInProperly && !checkIfEmailValid() )
	{
		alert("Bad email given.");
		
		wasFilledInProperly = false;
	}
	
	if(wasFilledInProperly)
		document.myForm.submit();
}

//check to see if email was valid (xxxx@xxxx.xxx)
function checkIfEmailValid()
{
	var emailString = document.myForm.email.value;
	var splitEmail;
	
	if( (splitEmail = emailString.split("@")).length != 2 )
		return false;
	if(splitEmail[1].split(".").length != 2)
		return false;
	
	return true;
}

//check to see if user provided a valid telephone num
//format of (xxx)-xxx-xxxx
function checkIfTelephoneValid()
{
	var phoneNumArr = document.myForm.phone.value.split("-");
	
	if(phoneNumArr.length != 3)
		return false;
	
	if(phoneNumArr[0].length != 5 || phoneNumArr[1].length != 3 || phoneNumArr[2].length != 4)
		return false;
	
	if(phoneNumArr[0][0] != '(' || phoneNumArr[0][4] != ')')
		return false;
	
	phoneNumArr[0] = phoneNumArr[0].substring(1 , 4); 		//remove ( ) 
	
	//phoneNum is properly formatted
	for(var i = 0; i < phoneNumArr.length; i++)
	{
		for(var u = 0; u < phoneNumArr[i].length; u++)
		{
			//if not a number return false
			if( isNaN(phoneNumArr[i][u]) )
				return false;
		}
	}
	
	return true;
}

//cehck to see if user provided a vlid zip code
function checkIfZIPValid()
{
	var zipCode = document.myForm.zip.value;
	
	if(zipCode.length != 5)
		return false;
	
	for(var i = 0; i < zipCode.length; i++)
	{
		//if not a number return false
		if(isNaN(zipCode[i]))
			return false;
	}
	
	return true;
}

//check to see if user provided a valid SSN
function checkSSNValid()
{
	//split on - if present
	var SSN = document.myForm.ssn.value.split("-");
	
	if(SSN.length != 1 && SSN.length != 3)
		return false;
	
	//should be of form xxx-xx-xxxx
	if(SSN.length == 3)
	{
		if(SSN[0].length != 3 || SSN[1].length != 2 || SSN[2].length != 4)
			return false;
	}
	else if(SSN.length == 1)
	{
		if(SSN[0].length != 9)
			return false;
	}
	
	//SSN is properly formatted
	for(var i = 0; i < SSN.length; i++)
	{
		for(var u = 0; u < SSN[i].length; u++)
		{
			//if not a number return false
			if( isNaN(SSN[i][u]) )
				return false;
		}
	}
	
	//format into DB style (remove -)
	var formattedSSN = "";
	for(var i = 0; i < SSN.length; i++)
		formattedSSN = formattedSSN.concat(SSN[i]);		
	
	document.myForm.ssn.value = formattedSSN;
	
	return true;
}

//Check to see if all fields have been filled in, return true if yes, else false
function checkIfFieldsNull()
{
	if(document.myForm.Id.value == "")
	{
		alert("You must give a username!!!")
		
		return false;
	}
	else if(document.myForm.fname.value == "")
	{
		alert("You must give your first name!!!")
		
		return false;
	}
	else if(document.myForm.lname.value == "")
	{
		alert("You must give your last name!!!")
		
		return false;
	}
	else if(document.myForm.address_line_1.value == "")
	{
		alert("You must give your address!!!")
		
		return false;
	}
	
	else if(document.myForm.state.value == "")
	{
		alert("You must give your state!!!")
		
		return false;
	}
    else if(document.myForm.zip.value == "")
    {
    	alert("You must give your zip code!!!")
    	
    	return false;
    }
    else if(document.myForm.city.value == "")
    {
    	alert("You must give your city!!!")
    	
    	return false;
    }
    else if(document.myForm.ssn.value == "")
    {
    	alert("You must give your SSN!!!")
    	
    	return false
   	}
    else if(document.myForm.Password1.value == "")
    {
    	alert("You must give a password!!!")
    	
    	return false;
   	}
	else if(document.myForm.Password2.value == "")
	{
		alert("You must confirm your password!!!!")
		
		return false;
	}
	else if(document.myForm.Password1.value != document.myForm.Password2.value)
	{
    	alert("Your provided passwords do not match!!!!")
		
    	return false;
	}
	else if(document.myForm.phone.value == "")
	{
    	alert("You must provide your phone number!!!!")
		
    	return false;
	}
	else if(document.myForm.email.value == "")
	{
    	alert("You must give an email!!!!")
		
    	return false;
	}
	
	return true;
}

function Button2_onclick() {
    window.open("RegisterPage.htm","_self");

}

// ]]>
</script>

<!-- All the files that are required -->
<link rel="stylesheet" href="css/bootstrap.css" ></link>
<link rel="stylesheet" href="css/reg-theme.css" ></link>

</head>
<body>

<div class="container">
    <h1 class="well" style="text-align:center">Edit Employee</h1>
	<div class="col-lg-12 well">
	<div class="row">
				<form name="myForm" action="SubmitEmployeeEdit.jsp" method="post">
				<input type="hidden" name="target" value="Employee"></input>
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>First Name</label>
								<input hidden name = "employee_id" value = "<%=request.getParameter("employee_id") %>"></input>
								<input name="fName" type="text" value = "<%=request.getParameter("fName")%>" class="form-control">
							</div>
							<div class="col-sm-6 form-group">
								<label>Last Name</label>
								<input name="lName" type="text" value = "<%=request.getParameter("lName")%>" class="form-control">
							</div>
						</div>					
						<div class="form-group">
							<label>Address [Street, City  SI]</label>
							<input name="address" type="text" value = "<%=request.getParameter("address")%>" class="form-control">
						</div>
						<div class="row">
							<div class="col-sm-4 form-group">
								<label>Zip</label>
								<input name="zip" type="text" value = "<%=request.getParameter("zip")%>" class="form-control">
							</div>
							<div class="col-sm-4 form-group">
								<label>Hourly Rate</label>
								<input name="rate" type="text" value = "<%=request.getParameter("rate")%>" class="form-control">
							</div>
							<div class="col-sm-4 form-group">
								<label>Status</label>
								<input name="status" type="text" value = "<%=request.getParameter("status")%>" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label>Phone Number [(xxx)-xxx-xxxx]:</label>
							<input name="phone" type="text" value = "<%=request.getParameter("phone")%>" class="form-control">
						</div>		
						<div class="form-group">
							<label>Email Address [youremail@examplesite.com]:</label>
							<input name="email" type="text" value = "<%=request.getParameter("email")%>" class="form-control">
						</div>	
						<div align="center">
							<button type="button" class="btn btn-lg btn-danger" onclick="window.open('Manager.jsp','_self');">Back</button>			
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="submit" class="btn btn-lg btn-info" onclick="return Button1_onclick()">Submit</button>
							
						</div>
					</div>
				</form> 
				

				</div>
	</div>
	</div>

</body>
</html>