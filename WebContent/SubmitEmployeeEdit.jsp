<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Error editing employee!</title> 
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

	<!-- All the files that are required -->
	<link rel="stylesheet" href="css/bootsnip.css" ></link>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"></link>
	<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'></link>
</head>

<div class="text-center" style="padding:50px 0" align="center">
	<%
	
		java.util.Date currentDateTime = new java.util.Date();  	
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
		String currentDate = sdf.format(currentDateTime);
	
		String id = request.getParameter("employee_id");
		String fName = request.getParameter("fName");
		String lName = request.getParameter("lName");
		String address = request.getParameter("address");
		String zip = request.getParameter("zip");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String rate = request.getParameter("rate");
		String status = request.getParameter("status");
		
		String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
     	String mysURL = "jdbc:mysql://127.0.0.1:3306/jetauction_db"; 
     	String mysUserID = "root"; 
    	String mysPassword = "password";

		java.sql.Connection conn=null;
		
		boolean caughtException = false;
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
       		java.sql.Statement stmt6=conn.createStatement();
       		java.sql.Statement stmt7=conn.createStatement();
       		java.sql.Statement stmt8=conn.createStatement();
       		
       		if(!(fName.equals("") || fName.equals("null")))
       			stmt1.executeUpdate("UPDATE Person SET FirstName = '" + fName + "'  WHERE SSN = '" + id + "'");
       		
       		if(!(lName.equals("") || lName.equals("null")))
       			stmt2.executeUpdate("UPDATE Person SET LastName = '" + lName + "'  WHERE SSN = '" + id + "'");
       		
       		if(!(address.equals("") || address.equals("null")))
       			stmt3.executeUpdate("UPDATE Person SET Address = '" + address + "'  WHERE SSN = '" + id + "'");
       		
       		if(!(zip.equals("") || zip.equals("null")))
       			stmt4.executeUpdate("UPDATE Person SET ZipCode = '" + zip + "'  WHERE SSN = '" + id + "'");
       		
       		if(!(rate.equals("") || rate.equals("null")))
       			stmt5.executeUpdate("UPDATE Employee SET HourlyRate = '" + rate + "'  WHERE employee_id = '" + id + "'");
       		
       		if(!(status.equals("") || status.equals("null")))
       			stmt6.executeUpdate("UPDATE Employee SET Levels = '" + status + "'  WHERE employee_id = '" + id + "'");
       		
       		if(!(phone.equals("") || phone.equals("null")))
       			stmt7.executeUpdate("UPDATE Person SET Telephone = '" + phone + "'  WHERE SSN = '" + id + "'");
       		
       		if(!(email.equals("") || email.equals("null")))
       			stmt8.executeUpdate("UPDATE Person SET Email = '" + email + "'  WHERE SSN = '" + id + "'");
           
		} 
		catch(Exception e)
		{
			caughtException = true;
			
			e.printStackTrace();
		}
		finally
		{
			try{conn.close();}catch(Exception ee){};
		}
	%>
	
	<!--if we didn't raise an exception, display "User added successfully -->
	<%if(!caughtException){%>
		<h2>Employee Edited!</h2>
		<a href="Manager.jsp"><font color="Blue">Continue to JetAuction</font></a>
	<%}else{%>
		<h2>Oops :(</h2>
		<h2>Something went wrong. <a href="Manager.jsp"><font color="Blue">Let's try that again</font></a></h2>
	<%}%>
</div>	