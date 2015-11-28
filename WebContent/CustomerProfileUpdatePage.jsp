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
	<div class="row" style="alignment:center">
		<div class="form-group">
			<input id="UpdateButton" type="button" style="display:inline" value="Update" onclick="window.alert('TODO: implement update functionality.')" />
    		<input id="CancelButton" type="button" style="display:inline" value="Cancel" onclick="window.open('CustomerProfile.jsp','_self')" />
    	</div>	
		<br />
		<div class="form-group">
				<label>Last Name:</label>
				<input name="LastName" type="text" placeholder="Nikonorov" class="form-control">
		</div>	
		<div class="form-group">
				<label>First Name:</label>
				<input name="FirstName" type="text" placeholder="Gleb" class="form-control">
		</div>
		
		<br />
		
		<div class="form-group">
			<label>Address Line 1:</label>
			<label><u>123 Sesame Street</u></label>
			<input name="AddressLine1" type="text" placeholder="123 Sesame Street" class="form-control">
		</div>
		<div class="form-group">
			<label>Address Line 2:</label>
			<input name="AddressLine2" type="text" placeholder="Apartment ABC" class="form-control">
		</div>
		<div class="row">
				<div class="col-sm-4 form-group">
					<label>City:</label>
					<input name="City" type="text" placeholder="Narnia" class="form-control">
				</div>
				<div class="col-sm-4 form-group">
					<label>State:</label>
					<input name="State" type="text" placeholder="AL" class="form-control">
				</div>
				<div class="col-sm-4 form-group">
					<label>Zip:</label>
					<input name="Zip" type="text" placeholder="11111" class="form-control">
				</div>
		</div>
		
		<br />
		
		<div class="row">
			<div class="col-sm-6 form-group">
				<label>Phone #:</label>
				<input name="PhoneNum" type="text" placeholder="212-501-0551" class="form-control">
			</div>
			<div class="col-sm-6 form-group">
				<label>E-mail:</label>
				<input name="Email" type="text" placeholder="myFakeEmail@someDomain.com" class="form-control">
			</div>	
		</div>
				
		<br />
		
		<div class="form-group">
				<label>Credit card #:</label>
				<input name="CreditCardNum" type="text" placeholder="1111-1111-1111-1111" class="form-control">
		</div>	
	</div>
	</div>
</body>
</html>