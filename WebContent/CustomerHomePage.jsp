<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
    <title>Jet Auction - Home</title>

	<script language="javascript" type="text/javascript">
	function Logout_onclick() 
	{
		var quitting = window.confirm("Do you really wish to logout?")
	
		if(quitting == true)
			window.open('index.htm','_self');
	}
	</script>

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

	<!-- All the files that are required -->
	
	<link rel="stylesheet" href="css/bootstrap.css" ></link>
	<link rel="stylesheet" href="css/bootsnip.css" ></link>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"></link>
	<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'></link>
</head>

<body style="text-align: center">
<div class="container">
	<nav>
		<input id="NewAuctionButton" type="button" style="display:inline" value="Make New Auction" onclick="window.open('NewAuction.htm','_self');" />
    	<input id="LogoutButton" type="button" style="display:inline" value="Logout" onclick="Logout_onclick();" /><br />
    	<input id="HelpButton" type="button" style="display:inline" value="Help" onclick="window.open('HelpMenu.htm','_self')" />
	</nav>
	<div class="col-lg-12 well">
	<span style="font-size: 14pt; font-family: Arial"><strong>
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
            <tr>
                <td style="vertical-align: top; width: 11237px; text-align: left; height: 454px;">
                    <span style="font-size: 10pt">
                    Welcome to Jet Auction, get started by checking out some ongoing bids or placing 
                    a few of your own.
                    <br />
                    </span>
                    <br />
                    <table border="8" id="TABLE1" onclick="return TABLE1_onclick()">
                    <tr>
                      <td style="width: 84px" align="center">
                          <span style="font-size: 10pt">
                          	Auction Name
                          </span>
                      </td>
                      <td style="width: 187px" align="center">
                          <span style="font-size: 10pt">
                          	Current high bid
                          </span>
                      </td>
                      <td style="width: 74px" align="center">
                            <span style="font-size: 10pt">
                            	Closing bid time
                            </span>
                      </td>
                      <td align="center">
                            <span style="font-size: 10pt">
                            	Thinking of putting "bid now!" button here
                            </span>
                      </td>
                    </tr>   
<%
		String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
		String mysURL = "jdbc:mysql://127.0.0.1:3306/course_reg"; 
		String mysUserID = "root"; 
		String mysPassword = "password";
        
        String stuId = ""+session.getValue("login");
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
        		java.sql.ResultSet rs = stmt1.executeQuery("select Course.CrsCode,Course.CrsName,Course.DeptID,Professor.Name,Transcript.Grade from Course, Professor,Transcript where Course.CrsCode=Transcript.CrsCode and Professor.Id=Course.InsNo and Transcript.StudId='"+stuId+"'");
      	  
      	  		String strGrade;
      	       	  
      	  		while(rs.next())
        		{
        			strGrade = rs.getString(5);
        			if(rs.getString(5).trim().equals("-1"))
      	 		 	{
      	  				strGrade = "N/A";
  	    	  		}
%>
                	<tr>
                		<td style="width: 84px">
                    		<span style="font-size: 10pt"><%=rs.getString(1)%></span></td>
                    	<td style="width: 187px">
                        	<span style="font-size: 10pt"><%=rs.getString(2)%></span></td>
                    	<td style="width: 74px">
                        	<span style="font-size: 10pt"><%=rs.getString(3)%></span></td>
                    	<td>
                        	<span style="font-size: 10pt"><%=rs.getString(4)%></span></td>
                    	<td style="width: 7px">
                        	<span style="font-size: 10pt"><%=strGrade%></span></td>
                    	<td>
                       		<% if (rs.getString(5).trim().equals("-1")) {%>
                      			<input type=button onclick="javascript:if (confirm('Are you sure that you want to delete the course?')==true){window.open('delcourse.jsp?userid=<%=stuId%>&crscode=<%=rs.getString(1)%>','_self');};return;" value="Delete">
                       		<%}%>
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
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
            </tr>
        </table>
    </strong></span>
</div>
</div>
</body>
</html>
