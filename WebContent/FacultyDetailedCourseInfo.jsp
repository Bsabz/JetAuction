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
    <title>View and Edit Customers -- JetAuction</title>
	<link rel="stylesheet" href="css/bootstrap.css" ></link>
	<style> th {text-align: center;}</style>
</head>
<body style="text-align: center">
    <span style="font-size: 14pt; font-family: Arial"><strong>View and Edit Customers</strong><br />
        <br />
        
            

                    <table class="table table-striped table-hover" id="TABLE1">
                    <thead>
                    <tr>
                      	<th >
                            <span style="font-size: 12pt" >customer_id</span></th>
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
                            <span style="font-size: 12pt">CCN</span></th>
                        <th>
                            <span style="font-size: 12pt">Rating</span></th>
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
        
					java.sql.ResultSet rs = stmt1.executeQuery("SELECT C.customer_id, P.LastName, P.FirstName, P.Address, P.ZipCode, P.Telephone, P.Email, C.CreditCardNum, C.Rating FROM Customer as C, Person as P WHERE C.SSN = P.SSN GROUP BY customer_id;");
 
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
                    <input id="Button0" type="button" value="Generate Mailing List" onclick="window.open('MailingList.jsp','_self');return;" />
                    <br />
                    <br />
                    <br />
                    <br />
                    <input id="Button1" type="button" onclick="javascript:history.back();" value="<--Prev" />
                    <input id="Button2" type="submit" value="Submit" />
                    <input id="Button3" type="button" onclick="window.open('index.htm','_self');" value="Logout" /><br />




</body>
</html>
