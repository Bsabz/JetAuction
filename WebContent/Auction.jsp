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
	</script>

	<!-- All the files that are required -->
	<link rel="stylesheet" href="css/bootstrap.css" ></link>
	<link rel="stylesheet" href="css/reg-theme.css" ></link>
	<link rel="stylesheet" href="css/bootsnip.css" ></link>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"></link>
	<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'></link>
</head>
<body>

<div class="container">
<div class="col-lg-12 well">
<div class="row" style="text-align:center">

	<input id="LogoutButton" type="button" value="Logout" onclick="Logout_onclick();" />
    <input id="HelpButton" type="button" value="Help" onclick="window.open('HelpMenu.htm','_self')" />
    <input id="HomeButton" type="button" value="Go Home" onclick="window.open('CustomerHomePage.jsp', '_self')" />
    <h2>Auction Name: (would go here)</h2>
    <h2>Item name: (Would go here)</h2>
    <h2>Item condition (new/used)</h2>
    <h2>Current bid: $123.12</h2>
    <h3>Time left: (Would go here)</h4>
    <h3>[Seller name] : [Seller information]</h3>
    <br />
	<p>Item description goes here: e/g fancy shit</p>
	<br />
    <input id="PlaceBidButton" type="button" value="Place bid" onclick="window.alert('TODO: IMPLEMENT FEATURE')" />
</div>
</div>
</div>

</body>
</html>