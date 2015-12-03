<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Search Results</title> 
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

	<script language="javascript" type="text/javascript">
		function Logout_onclick() 
		{
			var quitting = window.confirm("Do you really wish to logout?")
	
			if(quitting == true)
				window.open('index.htm','_self');
		}
		
		function SearchAuctions()
		{
			var searchQuery = document.getElementById("searchPane").value;
			
			if(searchQuery != "")
				window.open('SearchResults.jsp','_self');
		}
	</script>

	<!-- All the files that are required -->
	<link rel="stylesheet" href="css/bootstrap.css" ></link>
	<link rel="stylesheet" href="css/bootsnip.css" ></link>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"></link>
	<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'></link>
</head>

<body style="text-align: center">
<div class="container">
	<nav>
		<input id="NewAuctionButton" type="button" style="display:inline" value="Make New Auction" onclick="window.open('NewAuction.htm','_self');" />
    	<input id="LogoutButton" type="button" style="display:inline" value="Logout" onclick="Logout_onclick();" />
    	<input id="HelpButton" type="button" style="display:inline" value="Help" onclick="window.open('HelpMenu.htm','_self')" />
    	<input id="GoHomeButton" type="button" style="display:inline" value="Go Home" onclick="window.open('CustomerHomePage.jsp','_self')" />
    </nav>
	
	<br />
	<br />
	
	<div class="row">
		<div class="col-sm-4 form-group">
			<input id="searchAuctions" type="button" style="display:inline" value="Search auctions!" onclick="SearchAuctions()" />
    	</div>
		<div class="col-sm-4 form-group">
			<input id="searchPane" name="BrowseAuction" type="text" placeholder="Browse current auctions now!" class="form-control"/>
		</div>
	</div>
	
	<h2 class="well" style="text-align:center">Search Results</h2>
	
<%int numItemsToDisplay = 3;
  int numLeftToPrint = numItemsToDisplay;
  if(numItemsToDisplay > 0) {%>
	<ol>
	<%}%>
	<%while(numLeftToPrint > 0){%>
		<li>
			<h4>Item Name</h3>
			<h2>Item Price</h2>
			<h2>Item Expiration Date</h2>
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
	</ol>
<%}else{
	out.print("<h2 class='well' style='text-align:center'>No Items :(</h2>");
	out.print("<p class='well'>Try searching again, or <a href='CustomerHomePage.jsp'><font color='Blue'>go back to the home page</font></a></p>");
}
%>
</div>
</body>