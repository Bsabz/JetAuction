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


</head>
<body style="text-align: center">
    <span style="font-size: 14pt; font-family: Arial"><strong>View and Edit Customers<br />
        <br />
        
            

                    <table border="1" id="TABLE1" onclick="return TABLE1_onclick()" align="center">
                    <tr>
                      <td>
                          <span style="font-size: 10pt">
                          customer_id</span></td>
                      <td>
                          <span style="font-size: 10pt">Last Name</span></td>
                        <td>
                            <span style="font-size: 10pt">First Name</span></td>
                        <td>
                            <span style="font-size: 10pt">Address</span></td>
                        <td>
                            <span style="font-size: 10pt">Zip Code</span></td>
                        <td>
                            <span style="font-size: 10pt">Telephone</span></td>
                        <td>
                            <span style="font-size: 10pt">Email</span></td>
                        <td >
                            <span style="font-size: 10pt">CCN</span></td>
                        <td>
                            <span style="font-size: 10pt">Rating</span></td>
                        <td>
                            <span style="font-size: 10pt">Edit</span></td>
                        </tr>   
<%
			String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
			String mysURL = "jdbc:mysql://127.0.0.1:3306/JetAuction"; 
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
                        <td>
                            <span style="font-size: 10pt"><%=rs.getString(7)%></span></td>
                        <td>
                            <span style="font-size: 10pt"><%=rs.getString(8)%></span></td>
                        <td>
                            <span style="font-size: 10pt"><%=rs.getString(9)%></span></td>
                        <td>
                        <input type=button  onclick="" value="DELETE"></td>	
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
