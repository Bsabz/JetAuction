<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.css" ></link>
<title>Insert title here</title>
<style> th {text-align: center;}</style>
</head>
<body style="text-align: center">
<table class="table table-striped table-hover" id="TABLE1" align="center">
                    <thead>
                    <tr>
                      	<th >
                            <span style="font-size: 12pt" >item_id</span></th>
                      	<th>
                            <span style="font-size: 12pt">buyer_id</span></th>
                        <th>
                            <span style="font-size: 12pt">seller_id</span></th>
                        <th>
                            <span style="font-size: 12pt">auction_id</span></th>
                        <th>
                            <span style="font-size: 12pt">ClosingPrice</span></th>
  					</tr>
  					</thead>
  					<tbody>
<%                    
String strItmID = request.getParameter("item_id");
String strBuyerID = request.getParameter("buyer_id");
String strSellerID = request.getParameter("seller_id");
String strAuctionID = request.getParameter("auction_id");
String strClosingPrice = request.getParameter("ClosingPrice");
System.out.println(strItmID + strBuyerID + strSellerID + strAuctionID+ strClosingPrice);
String strId;

		String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
     	String mysURL = "jdbc:mysql://127.0.0.1:3306/jetauction_db"; 
     	String mysUserID = "root"; 
    	String mysPassword = "password";
        String stuId = ""+session.getValue("login");
  			
  
  
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
            
            			java.sql.Statement stmt=conn.createStatement();
        java.sql.Statement stmt1=conn.createStatement();
									java.sql.Statement stmt2=conn.createStatement();
									  
		
		 		   			int r = stmt.executeUpdate("INSERT INTO SALES VALUES ('"+strItmID+"','"+strBuyerID+"','"+strSellerID+"','"+strAuctionID+"','"+strClosingPrice+"')");
		 		   		
		 		   		}
		 		   	
			finally{
			
				try{conn.close();}catch(Exception ee){};
			}
%>            
 						</tbody>
                    </table>        
</body>
</html>