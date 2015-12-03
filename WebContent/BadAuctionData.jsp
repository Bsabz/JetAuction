<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Error creating auction</title> 
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

	<!-- All the files that are required -->
	<link rel="stylesheet" href="css/bootsnip.css" ></link>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"></link>
	<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'></link>
</head>

<div class="text-center" style="padding:50px 0" align="center">
	<%String user = request.getParameter("username");%>
	<%System.out.println(user);%>
	<h2>Oops :(</h2>
	<h2>There was an error creating your auction!.</h2>
	<input id="CancelButton" type="button" value="Cancel" onclick="window.open('NewAuction.jsp?username=<%=user%>','_self');" /><br />        
</div>	