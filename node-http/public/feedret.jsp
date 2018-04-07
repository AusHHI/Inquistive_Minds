<%@ page import ="java.io.*"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.Date"%>
<%
try { 

	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inq","root","maaa");
	String Email=(String)session.getAttribute("mail");
	String feedback=request.getParameter("feedback");
	PreparedStatement st=con.prepareStatement("update user_det set feedback=?,date=? where Email='"+Email+"'");
	
	
   Date date=new Date();
   Timestamp t=new Timestamp(date.getTime());
  
  
   st.setString(1,feedback);
   
	st.setTimestamp(2,t);
	
	int i=st.executeUpdate();

	response.sendRedirect("questions.jsp");
	con.close();
	}catch(Exception ex){
		ex.printStackTrace();
	}
%>