<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="text-align: center">
<span style="font-size: 14pt; font-family: Arial"><strong>Customer Mailing List<br />
        <br />
        
            
					
                    <table border="1" id="TABLE1" onclick="return TABLE1_onclick()" align="center">
                    <tr>
                      <td>
                          <span style="font-size: 10pt">
                          First Name</span></td>
                      <td>
                          <span style="font-size: 10pt">Last Name</span></td>
                        <td>
                            <span style="font-size: 10pt">Email</span></td>
                        <td>
                            <span style="font-size: 10pt">Address</span></td>
                        <td>
                            <span style="font-size: 10pt">Zip Code</span></td>
                        </tr>   
<%
			String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
			String mysURL = "jdbc:mysql://localhost:3306/jetauction_db";
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
        
					java.sql.ResultSet rs = stmt1.executeQuery("SELECT P.FirstName, P.LastName, P.Email, P.Address, P.ZipCode FROM Customer C, Person P WHERE C.SSN = P.SSN GROUP BY  P.FirstName;");
 
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
                    <span style="font-size: 8pt">

</body>
</html>