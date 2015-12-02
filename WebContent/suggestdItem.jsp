<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
                    <a onclick="window.open('FacultyInformation.jsp','_self');return;">Record Sale</a>
                </li>
                <li>
                    <a onclick="window.open('FacultyDetailedCourseInfo.jsp','_self');return;">View/Edit Customers</a>
                </li>
                <li>
                    <a onclick="window.open('FacultyView.jsp','_self');return;">View Employees</a>
                </li>
                <li>
                    <a onclick="window.open('MailingList.jsp','_self');return;">Mailing List</a>
                </li>
                 <li class=".sidebar-nav li a disabled">
                    <a>Suggest Items</a>
                </li>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper"  style="text-align: center">
            <div class="container-fluid">
                <div class="row">
                   

    <span style="font-size: 14pt; font-family: Arial" ><h2><strong>Item Suggestions for <%=request.getParameter("customer_id")%></strong></h2><br />
        <br />
        
            

                    <table class="table table-striped table-hover" id="TABLE1">
                    <thead>
                    <tr>
                      	<th >
                            <span style="font-size: 12pt" >item_id</span></th>
                      	<th>
                            <span style="font-size: 12pt">Item Name</span></th>
                        <th>
                            <span style="font-size: 12pt">Copies Sold</span></th>
                        <th>
                            <span style="font-size: 12pt">Description</span></th>
                    </tr>   
                    </thead>
<%
String customer_id = request.getParameter("customer_id");
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
        
					java.sql.ResultSet rs = stmt1.executeQuery(
						"SELECT * FROM ItemsSold ISo " +
						"WHERE NOT EXISTS( " +
							"SELECT  I.item_id, I.itemName " +	 
							"FROM SALES S, Item I " +
							"WHERE ISo.item_id = I.item_id " +
							"AND S.item_id = ISo.item_id " +
							"AND S.buyer_id LIKE \"" + customer_id + "\"" +
						") ORDER BY ISo.Copies_Sold DESC;");
 
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
                    <input id="Button2" type="submit" value="Submit" />
                    <input id="Button3" type="button" onclick="window.open('index.htm','_self');" value="Logout" /><br />

                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>

</body>
</html>