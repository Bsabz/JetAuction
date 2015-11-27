<%
if (request.getProtocol().compareTo("HTTP/1.0")==0)
      response.setHeader("Pragma","no-cache");
if (request.getProtocol().compareTo("HTTP/1.1")==0)
      response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires",0);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Sales List by Item Name</title>
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
                <li class=".sidebar-nav li a disabled">
                    <a onclick="window.open('ItemSalesList.jsp','_self');return;">Sales List</a>
                </li>
                 <li>
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
                   

    <span style="font-size: 14pt; font-family: Arial" ><h2><strong>List of Sales by Item Name</strong></h2><br />
        <br />
   
            

                    <table class="table table-striped table-hover" id="TABLE1">
                    <thead>
                    <tr>
                      	<th >
                            <span style="font-size: 12pt">Item Name</span></th>
                      	<th>
                            <span style="font-size: 12pt">First Name</span></th>
                        <th>
                            <span style="font-size: 12pt">Last Name</span></th>
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
        
					java.sql.ResultSet rs = stmt1.executeQuery("SELECT I.ItemName, P.FirstName, P.LastName " +
							"FROM  Item I, Customer C, Person P, Auction A, Post O " +
							"WHERE A.item_id = I.item_id "  +
							"AND O.auction_id = A.auction_id " +
							"AND O.customer_id = C.customer_id " + 
							"AND C.SSN = P.SSN " +
							"GROUP BY I.ItemName, P.FirstName, P.LastName");
 
     	  while(rs.next())                
        	{
%>
                    <tr>
                      	<td style="vertical-align:middle;">
                         	<span style="font-size: 10pt;"><%=rs.getString(1)%></span></td>
                      	<td style="vertical-align:middle;">
                          	<span style="font-size: 10pt"><%=rs.getString(2)%></span></td>
                        <td style="vertical-align:middle;">
                            <span style="font-size: 10pt"><%=rs.getString(3)%></span></td>	
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
  					</table>
  					
                
            <input disabled id="Iname" type="button" onclick="window.open('ItemSalesList.jsp','_self');" value="By Item Name" />
            <input id="Cname" type="button" onclick="window.open('CusNameSalesList.jsp','_self');" value="By Customer Name" /><br>     					
  					
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <input id="Button1" type="button" onclick="javascript:history.back();" value="<--Prev" />
                    <input id="Button3" type="button" onclick="window.open('index.htm','_self');" value="Logout" /><br />

                </div>
            </div>
        </div> 
        <!-- /#page-content-wrapper -->

    </div>


</body>
</html>
