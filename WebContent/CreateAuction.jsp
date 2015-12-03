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

//update number of copies : TODO

//make item id
int itemId = 0;
java.sql.Statement stmt = conn.createStatement();
String sql = "SELECT MAX(item_id) FROM Item;";
java.sql.ResultSet rs = stmt.executeQuery(sql);
//if there are items make it MAX + 1
if (!rs.isBeforeFirst() )
	itemId = rs.getInt(0) + 1;

//make auction ids
int auctionId = 0;
stmt = conn.createStatement();
sql = "SELECT MAX(auction_id) FROM Auction;";
rs = stmt.executeQuery(sql);
//if there are items make it MAX + 1
if (!rs.isBeforeFirst() )
	auctionId = rs.getInt(0) + 1;


java.sql.Statement preparedStatement = conn.createStatement();
String query = "INSERT into Item values('"+itemId+"','"+auctionItemDescription+"','"+auctionItem+"','"+auctionItemType+"','"+20+"','"+1993+"')";
preparedStatement.executeUpdate(query);


preparedStatement = conn.createStatement();
//TODO: add opening bid
query = "INSERT into Auction values('"+auctionId+"','"+20+"','"+1+"','"+reservePrice+"','"+minBid+"','"+1+"','"+123456789+"','"+itemId+"')";
System.out.println(query);

preparedStatement.executeUpdate(query);

conn.close();
response.sendRedirect("Auction.jsp?auctionId=" + auctionId);	
%>