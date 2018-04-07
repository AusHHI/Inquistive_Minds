<%@ page import ="java.io.*"%>
<%@ page import="java.sql.*" %> 
<%
 String Phone=request.getParameter("Phone" ) ;
String Gender=request.getParameter("Gender" ) ;
String DOB=request.getParameter("DOB" ); 



out.write("h1");

try { 
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inq","root","maaa");
     String Email=(String)session.getAttribute("mail"); 
     out.write(Email);
	 out.write("h2");
	
//out.write(Address);


	PreparedStatement updat=con.prepareStatement("update user_det set Phone=?,Gender=?,DOB=? where Email='"+Email+"'");
	updat.setString(1,Phone);
	updat.setString(2,Gender);
	updat.setString(3,DOB);
	
	out.write("h3");

	
	//updat.setString(4,Address);

	int i=updat.executeUpdate();
	out.write(i);
	
	out.write("h4");


	response.sendRedirect("questions.jsp");
con.close();
}catch(Exception ex){
    ex.printStackTrace();
}
%>