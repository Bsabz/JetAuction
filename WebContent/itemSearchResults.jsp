<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Item Auction History</title>
<link rel="stylesheet" href="css/bootstrap.css" ></link>
<style> th {text-align: center;}</style>
</head>
<body>
<div id="wrapper">
        
        <!-- Page Content -->
        <div id="page-content-wrapper"  style="text-align: center">
            <div class="container-fluid">
                <div class="row">
<span style="font-size: 14pt; font-family: Arial"><h2><strong>Item Auction History</strong></h2><br />
        <br />			
                    <table id="TABLE1" class="table table-striped table-hover" align="center">
                    <thead>
                    <tr>
                      <th>
                          <span style="font-size: 12pt">Go to auction!</span></th>
                      <th>
                          <span style="font-size: 12pt">UserName</span></th>
                      <th>
                          <span style="font-size: 12pt">ItemName</span></th>
                        <th>
                            <span style="font-size: 12pt">Description</span></th>
                        <th>
                            <span style="font-size: 12pt">ItemType</span></th>
                        <th>
                            <span style="font-size: 12pt">PostDate</span></th>
                        <th>
                            <span style="font-size: 12pt">ExpireDate</span></th>
                        <th>
                            <span style="font-size: 12pt">BidIncrement</span></th>
                        <th>
                            <span style="font-size: 12pt">MinBid</span></th>
                        <th>
                            <span style="font-size: 12pt">Copies Sold</span></th>
                        <th>
                            <span style="font-size: 12pt">Employee First Name</span></th>   
                        <th>
                            <span style="font-size: 12pt">Employee Last Name</span></th> 
                     </tr>   
                     </thead>
                     <tbody>
<%
			String user = request.getParameter("username");
			String item = request.getParameter("item");

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
        
				java.sql.ResultSet rs = stmt1.executeQuery("SELECT  C.customer_id, I.ItemName, I.Description, I.ItemType, "
						+ "P.PostDate, P.ExpireDate, A.BidIncrement, A.MinBid, "
						+ "A.Copies_Sold, ps.FirstName as 'Emp_FirstName', ps.LastName as 'Emp_LastName', A.auction_id "
						+ "FROM     Customer C, Auction A, Post P, Employee E, Person ps, Item I "
						+ "WHERE  A.auction_id = P.auction_id "
						+ "AND P.customer_id = C.customer_id "
						+ "AND A.Monitor = E.employee_id "
						+ "AND ps.SSN = E.employee_id "
						+ "AND I.item_id = A.item_id "
						+ "AND I.ItemType= '" + item + "';");
 			
     	  while(rs.next())                
        	{
%>
					
                    <tr>
                      <td>
                      	<input id="searchAuctions" type="submit" style="display:inline" value="Go to auction" onclick="window.open('Auction.jsp?auctionId=<%=rs.getString(12)%>&username=<%=user%>','_self');" ></td>
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
                        <td>
                            <span style="font-size: 10pt"><%=rs.getString(7)%></span></td>
                        <td>
                        	<span style="font-size: 10pt"><%=rs.getString(8)%></span></td>
                        <td>
                            <span style="font-size: 10pt"><%=rs.getString(9)%></span></td>
                        <td>
                            <span style="font-size: 10pt"><%=rs.getString(10)%></span></td>
                        <td>
                        	<span style="font-size: 10pt"><%=rs.getString(11)%></span></td>
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