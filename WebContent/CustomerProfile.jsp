<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
    <title>JetAuction - Customer Profile</title>

	<script language="javascript" type="text/javascript">
	function Logout_onclick() 
	{
		var quitting = window.confirm("Do you really wish to logout?")
	
		if(quitting == true)
			window.open('index.htm','_self');
	}
	
	function updateRating()
	{
		alert('TODO:Add in update rating functionality, parsing works');
		
		var newRating = document.getElementById("AddRatingField").value
		
		var canUpdate = true;
		for(var i = 0; i < newRating.length; i++)
		{
			if( isNaN(newRating[i]) )	//reserve price was nota number
			{
				canUpdate = false;
				break;		
			}
		}
		
		if(!canUpdate)
			alert("Bad rating parameters given, try again");
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
	<!-- Laeve in for testing purposes. -->
	<%boolean isOwner = false; %>
	<nav>
		<input id="LogoutButton" type="button" style="display:inline" value="Logout" onclick="Logout_onclick();" />
    	<input id="HelpButton" type="button" style="display:inline" value="Help" onclick="window.open('HelpMenu.htm','_self')" />
    	<input id="GoHomeButton" type="button" style="display:inline" value="Go Home" onclick="window.open('CustomerHomePage.jsp','_self')" />
    </nav>
	
	<br />
	
	<h2 class="well" style="text-align:center">Welcome to your Profile! - Note, is not actually reading data, just looks complete to see if pretty</h2>
	
	<div class="col-lg-12 well">
	<div class="row" style="alignment:center">
		<%if(isOwner){ %>
			<div class="form-group">
				<input id="EditProfileButton" type="button" style="display:inline" value="Update Profile" onclick="window.open('CustomerProfileUpdatePage.jsp','_self');" />
    		</div>	
			<br />
		<%}%>
		<div class="form-group">
				<label>Last Name:</label>
				<label><u>Nikonorov</u></label>
		</div>	
		<div class="form-group">
				<label>First Name:</label>
				<label><u>Gleb</u></label>
		</div>
		
		<br />
		
		<div class="form-group">
			<label>Address Line 1:</label>
			<label><u>123 Sesame Street.</u></label>
		</div>
		<div class="form-group">
			<label>Address Line 2:</label>
			<label><u>Apartment ABC</u></label>
		</div>
		<div class="row">
				<div class="col-sm-4 form-group">
					<label>City:</label>
					<label><u>Narnia</u></label>
				</div>
				<div class="col-sm-4 form-group">
					<label>State:</label>
					<label><u>AL</u></label>
				</div>
				<div class="col-sm-4 form-group">
					<label>Zip:</label>
					<label><u>11111</u></label>
				</div>
		</div>
		
		<br />
		
		<div class="row">
			<div class="col-sm-6 form-group">
				<label>Phone #:</label>
				<label><u>212-501-0551</u></label>
			</div>
			<div class="col-sm-6 form-group">
				<label>E-mail:</label>
				<label><u>myFakeEmail@someDomain.com</u></label>
			</div>	
		</div>
				
		<br />
		
		<div class="form-group">
				<label>Credit card #:</label>
				<label><u>1111-1111-1111-1111</u></label>
		</div>	
		
		<br />
		
		<div class="form-group">
				<label>Rating:</label>
				<label><u>5</u></label>
				
				<br />
				<%if(!isOwner){%>
					<input id="AddRatingField" type="text" style="display:inline" placeholder="Rate me" />
    				<input id="RateButton" type="button" style="display:inline" value="Submit rating" onclick="updateRating();" />
    			<%}%>
    	</div>	
	</div>
	</div>
	
	<div class="col-lg-12 well">
	<div class="row" style="alignment:center">
	
		<div class="col-sm-6 form-group">
		    <%int numItemsToDisplay = 0;
  			  int numLeftToPrint = numItemsToDisplay;
  			  if(numItemsToDisplay > 0) {%>
  			  	<h3>Items Sold</h3>
        
			<table border="8" id="TABLE1" onclick="return TABLE1_onclick()">
            <tr>
            	<td style="width: 84px" align="center">
            		<span style="font-size: 10pt">Auction Name</span>
            	</td>
            	<td style="width: 187px" align="center">
            		<span style="font-size: 10pt">Current high bid</span>
            	</td>
            	<td style="width: 74px" align="center">
            		<span style="font-size: 10pt">Closing bid time</span>
            	</td>
            	<td align="center">
            		<span style="font-size: 10pt">Thinking of putting "bid now!" button here</span>
            	</td>
            </tr>   
			</table>
			<%}else{%>
				<h4 style='text-align:center'>You haven't sold anything you bitch. How are we supposed to make money if you just sit on you ass. The Internet isn't free you hick :(</h4>
				<p>Get started by posting an auction now!</p>
				
				<br />
				<br />
				
				<div class="row">
						<input id="makeNewAuction" type="button" style="display:inline" value="Make new auction!" onclick="window.open('NewAuction.htm','_self');" />
		    	</div>
			<%}%>
		</div>
		<div class="col-sm-6 form-group">
			<%numItemsToDisplay = 5;
  			  numLeftToPrint = numItemsToDisplay;
  			  if(numItemsToDisplay > 0) {%>
  			  <h3>Items Bought</h3>
			  <ul style="list-style: none;">
			<%}%>
			<%while(numLeftToPrint > 0){%>
			  	<li>
					<h4>Item Name</h4>
					<p>Item Price</p>
					<p>Item Expiration Date</p>
					<input id="GoToItemButton" type="button" style="display:inline" value="Check Out Item" onclick="window.open('Auction.jsp','_self');" />
					<input id="BidNowButton" type="button" style="display:inline" value="Bid now!" onclick="alert('Bid now feature not implemented yet.');" />
    		  	</li>
    		<%	
    		  	if(numLeftToPrint > 1)
    				out.print("<br />");
    		  	numLeftToPrint--;
      		  }
     		%>
			<%if(numItemsToDisplay > 0) {%>
				</ul>
			<%}else{%>
				<h4 style='text-align:center'>You haven't bought anything you bitch. How are we supposed to make money if you just sit on you ass. The Internet isn't free you hick :(</h4>
				<p>Get started by posting an auction now!</p>
				
				<br />
				<br />
				
				<div class="row">
					<div class="col-sm-6 form-group">
						<input id="searchAuctions" type="button" style="display:inline" value="Search auctions!" onclick="window.open('SearchResults.jsp','_self');" />
		    		</div>
					<div class="col-sm-6 form-group">
						<input name="BrowseAuction" type="text" placeholder="Browse current auctions now!" class="form-control"/>
					</div>
				</div>
			<%}%>
		</div>
	
	</div>
	</div>
	
</body>
</html>