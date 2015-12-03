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

<%
	/*
	FIELDS FOR FORMS
	*/
	String user = request.getParameter("username");

	String mysJDBCDriver = "com.mysql.jdbc.Driver"; 	
	String mysURL = "jdbc:mysql://127.0.0.1:3306/jetauction_db"; 
	String mysUserID = "root"; 
	String mysPassword = "password";

	java.sql.Connection conn=null;
	
	Class.forName(mysJDBCDriver).newInstance();
	java.util.Properties sysprops=System.getProperties();
	sysprops.put("user",mysUserID);
	sysprops.put("password",mysPassword);

	//connect to the database
	conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
	System.out.println("Connected successfully to database using JConnect");

	String username = request.getParameter("username");
	System.out.println("user name is " + username);
	
	
	java.sql.Statement preparedStatement = conn.createStatement();
	java.sql.ResultSet rs = preparedStatement.executeQuery("SELECT P.LastName, P.FirstName, P.Address, P.ZipCode, P.Telephone, P.Email, C.CreditCardNum, C.Rating "
			+ "FROM Person as P, Customer as C "
			+ "WHERE P.SSN = C.SSN "
			+ "AND C.customer_id = " + "'" + username + "'" + ";");
	
	//get all the values
	String lastName = "", firstName = "", address = "", state = "", city = "", zip = "", phone = "", email = "", credit = "";
	while(rs.next())
	{
		lastName = rs.getString(1);
		firstName = rs.getString(2);
		address = rs.getString(3);
		zip = rs.getString(4);
		phone = rs.getString(5);
		email = rs.getString(6);
		credit = rs.getString(7);
	}
	
	System.out.println("Address is: " + address);
	
	//original address
	//Address: 151-48 11th Avenue Whitestone, NY
	//state = address.split(", ")[1];
	
	//151-48 11th Avenue Whitestone
	//address = address.split(", ")[0];
	//String[] splitTokens = address.split(" ");
	
	/*String outputAddress = "";
	for(int i =0; i < splitTokens.length; i++)
	{
		if(i != splitTokens.length - 1)
		{
			outputAddress += splitTokens[i];
		}
		else
			city = splitTokens[i];
	
		if( i < splitTokens.length - 2)
			outputAddress += " ";
	}
	System.out.println(outputAddress);*/
%>

<div class="container">
	<nav>
		<input id="LogoutButton" type="button" style="display:inline" value="Logout" onclick="Logout_onclick();" />
    	<input id="HelpButton" type="button" style="display:inline" value="Help" onclick="window.open('HelpMenu.jsp?username=<%=user %>','_self')" />
    	<input id="GoHomeButton" type="button" style="display:inline" value="Go Home" onclick="window.open('CustomerHomePage.jsp?username=<%=user %>','_self')" />
    </nav>
	
	<br />
	
	<h2 class="well" style="text-align:center">Welcome to your Profile!</h2>

	<div class="col-lg-12 well">
	<form name ="updateInfoForm" id="update-form" action="Update.jsp">
	<div class="row" style="alignment:center">
		<input hidden value=<%=username%> name="UserName"></input>
		<div class="form-group">
			<input id="UpdateButton" name="Updatebutton" type="submit" style="display:inline" value="Update" onclick="Update_onClick()" />
    		<input id="CancelButton" name="Cancelbutton" type="button" style="display:inline" value="Cancel" onclick="window.open('CustomerProfile.jsp?username=<%=username%>','_self')" />
    	</div>	
		<br />
		</div>	
		<div class="form-group">
				<label>Last Name:</label>
				<input id="last_name" name="LastName" type="text" value="<%=lastName%>" class="form-control">
		</div>	
		<div class="form-group">
				<label>First Name:</label>
				<input id="first_name" name="FirstName" type="text" value="<%=firstName%>" class="form-control">
		</div>
		
		<br />
		
		<div class="form-group">
			<label>Address Line 1:</label>
			<input id="address_line_1" name="AddressLine1" type="text" value="<%=address%>" class="form-control">
		</div>
		<div class="row">
				<div class="col-sm-4 form-group">
					<label>Zip:</label>
					<input id="zip" name="Zip" type="text" value="<%=zip%>" class="form-control">
				</div>
		</div>
		
		<br />
		
		<div class="row">
			<div class="col-sm-6 form-group">
				<label>Phone #:</label>
				<input id="phone" name="PhoneNum" type="text" value="<%=phone%>" class="form-control">
			</div>
			<div class="col-sm-6 form-group">
				<label>E-mail:</label>
				<input id="email" name="Email" type="text" value="<%=email%>" class="form-control">
			</div>	
		</div>
				
		<br />
		
		<div class="form-group">
				<label>Credit card #:</label>
				<input id="credit" name="CreditCardNum" type="text" value="<%=credit%>" class="form-control">
		</div>	
	</div>
	</form>
	</div>
</body>
</html>