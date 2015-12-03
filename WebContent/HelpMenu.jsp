<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
	</script>

	<!-- All the files that are required -->
	<link rel="stylesheet" href="css/bootstrap.css" ></link>
	<link rel="stylesheet" href="css/reg-theme.css" ></link>
	<link rel="stylesheet" href="css/bootsnip.css" ></link>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"></link>
	<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'></link>
</head>
<body style="text-align: center">
<div class="container">
<div class="login-form-1">
<%String user = request.getParameter("username");%>
	<input id="LogoutButton" type="button" value="Logout" onclick="Logout_onclick();" />
    <input id="HomeButton" type="button" value="Go Home" onclick="window.open('CustomerHomePage.jsp?username=<%=user%>', '_self')" />
    
    <br />
    <br />
    
	<p>
		Welcome to Jet Auctions help menu! Here you can get help on all things JetAuciton. Select a topic from our drop
		down list to continue.
	</p>
			<div class="dropdown">
				<button class="btn btn-default dropdown-toggle" type="button"
					id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="true">
					Topic <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
					<li><a href="#">Buying</a></li>
					<li><a href="#">Selling</a></li>
					<li><a href="#">Managing Account</a></li>
					<li role="separator" class="divider"></li>
					<li><a href="#">Separated link</a></li>
				</ul>
			</div>
		</div>
		<div align = "left">
			<h1><strong>Buying</strong></h1>
			<div style="padding-left: 50px">
			<h3>How Bidding Works </h3>
			<table class="table table-striped">
				<tr><td>Current price</td><td>Bid increment</td></tr>
				<tr><td>$ 0.01 - $ 0.99</td><td>$ 0.05</td></tr>
				<tr><td>$ 1.00 - $ 4.99</td><td>$ 0.25</td></tr>
				<tr><td>$ 5.00 - $ 24.99</td><td>$ 0.50</td></tr>
				<tr><td>$ 25.00 - $ 99.99</td><td>$ 1.00</td></tr>
				<tr><td>$ 100.00 - $ 249.99</td><td>$ 2.50</td></tr>
				<tr><td>$ 250.00 - $ 499.99</td><td>$ 5.00</td></tr>
				<tr><td>$ 500.00 - $ 999.99</td><td>$ 10.00</td></tr>
				<tr><td>$ 1000.00 - $ 2499.99</td><td>$ 25.00</td></tr>
				<tr><td>$ 2500.00 - $ 4999.99</td><td>$ 50.00</td></tr>
				<tr><td>$ 5000.00 and up</td><td>$ 100.00</td></tr>
			</table>
			The bid increment is determined by the current bid price. To participate in an auction place a bid greater or equal to this value.
			<br/><br/>
			<h3>Placing Bids</h3>
				Place a bid by entering an amount greater than or equal to the current bid plus the bid increment. 
			</div>

			<h1><strong>Selling</strong></h1>
			<div style="padding-left: 50px">
			<h3>Post an Auction</h3>
				Go to "View My Profile" and click on "Update Profile" enter the appropriate changes and submit.
			<h3>Reserve Price </h3>
				The user can determine the minimum value they want their item to sell for. If the bids do not exceed this value then the no one wins the auction.
			</div>
			<h1><strong>Manage Account</strong></h1>
			<div style="padding-left: 50px">
			<h3>Update Info</h3>
				Go to "View My Profile" and click on "Update Profile" enter the appropriate changes and submit.
			</div>
		</div>

	</div>		
</body>
</html>