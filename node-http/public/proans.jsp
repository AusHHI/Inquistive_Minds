<%@page import="java.io.*"%>
<%@ page import="java.sql.*"%>    
<%
	try { 
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inq","root","maaa"); 
	
	ResultSet rs1;
	Statement st1;
	 st1=con.createStatement();
	 
	String Email=(String)session.getAttribute("mail");  
	
			String question=request.getParameter("answ");	
			//out.write(question);
	String ans=request.getParameter("ans");
			//out.write(ans);
	if(ans!=null)
	{
		PreparedStatement st2=con.prepareStatement("insert into answer(ans,Email,question) values(?,?,?)");
		st2.setString(1,ans);
		st2.setString(2,Email);
		st2.setString(3,question);
		int i=st2.executeUpdate();
		//out.write("hii");
		response.sendRedirect("questions.jsp");
	}
	else
	{
		alert("Please put a valid Answer");
		response.sendRedirect("questions.jsp");
	}

	 con.close();
}catch(Exception ex){
	ex.printStackTrace();
}
%>