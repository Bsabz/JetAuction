<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Invalid User name or Password!</title> 
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
	
		String Id = request.getParameter("Id");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String Address = request.getParameter("address_line_1");
		String Address2 = request.getParameter("address_line_2");
		String City = request.getParameter("city");
		String State = request.getParameter("state");
		String Zip = request.getParameter("zip");
		String SSN = request.getParameter("ssn");
		String Phone = request.getParameter("phone");
		String Email = request.getParameter("email");
		String CreditCard = request.getParameter("credit");
		int Rating = 1;
		int defaultManagerRate = 60;
		int defaultEmpRate = 10;
		int mgrLevel = 2;
		String Password1 = request.getParameter("Password1");
		Address = Address + " " + Address2 + " " + City + ", " + State;
		
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
            			
            java.sql.ResultSet rs = stmt1.executeQuery("SELECT SSN FROM Person WHERE SSN='"+SSN+"' ");
           	String SSNstr = "";
            			
			if(rs.next())
				SSNstr = rs.getString("SSN");
						
        	stmt1.close();
        	            
       		if (SSNstr.equals(SSN))
       			response.sendRedirect("RegisterPage.htm");
        				
        	stmt2.executeUpdate("insert into Person values('"+SSN+"','"+lname+"','"+fname+"','"+Address+"','"+Zip+"','"+Phone+"','"+Email+"')");
       		
	        if (request.getParameter("target").trim().equals("Customer"))
	        {
				stmt3.executeUpdate("insert into Customer values('"+Rating+"','"+CreditCard+"','"+Id+"','"+SSN+"','"+Password1+"')");
				
			}
	        else if(request.getParameter("target").trim().equals("Manager"))
	        {
				stmt3.executeUpdate("insert into Employee values('"+currentDate+"','"+defaultManagerRate+"','"+mgrLevel+"','"+SSN+"','"+Password1+"')");
			}
	        else{
	        	stmt3.executeUpdate("insert into Employee values('"+currentDate+"','"+defaultEmpRate+"','"+Rating+"','"+SSN+"','"+Password1+"')");
	        }
	        stmt2.close();
			stmt3.close();
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
		<h2>User Added!</h2>
		<a href="index.htm"><font color="Blue">Home</font></a>
	<%}else{%>
		<h2>Oops :(</h2>
		<h2>Something went wrong. <a href="index.htm"><font color="Blue">Let's try that again</font></a></h2>
	<%}%>
</div>	