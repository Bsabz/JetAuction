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
    <title>View and Edit Employees -- JetAuction</title>
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
                <li class=".sidebar-nav li a disabled">
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
                   

    <span style="font-size: 14pt; font-family: Arial" ><h2><strong>View/Edit Employees</strong></h2><br />
        <br />


                    <table class="table table-striped table-hover" id="TABLE1">
                    <thead>
                    <tr>
                      	<th >
                            <span style="font-size: 12pt">employee_id</span></th>
                      	<th>
                            <span style="font-size: 12pt">Last Name</span></th>
                        <th>
                            <span style="font-size: 12pt">First Name</span></th>
                        <th>
                            <span style="font-size: 12pt">Address</span></th>
                        <th>
                            <span style="font-size: 12pt">Zip Code</span></th>
                        <th>
                            <span style="font-size: 12pt">Telephone</span></th>
                        <th>
                            <span style="font-size: 12pt">Email</span></th>
                        <th >
                            <span style="font-size: 12pt">Start Date</span></th>
                        <th>
                            <span style="font-size: 12pt">Hourly Rate</span></th>
                        <th >
                            <span style="font-size: 12pt">Levels</span></th>
                        <th>
                            <span style="font-size: 12pt">Edit</span></th>
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
        
					java.sql.ResultSet rs = stmt1.executeQuery("SELECT E.employee_id, P.LastName, P.FirstName, P.Address, P.ZipCode, P.Telephone, P.Email, E.StartDate, E.HourlyRate, E.Levels FROM Employee as E, Person as P WHERE E.employee_id = P.SSN GROUP BY employee_id;");
 
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
                        <td style="vertical-align:middle;">
                            <span style="font-size: 10pt"><%=rs.getString(4)%></span></td>
                        <td style="vertical-align:middle;">
                        	<!-- <input type="text" name="stu_<%=rs.getString(3)%>" value=<%=(rs.getString(5).trim().equals("-1"))?"":rs.getString(5)%>> -->
                        	<span style="font-size: 10pt"><%=rs.getString(5)%></span></td>
                        <td style="vertical-align:middle;">
                            <span style="font-size: 10pt"><%=rs.getString(6)%></span></td>
                        <td style="vertical-align:middle;">
                            <span style="font-size: 10pt"><%=rs.getString(7)%></span></td>
                        <td style="vertical-align:middle;">
                            <span style="font-size: 10pt"><%=rs.getString(8)%></span></td>
                        <td style="vertical-align:middle;">
                            <span style="font-size: 10pt"><%=rs.getString(9)%></span></td>
                        <td style="vertical-align:middle;">
                            <span style="font-size: 10pt"><%=rs.getString(10)%></span></td>
                        <td style="vertical-align:middle;">
                        	<input type=button  onclick="" value="x"></td>	
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

<h1 style="color:red;">-Implement edit page<br></h1>

</body>
</html>
