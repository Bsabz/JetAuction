<%
System.out.println("In create auction ");

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

//passed around username
String username = request.getParameter("target");

//auction info
String auctionName = request.getParameter("auction_name");
String auctionItem = request.getParameter("auction_item");

String auctionItemDescription = request.getParameter("auction_item_description");
String auctionItemYear = request.getParameter("auction_item_year");
String auctionItemType ="car";
//make times
//open date time = current time
java.util.Date dt = new java.util.Date();
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String openDate = sdf.format(dt);
String closeDateTime = request.getParameter("close_date_time");			//assume properly formatted

//bids
String minBid = request.getParameter("min_bid");
String reservePrice = request.getParameter("reserve_price");
double openBid = Integer.parseInt(request.getParameter("open_bid"));
double bidInc = 0.00;

//update number of copies : TODO

//make item id
int itemId = 0;
java.sql.Statement stmt = conn.createStatement();
String sql = "select MAX(item_id) as ItemID from Item;";
java.sql.ResultSet rs = stmt.executeQuery(sql);
//if there are items make it MAX + 1
if (rs.next() )
	itemId = rs.getInt("ItemID") + 1;

stmt.close();

//make auction ids
int auctionId = 0;
stmt = conn.createStatement();
sql = "select MAX(auction_id) as AuctionID from Auction";
rs = stmt.executeQuery(sql);
//if there are items make it MAX + 1
if (rs.next() )
	auctionId = rs.getInt("AuctionID")  + 1;

System.out.println(auctionId + "");

java.sql.Statement preparedStatement = conn.createStatement();
String query = "INSERT into Item values('"+itemId+"','"+auctionItemDescription+"','"+auctionItem+"','"+auctionItemType+"','"+20+"','"+1993+"')";
preparedStatement.executeUpdate(query);


preparedStatement = conn.createStatement();
//TODO: add opening bid

if(openBid >= .01 && openBid <= .99){
	bidInc = .05;
}
else if(openBid >= 1.00 && openBid <= 4.99){
	bidInc = .25;
}
else if(openBid >= 5.00 && openBid <= 24.99){
	bidInc = .50;
}
else if(openBid >= 25.00 && openBid <= 99.99){
	bidInc = 1.00;
}
else if(openBid >= 100.00 && openBid <= 249.99){
	bidInc = 2.50;
}
else if(openBid >= 250.00 && openBid <= 499.99){
	bidInc = 5.00;
}
else if(openBid >= 500.00 && openBid <= 999.99){
	bidInc = 10.00;
}
else if(openBid >= 1000.00 && openBid <= 2499.99){
	bidInc = 25.00;
}
else if(openBid >= 2500.00 && openBid <= 4999.99){
	bidInc = 50.00;
}
else{
	bidInc = 100.00;
}

query = "INSERT into Auction values('"+auctionId+"','"+bidInc+"','"+openBid+"','"+reservePrice+"','"+minBid+"','"+1+"','"+123456789+"','"+itemId+"')";
System.out.println(query);
preparedStatement.executeUpdate(query);

preparedStatement = conn.createStatement();
query = "INSERT into POST values('"+closeDateTime+"','"+openDate+"','"+username+"','"+auctionId+"')";
preparedStatement.executeUpdate(query);

conn.close();
response.sendRedirect("Auction.jsp?auctionId=" + auctionId + "&username=" + username);	
%>