<%@ page import ="java.io.*"%>
<%@ page import="java.sql.*" %> 
<%
	//String DOB=request.getParameter("DOB" ); 
String Pass1="";
	try 
	{ 
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inq","root","maaa");
		String Email=(String)session.getAttribute("mail"); 
		out.write(Email);
		//Statement st=con.createStatement();
	   //ResultSet rs;
	   
		
		PreparedStatement ps=con.prepareStatement("select Pass from user_det where Email='"+Email+"'");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			Pass1 = rs.getString(1);
			out.write(Pass1);
		}
		String pp=request.getParameter("oldPaa");
		out.write(pp);
		
		String po=request.getParameter("newPaa");
		out.write(po);
		
				if(Pass1.equalsIgnoreCase(request.getParameter("oldPaa")))
				{
					PreparedStatement updat=con.prepareStatement("update user_det set Pass=? where Email='"+Email+"'");
					out.write("h4");
					updat.setString(1,request.getParameter("newPaa"));
					out.write("h3");
					int i=updat.executeUpdate();
					response.sendRedirect("questions.jsp");
				}
				else
				{
					response.sendRedirect("profile.jsp");
				}
			
	
con.close();
}catch(Exception ex){
    ex.printStackTrace();
}
%>