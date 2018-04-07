<%@ page import ="java.io.*"%>
<%@ page import="java.sql.*" %> 
<%
try { 

	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inq","root","maaa");
	String Email=(String)session.getAttribute("mail");
	//out.write(Email);
	
	PreparedStatement st=con.prepareStatement("count Q_id from query where Email='"+Email+"'");
	int c=st.getInt(1);
	out.write(c);

	int i=st.executeUpdate();
	out.write(i);

	response.sendRedirect("query.html");
	con.close();
	}catch(Exception ex){
		out.write("Unable to connect to database."+ex);
	}
%>