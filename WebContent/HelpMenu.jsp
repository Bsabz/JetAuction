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
</div>
</div>		
</body>
</html>