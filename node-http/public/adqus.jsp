<%@page import="java.io.*"%>
<%@ page import="java.sql.*"%>  
<%@ page import="java.util.Date"%>
  
<%
	String s1="";
	String s2="";
	try { 
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inq","root","maaa"); 
	
	String Email=(String)session.getAttribute("mail"); 
	
	 s1 = request.getParameter("routine");
	 s2 = request.getParameter("myTimeStart");
		
   PreparedStatement st=con.prepareStatement("delete from query(Q_id,question,date,Email) values(?,?,?,?)");
   
	st.setString(1,Email);
    st.setString(2,s1);
	st.setString(3,s2);
	int i = st.executeUpdate();
	out.write(i);
	response.sendRedirect("history.jsp");
con.close();
}catch(Exception ex){
    ex.printStackTrace();
}
%>