<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Bid History</title>
	<link rel="stylesheet" href="css/bootstrap.css" ></link>
	<style> th {text-align: center;}</style>

	<link rel="stylesheet" href="css/bootstrap.css" ></link>
	<link rel="stylesheet" href="css/bootsnip.css" ></link>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"></link>
	<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'></link>
</head>

<body>
<div id="wrapper">
        
        <!-- Page Content -->
        <div id="page-content-wrapper"  style="text-align: center">
            <div class="container-fluid">
                <div class="row">
<span style="font-size: 14pt; font-family: Arial"><h2><strong>Bid History</strong></h2><br />
        <br />			
                    <table id="TABLE1" class="table table-striped table-hover" align="center">
                    <thead>
                    <tr>
                      <th>
                          <span style="font-size: 12pt">FirstName</span></th>
                      <th>
                          <span style="font-size: 12pt">LastName</span></th>
                        <th>
                            <span style="font-size: 12pt">MaxBid</span></th>
                        <th>
                            <span style="font-size: 12pt">CurrBid</span></th>
                        <th>
                            <span style="font-size: 12pt">BidIncrement</span></th>
                        <th>
                            <span style="font-size: 12pt">CurrWinner</span></th>
                        </tr>   
                     </thead>
                     <tbody>
<%
			String auction_id = request.getParameter("auction_id");

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
        
				java.sql.ResultSet rs = stmt1.executeQuery("SELECT P.FirstName, P.LastName, B.MaxBid, B.CurrBid, A.BidIncrement, B.CurrWinner"
								+ " FROM Auction A, Bid B, Customer C, Person P"
								+ " WHERE C.customer_id = B.customer_id "
								+ " AND A.auction_id = B.auction_id"
								+ " AND A.auction_id = " + auction_id 
								+ " AND C.SSN = P.SSN");
 			
     	  while(rs.next())                
        	{
%>
					
                    <tr>
                      <td>
                          <span style="font-size: 10pt"><%=rs.getString(1)%></span></td>
                      <td>
                          <span style="font-size: 10pt"><%=rs.getString(2)%></span></td>
                        <td>
                            <span style="font-size: 10pt"><%=rs.getString(3)%></span></td>
                        <td>
                            <span style="font-size: 10pt"><%=rs.getString(4)%></span></td>
                        <td>
                        	<span style="font-size: 10pt"><%=rs.getString(5)%></span></td>
                        <td>
                            <span style="font-size: 10pt"><%=rs.getString(6)%></span></td>
                    </tr>
                    
<%      		
        	}
  			} catch(Exception e)
			{
				e.printStackTrace();
				out.print(e.toString());
			}
			finally{
			
				try{conn.close();}catch(Exception ee){};
			}

  %>
  					</tbody>
  					</table>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <input id="Button1" type="button" onclick="javascript:history.back();" value="<--Prev" />
                    <input id="Button3" type="button" onclick="window.open('index.htm','_self');" value="Logout" /><br />
                    <span style="font-size: 8pt">
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div> 

</body>
</html>