<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
    <title>JetAuction - Update Your Customer Profile</title>

	<script language="javascript" type="text/javascript">
	function Logout_onclick() 
	{
		var quitting = window.confirm("Do you really wish to logout?")
	
		if(quitting == true)
			window.open('index.htm','_self');
	}
	
	function Update_onClick()
	{
		checkIfFieldsNull();  
		
		var wasFilledInProperly = true;
		//cehck for valid SSN
		
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

		if(wasFilledInProperly && !checkIfCreditCardValid() )
		{
			alert("Bad credit card number given");
		
			wasFilledInProperly = false;
		}
	
		if(wasFilledInProperly)
			updateInfoForm.submit();
	}

	//check to see if email was valid (xxxx@xxxx.xxx)
	function checkIfEmailValid()
	{
		var emailString = document.getElementById("email").value;
		var splitEmail;
	
		if( (splitEmail = emailString.split("@")).length != 2 )
			return false;
		if(splitEmail[1].split(".").length != 2)
			return false;
	
		return true;
	}

	//check to see if the user provided a valid credit card
	//format of xxxx-xxxx-xxxx-xxxx
	function checkIfCreditCardValid()
	{
		var creditNumArr = document.getElementById("credit").value.split("-");
	
		if(creditNumArr.length != 4)
			return false;
		
		if(creditNumArr[0].length != 4|| creditNumArr[1].length != 4 || creditNumArr[2].length != 4 || creditNumArr[2].length != 4)
			return false;
	
		//credit card is properly formatted
		for(var i = 0; i < creditNumArr.length; i++)
		{
			for(var u = 0; u < creditNumArr[i].length; u++)
			{
				//if not a number return false
				if( isNaN(creditNumArr[i][u]) )
					return false;
			}
		}
	
		return true;
	}

	//check to see if user provided a valid telephone num
	//format of (xxx)-xxx-xxxx
	function checkIfTelephoneValid()
	{
		var phoneNumArr = document.getElementById("phone").value.split("-");
	
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
		var zipCode = document.getElementById("zip").value;
		
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

	//Check to see if all fields have been filled in, return true if yes, else false
	function checkIfFieldsNull()
	{	
		if(document.getElementById("first_name").value == "")
			document.getElementById("first_name").value = document.getElementById("first_name").placeholder
		if(document.getElementById("last_name").value == "")
			document.getElementById("last_name").value = document.getElementById("last_name").placeholder
		
		if(document.getElementById("address_line_1").value == "")
			document.getElementById("address_line_1").value = document.getElementById("address_line_1").placeholder
		if(document.getElementById("city").value == "")
				document.getElementById("city").value = document.getElementById("city").placeholder
		if(document.getElementById("state").value == "")
			document.getElementById("state").value = document.getElementById("state").placeholder
		if(document.getElementById("zip").value == "")
			document.getElementById("zip").value = document.getElementById("zip").placeholder
							
		if(document.getElementById("phone").value == "")
			document.getElementById("phone").value = document.getElementById("phone").placeholder
		if(document.getElementById("email").value == "")
			document.getElementById("email").value = document.getElementById("email").placeholder
		if(document.getElementById("credit").value == "")
			document.getElementById("credit").value = document.getElementById("credit").placeholder
	}
	</script>

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

	<!-- All the files that are required -->
	
	<link rel="stylesheet" href="css/bootstrap.css" ></link>
	<link rel="stylesheet" href="css/bootsnip.css" ></link>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"></link>
	<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'></link>
</head>

<body style="text-align: center">
<div class="container">
	<nav>
		<input id="LogoutButton" type="button" style="display:inline" value="Logout" onclick="Logout_onclick();" />
    	<input id="HelpButton" type="button" style="display:inline" value="Help" onclick="window.open('HelpMenu.htm','_self')" />
    	<input id="GoHomeButton" type="button" style="display:inline" value="Go Home" onclick="window.open('CustomerHomePage.jsp','_self')" />
    </nav>
	
	<br />
	
	<h2 class="well" style="text-align:center">Welcome to your Profile! - Note, is not actually reading data, just looks complete to see if pretty</h2>
	
	<div class="col-lg-12 well">
	<form name ="updateInfoForm" id="update-form" action="Update.jsp">
	<div class="row" style="alignment:center">
		<div class="form-group">
			<input id="UpdateButton" name="Updatebutton" type="button" style="display:inline" value="Update" onclick="Update_onClick()" />
    		<input id="CancelButton" name="Cancelbutton" type="button" style="display:inline" value="Cancel" onclick="window.open('CustomerProfile.jsp','_self')" />
    	</div>	
		<br />
		<div class="form-group">
				<label>Last Name:</label>
				<input id="last_name" name="LastName" type="text" placeholder="Nikonorov" class="form-control">
		</div>	
		<div class="form-group">
				<label>First Name:</label>
				<input id="first_name" name="FirstName" type="text" placeholder="Gleb" class="form-control">
		</div>
		
		<br />
		
		<div class="form-group">
			<label>Address Line 1:</label>
			<input id="address_line_1" name="AddressLine1" type="text" placeholder="123 Sesame Street" class="form-control">
		</div>
		<div class="form-group">
			<label>Address Line 2:</label>
			<input id="address_line_2" name="AddressLine2" type="text" placeholder="Apartment ABC" class="form-control">
		</div>
		<div class="row">
				<div class="col-sm-4 form-group">
					<label>City:</label>
					<input id="city" name="City" type="text" placeholder="Narnia" class="form-control">
				</div>
				<div class="col-sm-4 form-group">
					<label>State:</label>
					<input id="state" name="State" type="text" placeholder="AL" class="form-control">
				</div>
				<div class="col-sm-4 form-group">
					<label>Zip:</label>
					<input id="zip" name="Zip" type="text" placeholder="11111" class="form-control">
				</div>
		</div>
		
		<br />
		
		<div class="row">
			<div class="col-sm-6 form-group">
				<label>Phone #:</label>
				<input id="phone" name="PhoneNum" type="text" placeholder="(212)-501-0551" class="form-control">
			</div>
			<div class="col-sm-6 form-group">
				<label>E-mail:</label>
				<input id="email" name="Email" type="text" placeholder="myFakeEmail@someDomain.com" class="form-control">
			</div>	
		</div>
				
		<br />
		
		<div class="form-group">
				<label>Credit card #:</label>
				<input id="credit" name="CreditCardNum" type="text" placeholder="1111-1111-1111-1111" class="form-control">
		</div>	
	</div>
	</form>
	</div>
</body>
</html>