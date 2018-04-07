<%@ page import ="java.io.*"%>
<%@ page import="java.sql.*" %> 
<%
try { 

	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inq","root","maaa");  
	
String U_name=request.getParameter("U_name");
session.setAttribute("Name",U_name);
String Email=request.getParameter("Email") ;
session.setAttribute("mail",Email);
String Pass=request.getParameter("Pass" ) ;

String S_id=request.getParameter("hint" ) ;

   PreparedStatement st=con.prepareStatement("insert into  user_det(Email,Pass,U_name,S_id) values(?,?,?,?)");
  st.setString(1,Email);
  st.setString(2,Pass);
    st.setString(3,U_name);
	st.setString(4,S_id);
	int i=st.executeUpdate();
	//out.print(i);
	response.sendRedirect("profile.jsp");
con.close();
}catch(Exception ex){
    out.write("Unable to connect to database."+ex);
}
%>