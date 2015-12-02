<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Total Revenue</title>
<link rel="stylesheet" href="css/bootstrap.css" ></link>
<link rel="stylesheet" href="css/sidebar.css" ></link>
<style> th {text-align: center;}</style>
<style>.container-fluid {
    padding-right:80px;
}</style>
</head>
<body>
<div id="wrapper">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
           
            <ul class="sidebar-nav">
                <p><br>
                 <li class="sidebar-brand">
                    <a href="#">
                        <img src="JetAuctionLogo.png" height="72">
                    </a>
                </li>
                <br><br>    
                <li>
                    <a onclick="window.open('Manager.jsp','_self');return;">View/Edit Employees</a>
                </li>
                <li>
                    <a onclick="window.open('SalesReportSearch.html','_self');return;">Sales Report</a>
                </li>
                <li>
                    <a onclick="window.open('ItemSalesList.jsp','_self');return;">Sales List</a>
                </li>
                 <li>
                    <a onclick="window.open('ItemList.jsp','_self');return;">Item List</a>
                </li>
                <li class=".sidebar-nav li a disabled">
                    <a onclick="window.open('','_self');return;">Total Revenue</a>
                </li>
                <li>
                    <a onclick="window.open('ItemBestSeller.jsp','_self');return;">Item Best-Sellers</a>
                </li>
             </ul>
        </div>
        <!-- /#sidebar-wrapper -->
        
        <!-- Page Content -->
        <div id="page-content-wrapper"  style="text-align: center">
            <div class="container-fluid">
                <div class="row">
<span style="font-size: 14pt; font-family: Arial"><h2><strong>Generated Revenue</strong></h2><br />
        <br />
        
            <div class="panel panel-primary">
  				<div class="panel-heading">
								<h3 class="panel-title"><strong>Revenue Made by Item</strong></h3>
							</div>

                    <table id="TABLE1" class="table table-striped table-hover" align="center">
                    <thead>
                    <tr>
                      <th>
                          <span style="font-size: 12pt">Item Name</span></th>
                      <th>
                          <span style="font-size: 12pt">Revenue Name</span></th>       
                        </tr>   
                     </thead>
                     <tbody>
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
            			java.sql.Statement stmt5=conn.createStatement();

		java.sql.ResultSet mostRevenueCustomer = stmt1
				.executeQuery("SELECT P.FirstName, P.LastName, C.customer_id "
						+ "FROM CustSellerRevenue CSR, Person P, Customer C "
						+ "WHERE Revenue >= (SELECT MAX(Revenue * 0.9) FROM CustSellerRevenue) "
						+ "AND CSR.seller_id = C.customer_id " + "AND P.SSN = C.SSN");

		java.sql.ResultSet revenueItem = stmt2.executeQuery("SELECT m.ItemName, SUM(m.ClosingPrice) AS Revenue "
				+ "FROM ( SELECT I.ItemName, I.item_id, S.ClosingPrice " + "FROM SALES S, Item I "
				+ "WHERE I.Item_id = S.item_id) AS m " + "GROUP BY m.ItemName;");

		java.sql.ResultSet revenueItemType = stmt3
				.executeQuery("SELECT m.ItemType, SUM(m.ClosingPrice) AS Revenue "
						+ "FROM ( SELECT I.ItemType, I.item_id, S.closingPrice " + "FROM SALES S, Item I "
						+ "WHERE I.item_id=S.item_id) AS m " + "GROUP BY m.ItemType");
		
		java.sql.ResultSet revenueCustomer = stmt4
				.executeQuery("SELECT  m.customer_id, m.FirstName, m.LastName, " +
						 "SUM(m.closingPrice) AS Revenue " +
							"FROM ( SELECT p.FirstName, p.LastName, c.customer_id, s.ClosingPrice " +
								   "FROM Person p, Customer c, SALES s " +
								   "WHERE c.SSN = p.SSN " +
					               		   "AND c.customer_id = s.seller_id) AS m " +
							"GROUP BY FirstName, LastName");
		
		java.sql.ResultSet revenueCustomerRep = stmt5.executeQuery("SELECT DISTINCT P.FirstName, P.LastName, E.employee_id " +
				"FROM CustRepSellerRevenue CRSR, Person P, Employee E, Customer C, Auction A, SALES S " +
				"WHERE Revenue >= (SELECT MAX(Revenue * 0.1) " +
				"FROM CustRepSellerRevenue ) " +
				"AND CRSR.seller_id = C.customer_id " +
				"AND P.SSN = E.employee_id " +
				"AND A.Monitor = E.employee_id " +
				"AND S.auction_id = A.auction_id");


     	  	while(revenueItem.next())                
        	{
%>
										<tr>
											<td><span style="font-size: 10pt"><%=revenueItem.getString(1)%></span></td>
											<td><span style="font-size: 10pt"><%=revenueItem.getString(2)%></span></td>
										</tr>
<%      								
        	}	
%>	
									</tbody>
								</table>
						</div> <br />

						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title"><strong>Revenue Made by Item Type</strong></h3>
							</div>
							<table id="TABLE2" class="table table-striped table-hover" align="center">
									<thead>
										<tr>
											<th><span style="font-size: 12pt">Item Type</span></th>
											<th><span style="font-size: 12pt">Revenue</span></th>
										</tr>
									</thead>
									<tbody>
<%		
     	  	while(revenueItemType.next())                
        	{
%>
										<tr>
											<td><span style="font-size: 10pt"><%=revenueItemType.getString(1)%></span></td>
											<td><span style="font-size: 10pt"><%=revenueItemType.getString(2)%></span></td>
										</tr>
<%      								
        	}	
%>
									</tbody>
								</table>
						</div> <br />
						
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title"><strong>Revenue by Customer</strong></h3>
							</div>
									<table id="TABLE2" class="table table-striped table-hover" align="center">
									<thead>
										<tr>
											<th><span style="font-size: 12pt">customer_id</span></th>
											<th><span style="font-size: 12pt">First Name</span></th>
											<th><span style="font-size: 12pt">Last Name</span></th>
											<th><span style="font-size: 12pt">Revenue</span></th>
										</tr>
									</thead>
									<tbody>
<%		
     	  	while(revenueCustomer.next())                
        	{
%>
										<tr>
											<td><span style="font-size: 10pt"><%=revenueCustomer.getString(1)%></span></td>
											<td><span style="font-size: 10pt"><%=revenueCustomer.getString(2)%></span></td>
											<td><span style="font-size: 10pt"><%=revenueCustomer.getString(3)%></span></td>
											<td><span style="font-size: 10pt"><%=revenueCustomer.getString(4)%></span></td>
										</tr>
<%      								
        	}	
%>
									</tbody>
								</table>
						</div> <br />
						
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title"><strong>Customer with Most Total Revenue</strong></h3>
							</div>
								<table id="TABLE2" class="table table-striped table-hover" align="center">
									<thead>
										<tr>
											<th><span style="font-size: 12pt">First Name</span></th>
											<th><span style="font-size: 12pt">Last Name</span></th>
											<th><span style="font-size: 12pt">customer_id</span></th>
										</tr>
									</thead>
									<tbody>
<%
					while (mostRevenueCustomer.next()) {
%>
					
                    <tr>
                      <td><span style="font-size: 10pt"><%=mostRevenueCustomer.getString(1)%></span></td>
                      <td><span style="font-size: 10pt"><%=mostRevenueCustomer.getString(2)%></span></td>
                      <td><span style="font-size: 10pt"><%=mostRevenueCustomer.getString(3)%></span></td>
           			</tr>
                    
<%      		
        	}
%>
  					</tbody>
  					</table>
  					</div><br/>
						
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title"><strong>Customer Representative with Most Total Revenue</strong></h3>
							</div>
									<table id="TABLE2" class="table table-striped table-hover" align="center">
									<thead>
										<tr>
											<th><span style="font-size: 12pt">First Name</span></th>
											<th><span style="font-size: 12pt">Last Name</span></th>
											<th><span style="font-size: 12pt">employee_id</span></th>
										</tr>
									</thead>
									<tbody>
<%		
     	  	while(revenueCustomerRep.next())                
        	{
%>
										<tr>
											<td><span style="font-size: 10pt"><%=revenueCustomerRep.getString(1)%></span></td>
											<td><span style="font-size: 10pt"><%=revenueCustomerRep.getString(2)%></span></td>
											<td><span style="font-size: 10pt"><%=revenueCustomerRep.getString(3)%></span></td>
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
						</div> <br />

                    <br />
                    <input id="Button1" type="button" onclick="javascript:history.back();" value="<--Prev" />
                    <input id="Button3" type="button" onclick="window.open('index.htm','_self');" value="Logout" /><br />
                    <span style="font-size: 8pt"></span>
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div> 
<h1 style="color:red;">
<br>-Fix the transaction -> which customer representative generated most total revenue


</body>
</html>