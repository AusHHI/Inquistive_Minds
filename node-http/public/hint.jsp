<%@page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%
	try { 
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inq","root","maaa"); 
	
	String Email=(String)session.getAttribute("mail"); 
	   Statement st=con.createStatement();
	    ResultSet rs;
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/bootstrap-social.css" rel="stylesheet">
		<link href="css/bootstrap-theme.min.css" rel="stylesheet">
		<link href="css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<link href="css/app.css" rel="stylesheet">
	</head>
<body>

<div class="topnav" id="myTopnav">
			    <a href="index.html">INQUISITIVE MINDS</a>
                <a href="aboutus.jsp">About Us</a>
				<a href="terms.html">Terms and Conditions</a>
				<a href="FAQs.html">FAQs</a>
				<a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
			</div>

<script>
function myFunction() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}
</script>
<div class="history1">
 <h3>Invalid Username or Password.</h3><br>
 <% rs=st.executeQuery("select S_id from user_det where Email='"+Email+"'");%>
	<%if(rs.next()){%>

 <h3>Hint provided by you is :</h3><h3 text-color="red"><strong><%=rs.getString(1)%></strong></h3><br>
 	
	<%} //if ends %>
	<a href="index.html"><strong>Try Again</strong></a>

</div>
<footer class="footerFormat">
					<div class="col-sm-12 col-xs-12">
										<a href="aboutus.jsp" style="margin-right:5px">About us</a>
										<a href="FAQs.html" style="margin-right:5px">FAQs</a>
										<a href="terms.html" >Terms&Conditions </a>
                   </br> <p align=center>© Copyright</p>
               </div>
				

    </footer>
	<% 
	con.close();
	   }
	   catch(Exception ex)
                       {
                      ex.printStackTrace();
                        }	
%>	
</body>
</html>