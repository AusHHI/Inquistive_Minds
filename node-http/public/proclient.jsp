<%@page import="java.io.*"%>
<%@ page import="java.sql.*"%>  
<%@ page import="java.util.Date"%>
  
<%
	try { 
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inq","root","maaa"); 
	
	String Email=(String)session.getAttribute("mail"); 
	
	
    out.write(Email);
	String question=request.getParameter("message-to-send");

		out.write(question);	
		PreparedStatement st=con.prepareStatement("insert into query(question,Email,date) values(?,?,?)");
   
		Date date=new Date();
		Timestamp t=new Timestamp(date.getTime());
   
		st.setString(1,question);
		st.setString(2,Email);
		st.setTimestamp(3,t);
		int i=st.executeUpdate();
		out.write(i);
		response.sendRedirect("questions.jsp");
con.close();
}catch(Exception ex){
    out.write("Unable to connect to database."+ex);
}
%>