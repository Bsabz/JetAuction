<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
    <title>Jet Auction - Home</title>

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
		<input id="NewAuctionButton" type="button" style="display:inline" value="Make New Auction" onclick="window.open('NewAuction.htm','_self');" />
    	<input id="LogoutButton" type="button" style="display:inline" value="Logout" onclick="Logout_onclick();" />
    	<input id="HelpButton" type="button" style="display:inline" value="Help" onclick="window.open('HelpMenu.htm','_self')" />
    </nav>
	
	<br />
	
	<div class="row">
		<div class="col-sm-4 form-group">
			<input id="searchAuctions" type="button" style="display:inline" value="Search auctions!" onclick="window.open('SearchResults.jsp','_self');" />
    	</div>
		<div class="col-sm-4 form-group">
			<input name="BrowseAuction" type="text" placeholder="Browse current auctions now!" class="form-control"/>
		</div>
	</div>
						
	<br />
	
	<h2 class="well" style="text-align:center">Welcome to Jet Auction, get started by checking out some ongoing bids or placing 
                    a few of your own.</h2>
	
	<div class="col-lg-12 well">
	<div class="row" style="alignment:center">
		<div class="col-sm-6 form-group">
			<h2>
            	All current actions customer is in would go here
            </h2>
        	<table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
            <tr>
                <td style="vertical-align: top; width: 11237px; text-align: left; height: 454px;">
                    <br />
                    <table border="8" id="TABLE1" onclick="return TABLE1_onclick()">
                    <tr>
                      <td style="width: 84px" align="center">
                          <span style="font-size: 10pt">
                          	Auction Name
                          </span>
                      </td>
                      <td style="width: 187px" align="center">
                          <span style="font-size: 10pt">
                          	Current high bid
                          </span>
                      </td>
                      <td style="width: 74px" align="center">
                            <span style="font-size: 10pt">
                            	Closing bid time
                            </span>
                      </td>
                      <td align="center">
                            <span style="font-size: 10pt">
                            	Thinking of putting "bid now!" button here
                            </span>
                      </td>
                    </tr>   
					</table>
            </tr>
            </table>
		</div>
		<div class="col-sm-6 form-group">
			<h3>Best sellers list</h3>
			<%int numItemsToDisplay = 3;
  			  int numLeftToPrint = numItemsToDisplay;
  			  if(numItemsToDisplay > 0) {%>
			  <ol>
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
				</ol>
			<%}else{
				out.print("<h4 style='text-align:center'>No best sellers yet :(</h4>");
				out.print("<p>Check back soon</p>");
			  }
			%>
			<br />
			<h3>Suggested items list</h3>
			<%numItemsToDisplay = 0;
  			  numLeftToPrint = numItemsToDisplay;
  			  if(numItemsToDisplay > 0) {%>
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
			<%}else{
				out.print("<h4 style='text-align:center'>No suggested items yet :(</h4>");
				out.print("<p>Check back soon</p>");
			  }
			%>
		</div>
	</div>
	</div>
	</div>
</body>
</html>
