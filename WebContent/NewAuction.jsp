<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>New Auction -- Jet Auction</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

	<script language="javascript" type="text/javascript">
		function Logout_onclick() 
		{
			var quitting = window.confirm("Do you really wish to logout?")
	
			if(quitting == true)
				window.open('index.htm','_self');
		}
		
		function SubmitButton_onclick()
		{
		/*	var isValid = verifyNotNull();
			
			if(isValid && !verifyMinBid())
			{
				alert("Invalid minimum bid given.")
				
				isValid = false;
			}
			
			if(isValid && !verifyReservePrice() )
			{
				alert("Invalid reserve price given");
				
				isValid = false;
			}
			
			if(isValid)
			{*/
				//alert("submitting");
				document.createAuctionForm.submit();
						
			//}
			//else
				//alert("not valud");
		}
		
		//can be in form $float or float
		function verifyMinBid()
		{
			var minBid = document.createAuctionForm.min_bid.value;
			
			if(minBid[0] == '$')
				minBid = minBid.substring(1 , minBid.length);
				
			for(var i = 0; i < minBid.length; i++)
			{
				if( isNaN(minBid[i]) )	//reserve price was nota number
					return false;
			}
			
			document.createAuctionForm.min_bid.value = minBid;
			
			return true;
		}
		
		function verifyReservePrice()
		{
			var reservePrice = document.createAuctionForm.reserve_price.value;
			
			if(reservePrice[0] == '$')
				reservePrice = reservePrice.substring(1 , reservePrice.length);
			
			if(reservePrice[0] == '%')
				return false;			//still parses it as percent
			
			for(var i = 0; i < reservePrice.length; i++)
			{
				if( isNaN(reservePrice[i]) )	//reserve price was nota number
					return false;
			}
			document.createAuctionForm.reserve_price.value = reservePrice;
			
			return true;
		}
		
		function verifyNotNull()
		{
			if(document.createAuctionForm.auction_name.value == "")
			{
				alert("You must give an auction name!!!")
				
				return false;
			}
			else if(document.createAuctionForm.auction_item.value == "")
			{
				alert("You must give an auction item!!!")
				
				return false;
			}
			else if(document.createAuctionForm.close_date_time.value == "")
			{
				alert("You must give a closing date/time!!!")
				
				return false;
			}
			else if(document.createAuctionForm.min_bid.value == "")
			{
				alert("You must give a minimum bid!!!")
				
				return false;
			}
			else if(document.createAuctionForm.reserve_price.value == "")
			{
				alert("You must give a reserve price!!!")
				
				return false;
			}
			
			return true;	
		}
		
	</script>

	<!-- All the files that are required -->
	<link rel="stylesheet" href="css/bootstrap.css" ></link>
	<link rel="stylesheet" href="css/reg-theme.css" ></link>
	<link rel="stylesheet" href="css/bootsnip.css" ></link>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"></link>
	<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'></link>
</head>
<body style="text-align:center">
<h1 class="well" style="text-align:center"> Create your new auction here</h1>
<div class="col-lg-12 well">
<div class="row">
	<%String user = request.getParameter("username");%>
	
	<nav>
		<input id="LogoutButton" type="button" value="Logout" style="display:inline" onclick="Logout_onclick();" />
    	<input id="HelpButton" type="button" value="Help" style="display:inline" onclick="window.open('HelpMenu.jsp?username=<%=user %>','_self')" />
    	<input id="HomeButton" type="button" value="Go Home" style="display:inline" onclick="window.open('CustomerHomePage.jsp?username=<%=user %>', '_self')" />
    </nav>
	
    </br>
	<form name = "createAuctionForm" action="CreateAuction.jsp" method="post">
	<input type="hidden" name="target" value="<%=user%>"></input>
	<div class="col-sm-12">
		<h2 style="text-align:center">Fill in the following information so we can make your new auction:</h2>
			<div class="form-group">
        		<label>Auction Name:</label>
			   	<input name="auction_name" type="text" placeholder="Enter auction name here" class="form-control"/>
            </div>
            <div class="form-group">
				<label>Auction Item:</label>
               	<input name="auction_item" type="text" placeholder="Enter auction item name here" class="form-control"/>
            </div>
            <div class="form-group">
				<label>Auction Item Description:</label>
               	<input name="auction_item_description" type="text" placeholder="Enter auction item description name here" class="form-control"/>
            </div>
            <div class="form-group">
				<h3><strong>Select Item Type:</strong></h3>
                	<select id="new_item_type" name = "newItemType">
                	  <option selected disabled>Select One</option>
					  <option value="DVD">DVD</option>
					  <option value="CAR">CAR</option>
					  <option value="BOOK">BOOK</option>
					  <option value="LAPTOP">LAPTOP</option>
					</select>
			</div>
			<div class="form-group">
				<label>Item Year:</label>
               	<input name="auction_item_year" type="text" placeholder="Enter year manufactured" class="form-control"/>
            </div>
            <div class="form-group">
				<label>Closing date/time (yyyy-MM-dd HH:mm:ss)</label>
               	<input name="close_date_time" type="text" placeholder="Closing date/time" class="form-control"/>
            </div>
            <div class="form-group">
				<label>Minimum bid</label>
            	<input name="min_bid" type="text" placeholder="g/g $1" class="form-control"/>
            </div>
            <div class="form-group">
				<label>Starting bid</label>
            	<input name="open_bid" type="text" placeholder="Enter starting bid:" class="form-control"/>
            </div>
            <div class="form-group">
				<label>Reserve price</label>
               	<input name="reserve_price" type="text" placeholder="e/g $10" class="form-control"/>
            </div>
        <input id="SubmitButton" type="button" value="Submit" onclick="return SubmitButton_onclick();" />
        <input id="CancelButton" type="button" value="Cancel" onclick="window.open('CustomerHomePage.jsp','_self');" /><br />
        </div>
		</form>
</div>
</div>
</body>
</html>