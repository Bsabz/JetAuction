<%
System.out.println("In post bid ");

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
String bidderName = request.getParameter("bidderName");
int auctionId = Integer.parseInt(request.getParameter("auctionId"));
int itemId = Integer.parseInt(request.getParameter("itemId"));
double currBid = Integer.parseInt(request.getParameter("bidAmount"));

//make times
//open date time = current time
java.util.Date dt = new java.util.Date();
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String currentTime = sdf.format(dt);

//make bid id
int bidId = 0;
java.sql.Statement stmt = conn.createStatement();
String sql = "select MAX(bid_id) as BidID from Bid;";
java.sql.ResultSet rs = stmt.executeQuery(sql);
//if there are items make it MAX + 1
//if (rs.next() )
//	itemId = rs.getInt("BidID") + 1;

stmt.close();

java.sql.Statement preparedStatement = conn.createStatement();
String query = "INSERT into Bid values('"+bidderName+"','"+auctionId+"','"+itemId+"','"+currentTime+"','"+bidId+"','"+currBid+"','"+666+"','"+bidderName+"')";
preparedStatement.executeUpdate(query);

//if success
response.sendRedirect("CustomerHomePage.jsp?username=" + bidderName);	
%>