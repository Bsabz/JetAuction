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
    <title>Your Course Information -- Student Registration System</title>
	<link rel="stylesheet" href="css/bootstrap.css" ></link>
	<style> th {text-align: center;}</style>
</head>
<body style="text-align: center">
    <span style="font-size: 14pt; font-family: Arial"><strong>Hello, Professor. Your ID is
        <%=session.getValue("login")%>. Here is Your Course Information.</strong><br />
        <br />

<%
		String crscode=request.getParameter("crscode");
        
		String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
     	String mysURL = "jdbc:mysql://127.0.0.1:3306/course_reg"; 
     	String mysUserID = "root"; 
    	String mysPassword = "password";
    	
        String profId = ""+session.getValue("login");
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
        
					java.sql.ResultSet rs = stmt1.executeQuery("select * from Course where Course.InsNo='"+profId+"'");
      	  while(rs.next())
        	{
%>

            	<input type=button  onclick="javascript:window.open('FacultyDetailedCourseInfo.jsp','_self');return;" value="View and Edit Customers">
				<p>
				<p>				
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
  			
                    <!-- START INSERT SALES TABLE -->
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <h2></>Insert a Sales Record</h2>
  					
  					<table class="table table-striped table-hover" id="TABLE1">
                    <thead>
                    <tr>
                      	<th >
                            <span style="font-size: 12pt" >item_id</span></th>
                      	<th>
                            <span style="font-size: 12pt">buyer_id</span></th>
                        <th>
                            <span style="font-size: 12pt">seller_id</span></th>
                        <th>
                            <span style="font-size: 12pt">auction_id</span></th>
                        <th>
                            <span style="font-size: 12pt">ClosingPrice</span></th>
  					</tr>
  					</thead>
  					<tbody>
  					<tr>
  						<form action="RecordSale.jsp" method="get">
	  					<td>
	                        <input type="text" name="item_id" id="item_id"></input></td>
	                    <td>
	                        <input type="text" name="buyer_id" id="buyer_id"></input></td>
	                    <td>
	                        <input type="text" name="seller_id" id="seller_id"></input></td>
	                    <td>
	                        <input type="text" name="auction_id" id="auction_id"></input></td>
	                        <td>
	                        <input type="text" name="ClosingPrice" id="ClosingPrice"></input></td>
  					</tr>
  					</tbody>
  					</table>
  					<p>
					<p>
					<input type="submit"  onclick="javascript:window.open('RecordSale.jsp','_self');return;" value="Record Sales">
	  				</form>
  					
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <input id="Button1" type="button" value="Logout" onclick="window.open('index.htm','_self');" /><br />
                   
                 

</body>
</html>