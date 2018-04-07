<%@ page import ="java.io.*"%>
<%@ page import="java.sql.*" %> 
<%
try { 
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inq","root","maaa");  
	ResultSet rs;
	//String valid="no";
String Email=request.getParameter("Email") ;
session.setAttribute("mail",Email);
String Pass=request.getParameter("Pass" ) ;

   Statement st=con.createStatement();
 	rs=st.executeQuery("select U_name from user_det where Email='"+Email+"' AND Pass='"+Pass+"'");
	 if(rs.next()){  
		if(U_name.equals("admin"))
		{
			response.sendRedirect("admin.jsp");
		}
		else{
				response.sendRedirect("question.jsp");
		}
	 }
	
	else{
			//request.setAttribute("Login Error: Incorrect Password");
			response.sendRedirect("hint.jsp"); 
		}
		 
con.close();

}catch(Exception ex){
    out.write("Unable to connect to database."+ex);
}
%>