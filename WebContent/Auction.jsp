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
		
		function Verify_BidAmt()
		{
			var isValid = true;
			var bidAmt = document.getElementById("PlaceBidField").value;
			
			if(bidAmt == "")
				isValid = false;
			
			if( isNaN(+bidAmt) )
				isValid = false;
			
			//check if there are more than 2 nums after .
			var bidAmtArr = bidAmt.split(".");
			alert(bidAmtArr.length + "")
			if(bidAmtArr.len > 2)
				isValid = false;
			else if(bidAmtArr.length == 2)
			{
				if(bidAmtArr[1].length != 2)
					isValid = false;
			}
			
			//check if it is a number
			//credit card is properly formatted
			for(var i = 0; i < bidAmt.length; i++)
			{
				//if not a number return false
				if( isNaN(bidAmt[i]) && bidAmt[i] != '.')
					isValid = false;
			}
			
			if(!isValid)
				alert("Invalid bid amount, please re enter");
			else
				bidForm.submit()
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
    <%int auctionId = Integer.parseInt(request.getParameter("auctionId"));%>
    <%String user = request.getParameter("username");%>
    <%System.out.println("Username is  " + user); %>
    <%boolean isOwner =false;%>

<%
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

	//get auction info
	java.sql.Statement stmt = conn.createStatement();
	String sql = "SELECT A.item_id FROM Auction A WHERE A.auction_id = " + auctionId +";";
	java.sql.ResultSet rs = stmt.executeQuery(sql);
	
	int item_id = -1;
	if (rs.next() )
		item_id = rs.getInt(1);

	stmt = conn.createStatement();
	
	if(item_id == -1)
	{
%>
		<h2>Oops</h2>
		<p>Something went wrong. Please <a href="index.htm?username=<%=user%>"><font color="Blue"> go home.</p>
<%	}
	else{
	sql = "SELECT I.ItemName, I.ItemType, I.YearOfModel, I.Description FROM Item I WHERE I.item_id = " + item_id + ";";
	rs = stmt.executeQuery(sql);
		while(rs.next()) {
%>

    <h2>Auction Name: Auction #<%=auctionId%>!!!</h2>
    <h2>Item name: <%=rs.getString(1)%></h2>
    <h2>Item type: <%=rs.getString(2)%></h2>
    <h2>Item year: <%=rs.getString(3)%></h2>
    <h2>Current bid: $123.12</h2>
    <h3>Time left: (Would go here)</h4>
    <h3>[Seller name] : [Seller information]</h3>
    <br />
    <p>Item Description:</p>
	<p><%=rs.getString(4)%></p>
	<br />
	<%if(!isOwner){%>
		<form name ="bidForm" id="bid-form" action="bid.jsp" class="text-left">
			<input hidden value="<%=user%>" name="bidderName"/>
			<input hidden value="<%=auctionId%>" name="auctionId"/>
			<input hidden value="<%=item_id%>" name="itemId"/>
			<div class="form-group">
				<input id="PlaceBidField" name="bidAmount" type="text" style="display:inline" placeholder="We should show the current min bid as suggestion" class="form-control"/>
			</div>
			<div class="form-group">
				<input id="PlaceBidButton" type="button" value="Place bid" style="display:inline" onclick="Verify_BidAmt()"/>
			</div>
		</form>	
	<%}}}%>
</div>
</div>
</div>

</body>
</html>