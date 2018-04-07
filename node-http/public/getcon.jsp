<%@ page import ="java.io.*"%>
<%@ page import="java.sql.*" %> 
<%
try { 

	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inq","root","maaa"); 
	Statement st=con.createStatement();
con.close();
}catch(Exception ex){
    out.write("Unable to connect to database."+ex);
}
%>