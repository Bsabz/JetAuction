<%
		String Id = request.getParameter("Id");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String Address = request.getParameter("address");
		String Zip = request.getParameter("zip");
		String SSN = request.getParameter("ssn");
		String Phone = request.getParameter("phone");
		String Email = request.getParameter("email");
		String CreditCard = request.getParameter("credit");
		int Rating = 1;
		String Password1 = request.getParameter("Password1");
		String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
     	String mysURL = "jdbc:mysql://127.0.0.1:3306/jetauction_db"; 
     	String mysUserID = "root"; 
    	String mysPassword = "password";

			// code start here
			java.sql.Connection conn=null;
			try {
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
            			
						if(rs.next()){
							SSNstr = rs.getString("SSN");
						}
            			
        	            stmt1.close();
        	            
        				if (SSNstr.equals(SSN))
        				{
        					response.sendRedirect("RegisterPage.htm");
        				}
        				
            			
	           if (request.getParameter("target").trim().equals("Customer"))
	           {
	        	   
								stmt2.executeUpdate("insert into Person values('"+SSN+"','"+lname+"','"+fname+"','"+Address+"','"+Zip+"','"+Phone+"','"+Email+"')");
	//							out.print("insert into Student values('"+Id+"','"+Password1+"','"+Name+"','"+request.getParameter("status")+"')");
								stmt3.executeUpdate("insert into customer values('"+Rating+"','"+CreditCard+"','"+Id+"','"+SSN+"','"+Password1+"')");
	//							out.print("insert into Professor values('"+Id+"','"+Password1+"','"+Name+"','"+request.getParameter("DepID")+"')");;
								stmt2.close();
								stmt3.close();
								
								
				}
	           else{
								stmt3.executeUpdate("insert into customer values('"+Rating+"','"+CreditCard+"','"+Id+"','"+SSN+"','"+Password1+"')");
	//							out.print("insert into Professor values('"+Id+"','"+Password1+"','"+Name+"','"+request.getParameter("DepID")+"')");;
								stmt3.close();
				}
			} 
			catch(Exception e){
				e.printStackTrace();
				out.print(e.toString());
			}
			finally{
			
				try{conn.close();}catch(Exception ee){};
			}
%>

User Added!
<a href="index.htm"><font color="Blue">Home</font></a>