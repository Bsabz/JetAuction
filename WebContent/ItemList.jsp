<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Item List</title>
<link rel="stylesheet" href="css/bootstrap.css" ></link>
<link rel="stylesheet" href="css/sidebar.css" ></link>
<style> th {text-align: center;}</style>
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
                 <li class=".sidebar-nav li a disabled">
                    <a onclick="window.open('ItemList.jsp','_self');return;">Item List</a>
                </li>
                <li>
                    <a onclick="window.open('TotalRevenue.jsp','_self');return;">Total Revenue</a>
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
<span style="font-size: 14pt; font-family: Arial"><h2><strong>Item List</strong></h2><br />
        <br />
        
            
					
                    <table id="TABLE1" class="table table-striped table-hover" align="center">
                    <thead>
                    <tr>
                      <th>
                          <span style="font-size: 12pt">item_id</span></th>
                      <th>
                          <span style="font-size: 12pt">Description</span></th>
                        <th>
                            <span style="font-size: 12pt">Item Name</span></th>
                        <th>
                            <span style="font-size: 12pt">Item Type</span></th>
                        <th>
                            <span style="font-size: 12pt">NumCopies</span></th>
                        <th>
                            <span style="font-size: 12pt">Year Of Model</span></th>
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
        
					java.sql.ResultSet rs = stmt1.executeQuery("SELECT * FROM Item;");
 			
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
                        	<!-- <input type="text" name="stu_<%=rs.getString(3)%>" value=<%=(rs.getString(5).trim().equals("-1"))?"":rs.getString(5)%>> -->
                        	<span style="font-size: 10pt"><%=rs.getString(5)%></span>
                        </td>
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