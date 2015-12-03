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
	
	function CurrentAuctionsSearchAuctions()
	{
		var searchQuery = document.getElementById("currentAucitonsSearchPane").value;
		
		if(searchQuery != "")
			window.open('SearchResults.jsp','_self');
	}
	
	function SearchAuctions()
	{
		var searchQuery = document.getElementById("mainAuctionSearchPane").value;
		
		if(searchQuery != "")
			window.open('SearchResults.jsp','_self');
	}
	
	function SearchUsers()
	{
		var searchQuery = document.getElementById("usersSearchPane").value;
		
		if(searchQuery != "")
			javascript:userSearch-form.submit();
	}
	
	function SearchItems()
	{
		var searchQuery = document.getElementById("itemSearchPane").value;
		
		if(searchQuery != "")
			javascript:itemSearch-form.submit();
	}
	
	function redirectToAuction()
	{
		alert("TODO: actually get auction info for now it just recircts");
		
		window.open('Auction.jsp','_self');
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

<%String user = request.getParameter("username");%>

<div class="container">
	<nav>
		<input id="NewAuctionButton" type="button" style="display:inline" value="Make New Auction" onclick="window.open('NewAuction.jsp?username=<%=user%>','_self');" />
    	<input id="LogoutButton" type="button" style="display:inline" value="Logout" onclick="Logout_onclick();" />
    	<input id="HelpButton" type="button" style="display:inline" value="Help" onclick="window.open('HelpMenu.jsp?username=<%=user%>','_self')" />
    	<input id="ViewProfileButton" type="button" style="display:inline" value="View My Profile" onclick="window.open('CustomerProfile.jsp?username=<%=user%>','_self'),'_self'" />
    </nav>
	
	<br />
	
	<div class="row">
		<div class="col-sm-4 form-group">
			<input id="searchAuctions" type="button" style="display:inline" value="Search!" onclick="SearchAuctions()" />
    	</div>
		<div class="col-sm-4 form-group">
			<input id="mainAuctionSearchPane" name="auctionSearchName" type="text" placeholder="Browse current auctions now!" class="form-control"/>
		</div>
	</div>
	
	<br />
	
	<h2 class="well" style="text-align:center">Welcome to Jet Auction, get started by checking out some ongoing bids or placing 
                    a few of your own.</h2>
	
	<div class="col-lg-12 well">
	<div class="row" style="alignment:center">
		<div class="col-sm-6 form-group">
		
			<h2>Search Auctions by User</h2>
		<form name ="userSearchForm" id="userSearch-form" action="userSearchResults.jsp">
			<div class="row">
			<div class="form-group">
			<input type="hidden" name="username" value="<%=user%>"></input>
				<input id="usersSearchPane" name="usersSearchName" type="text" placeholder="Browse current users now!" class="form-control"/>
			</div>
			<div class="form-group">
				<input id="searchUsers" type="submit" style="display:inline" value="Search!" onclick="SearchUsers()" />
	    	</div>
			</div>
		</form>
		
		
			<h2>Search Auctions by Item Type</h2>
		<form name ="itemSearchForm" id="itemSearch-form" action="itemSearchResults.jsp">
			<div class="row">
			<div class="form-group">
			<input type="hidden" name="username" value="<%=user%>"></input>
				<h3><strong>Select Item Type:</strong></h3>
                	<select id="itemSearchPane" name = "item">
                	  <option selected disabled>Select One</option>
					  <option value="DVD">DVD</option>
					  <option value="CAR">CAR</option>
					  <option value="BOOK">BOOK</option>
					  <option value="LAPTOP">LAPTOP</option>
					</select>
			</div>
			<div class="form-group">
				<input id="searchItems" type="submit" style="display:inline" value="Search!" onclick="SearchItems()" />
	    	</div>
			</div>
		</form>
		
		
		    
  			  	<h2>Current Auctions</h2>
        	  	
                    <table class="table table-striped table-hover" id="TABLE1">
                    <thead>
                    <tr>
                      	<th>
                            <span style="font-size: 12pt">Auction</span></th>
                      	<th>
                            <span style="font-size: 12pt">Bid Increment</span></th>
                        <th>
                            <span style="font-size: 12pt">OpenBid amount</span></th>
                        <th>
                            <span style="font-size: 12pt">Description</span></th>   
                        <th>
                            <span style="font-size: 12pt">Item Type</span></th>     
                        <th>
                            <span style="font-size: 12pt">Bid History</span></th>
                    </tr>   
                    </thead>
<%
			String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
			String mysURL = "jdbc:mysql://127.0.0.1:3306/jetauction_db"; 
			String mysUserID = "root"; 
			String mysPassword = "password";
  			java.sql.Connection conn=null;
			try 
			{
            	Class.forName(mysJDBCDriver).newInstance();
    			java.util.Properties sysprops=System.getProperties();
    			sysprops.put("user",mysUserID);
    			sysprops.put("password",mysPassword);
        
				//connect to the database
            			conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
            			System.out.println("Connected successfully to database using JConnect");
            
            			java.sql.Statement stmt1=conn.createStatement();
            			java.sql.Statement stmt2=conn.createStatement();
            			java.sql.Statement stmt3=conn.createStatement();
            			java.sql.Statement stmt4=conn.createStatement();
        
					java.sql.ResultSet rs = stmt1.executeQuery("SELECT A.auction_id as 'Auction', A.BidIncrement, A.OpenBid, I.Description, I.ItemType FROM jetauction_db.Auction as A, jetauction_db.Item as I WHERE A.item_id = I.item_id;");
 
     	  while(rs.next())                
        	{
%>
                    <tr>
                      	<td style="vertical-align:middle;">
                         	<span style="font-size: 10pt;"><%=rs.getString(1)%></span></td>
                      	<td style="vertical-align:middle;">
                          	<span style="font-size: 10pt">$<%=rs.getString(2)%></span></td>
                        <td>
                            <span style="font-size: 10pt">$<%=rs.getString(3)%></span></td>
                        <td style="vertical-align:middle;">
                            <span style="font-size: 10pt"><%=rs.getString(4)%></span></td>
                        <td style="vertical-align:middle;">
                            <span style="font-size: 10pt"><%=rs.getString(5)%></span></td>
                        <td style="vertical-align:middle;">
                        	<input type=button  onclick="window.open('BidHistory.jsp?auction_id=<%=rs.getString(1)%>','_self');return;" value="x"></td>
                    </tr>
<%      	} %>
     	    </table>
   			
   			<br /><br />
	
<%        java.sql.ResultSet rs1 = stmt2.executeQuery("SELECT DISTINCT B.auction_id, I.Description FROM Bid B, Customer C, Item I WHERE C.customer_id = B.customer_id AND C.customer_id = " +"'"+ user+"'"+ " AND I.item_id = B.item_id;");
		if(!rs1.isBeforeFirst()) {
%>	
		<h2>No Auction Participation History!</h2>
		<p>You haven't participated in any aucitons! Check out some now and start bidding!</p>
<%
		} else { 
%>
		  	<h2>Auctions Participated</h2>
    	  	
            <table class="table table-striped table-hover" id="TABLE1">
            <thead>
            <tr>
              	<th>
                    <span style="font-size: 12pt; align: center">Auction</span></th>
                <th>
                    <span style="font-size: 12pt; align: center">Description</span></th>
            </tr>   
            </thead>
            
<%
      	  while(rs1.next())                
        	{
%>
                    <tr>
                      	<td style="vertical-align:middle;">
                         	<span style="font-size: 10pt;"><%=rs1.getString(1)%></span></td>
                      	<td style="vertical-align:middle;">
                          	<span style="font-size: 10pt"><%=rs1.getString(2)%></span></td>
                    </tr>
<%      	} %>
            </table>
            
<%     	  
		}
		java.sql.ResultSet rs3 = stmt3.executeQuery("SELECT customer_id, rating FROM Customer ORDER BY Rating DESC");
%>
  					
		</div>
		<div class="col-sm-6 form-group">
			<h3>Best sellers list</h3>
			
			  <ul style="list-style: none;">
			<%int i = 5; %>
			<%while(rs3.next() && i > 0){%>
			  	<li>
					<h4>Seller: <%= rs3.getString(1)%></h4>
					<p>Rating: <%= rs3.getString(2) %></p>
    		  	</li>
    		<%	
    		  	i--;
      		  }
			java.sql.ResultSet rs4 = stmt4.executeQuery(
					"SELECT * FROM ItemsSold ISo " +
					"WHERE NOT EXISTS( " +
						"SELECT  I.item_id, I.itemName " +	 
						"FROM SALES S, Item I " +
						"WHERE ISo.item_id = I.item_id " +
						"AND S.item_id = ISo.item_id " +
						"AND S.buyer_id LIKE \"" + user + "\"" +
					") ORDER BY ISo.Copies_Sold DESC;");
     		%>
			
			<br />
			<h3>Suggested items list</h3>
			<%i = 5; %>
			<%while(rs4.next() && i > 0){%>
			  	<li>
					<h4><%=rs4.getString(2) %></h4>
					<p>ID: <%=rs4.getString(1) %></p>
					<p>Desc: <%=rs4.getString(4) %></p>
    		  	</li>
    			
    		<%	i--;
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
				out.print(e.toString());
			}
			finally
			{
				try{conn.close();}catch(Exception ee){};
			}
			%>
		</div>
	</div>
	</div>
	</div>
</body>
</html>
