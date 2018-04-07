<%@page import="java.io.*"%>
<%@ page import="java.sql.*"%>  
<%@ page import="java.text.SimpleDateFormat"%>  
<%@ page import="java.util.*"%>
  
<%
	String s1="";
	String s2="";
	try { 
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inq","root","maaa"); 
	String Email=(String)session.getAttribute("mail"); 
	
	SimpleDateFormat inp=new SimpleDateFormat("dd-MM-yyyy",Locale.ENGLISH);
	 java.util.Date d1=new java.util.Date();

	 s1 = request.getParameter("routine");
	 s2 = request.getParameter("myTimeStart");
	 java.util.Date daate= inp.parse(s2);
	 
	 out.println(daate);
	 int i=d1.compareTo(daate);
	 if(i!=1)
	 {
	 out.println(i);

		
	PreparedStatement st1=con.prepareStatement("insert into neww(Schedu,Email,tom) values(?,?,?)");
  
	
    st1.setString(1,s1);
    st1.setString(2,Email); 
	st1.setDate(3,new java.sql.Date(daate.getTime()));
	int x = st1.executeUpdate();

	response.sendRedirect("routine.jsp");
	}

	/* Statement st=con.createStatement();
	 ResultSet rs=st.executeQuery("select tom from neww");
	while(rs.next())
	 {
		 out.println(rs.getDate(1));
	 }*/
	 
	else
	{
		response.sendRedirect("routine.jsp");
	}
con.close();
}catch(Exception ex){
    ex.printStackTrace();
}
%>