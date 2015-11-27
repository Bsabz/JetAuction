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
    <title>Sales Report by Customer Name</title>
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
                <li class=".sidebar-nav li a disabled">
                    <a onclick="window.open('ItemSalesList.jsp','_self');return;">Sales Report</a>
                </li>
                <li>
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
                   

    <span style="font-size: 14pt; font-family: Arial" ><h2><strong>Sales Report for Month of <%=request.getParameter("month") %></strong></h2><br />
        <br />       

                    <table class="table table-striped table-hover" id="TABLE1">
                    <thead>
                    <tr>
                      	<th >
                            <span style="font-size: 12pt">item_id</span></th>
                      	<th>
                            <span style="font-size: 12pt">Item Name</span></th>
                        <th>
                            <span style="font-size: 12pt">buyer_id</span></th>
                        <th>
                            <span style="font-size: 12pt">seller_id</span></th>
                        <th>
                            <span style="font-size: 12pt">Closing Price</span></th>
                        <th>
                            <span style="font-size: 12pt">Post Date</span></th>
                        <th>
                            <span style="font-size: 12pt">Expire Date</span></th>
                    </tr>   
                    </thead>
<%
String month = request.getParameter("month");

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
        
					java.sql.ResultSet rs = stmt1.executeQuery("SELECT I.item_id, I.ItemName, S.buyer_id, S.seller_id, S.ClosingPrice, PO.PostDate, PO.ExpireDate " +
							"FROM SALES S, Auction A, Item I, Post PO " +
							"WHERE monthname(PO.ExpireDate) = '"+ month + "' " +
								"AND PO.auction_id = A.auction_id " +
							    "AND S.auction_id = PO.auction_id " +
							    "AND S.item_id = I.item_id " +
							    "AND A.item_id = S.item_id");
 
     	  while(rs.next())                
        	{
%>
                    <tr>
                      	<td style="vertical-align:middle;">
                         	<span style="font-size: 10pt;"><%=rs.getString(1)%></span></td>
                      	<td style="vertical-align:middle;">
                          	<span style="font-size: 10pt;"><%=rs.getString(2)%></span></td>
                        <td style="vertical-align:middle;">
                            <span style="font-size: 10pt;"><%=rs.getString(3)%></span></td>	
                        <td style="vertical-align:middle;">
                         	<span style="font-size: 10pt;"><%=rs.getString(4)%></span></td>
                      	<td style="vertical-align:middle;">
                          	<span style="font-size: 10pt;"><%=rs.getString(5)%></span></td>
                        <td style="vertical-align:middle;">
                            <span style="font-size: 10pt;"><%=rs.getString(6)%></span></td>	
                        <td style="vertical-align:middle;">
                         	<span style="font-size: 10pt;"><%=rs.getString(7)%></span></td>
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
