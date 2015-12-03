<%
	String username = request.getParameter("UserName");
	String firstName = request.getParameter("FirstName");
	String lastName = request.getParameter("LastName");
	
	//concat of line and line 2
	String address = request.getParameter("AddressLine1") + " " + request.getParameter("AddressLine2");
	String city = request.getParameter("City");
	String state = request.getParameter("State");
	String zip = request.getParameter("Zip");

	//make address to insert into DB
	String addressInsert = address  + " "+ city + " " + state;
	
	String phoneNumber = request.getParameter("PhoneNum");
	String email = request.getParameter("Email");
	
	String creditCard = request.getParameter("CreditCardNum");
	
	String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
	String mysURL = "jdbc:mysql://127.0.0.1:3306/jetauction_db"; 
	String mysUserID = "root"; 
	String mysPassword = "password";

	java.sql.Connection conn=null;
	
	Class.forName(mysJDBCDriver).newInstance();
	java.util.Properties sysprops=System.getProperties();
	sysprops.put("user",mysUserID);
	sysprops.put("password",mysPassword);

	//connect to the database
    conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
    System.out.println("Connected successfully to database using JConnect");
    
    java.sql.Statement preparedStatement = conn.createStatement();
    	
    String query = "UPDATE Customer, Person SET Customer.CreditCardNum = '" +creditCard + "', Person.FirstName = '" 
    	+ firstName + "', Person.LastName = '" + lastName + "', Person.Address = '" + addressInsert + "', Person.ZipCode = " 
    	+ zip + ", Person.Telephone = '" + phoneNumber + "', Person.Email = '" + email + "' WHERE Person.SSN = Customer.SSN AND Customer.customer_id = " + username;
    
    //System.out.println(query);
    
    preparedStatement.executeUpdate(query);
    
    conn.close();
	response.sendRedirect("CustomerHomePage.jsp?username=" + username);	
%>