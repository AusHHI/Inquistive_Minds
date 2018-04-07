<%@page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%
	try { 
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inq","root","maaa"); 
 
	   Statement st=con.createStatement();
	   ResultSet rs;
%>
<!DOCTYPE html>
<html lang="en" ng-app="quoraApp">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/myApp.js"></script>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/bootstrap-social.css" rel="stylesheet">
		<link href="css/bootstrap-theme.min.css" rel="stylesheet">
		<link href="css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<link href="css/app.css" rel="stylesheet">
	</head>
<body>

<div class="topnav" id="myTopnav">
			    <a href="index.html" >INQUISITIVE MINDS</a>
                <a href="aboutus.jsp" class="active">About Us</a>
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

<h2> ABOUT US</h2><br>
<div class="col-xs-12">
					 <div id="mycarousel" class="carousel slide" data-ride="carousel">
												 <!-- Indicators -->
							 <ol class="carousel-indicators">
									 <li data-target="#mycarousel" data-slide-to="0" class="active"></li>
									 <li data-target="#mycarousel" data-slide-to="1"></li>
									 <li data-target="#mycarousel" data-slide-to="2"></li>
							 </ol>

										 <!-- Wrapper for slides -->
							 <div class="carousel-inner" role="listbox">
									 <div class="item active">
											 <img class="img-responsive img-logo-1"
												src="images/tph.jpg" alt="first">
											 <div class="carousel-caption">
											 <h1>Query Users</h1>
											<p class="ex3">Register yourself and satiate your curiosity.<p>
											 </div>
							 </div>
									 <div class="item">
												<img class="img-responsive img-logo-1"
												src="images/four.gif" alt="second">
											 <div class="carousel-caption">
					                       <h1>Reply Users</h1>
										<p class="ex3">Do ample amount of BrainStorming and answer others queries.</p>
											 </div>
									 </div>
									 <div class="item">
												<img class="img-responsive img-logo-1"
												src="images/download.jpg" alt="third">
										<div class="carousel-caption">
											 <h1>Features</h1>
											 <p class="ex3">Also upload pdfs, doc files or ppts in reference to your answers.Comment or like others answer.</p>
									     </div>
									</div>
							 </div>
							 </div>

					 </div>

					<div style= "background-color:antiquewhite ; margin-left:20%; margin-right:20% ; margin-top:23%">
					
					<% rs=st.executeQuery("select feedback,U_name from user_det");
							%>
										<h1 class="ex1 text-center"> Reviews of our user.</h1>
										 <%while(rs.next()){
										
											 %>
											 <%if(rs.getString(1)!=null){%>
											<div class="row ex1 text-center" style="padding : 3px 3px 3px 3px">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star-half"></i>
											
										<!--Do ample amount of BrainStorming and answer others queries.-->
										<strong><%=rs.getString(1)%></strong>:
										<strong><%=rs.getString(2)%></strong></div>
											 <%
											 }
											 %>
						<%} //while loop ends %>
					
					</div>

<p class="ex1" style= "background-color:#D3D3D3; margin-left:20%; margin-right:20% ;padding : 5px 5px 5px 5px ;">
     <strong>Inquisitive Minds<strong> offers you an amazing platform to put forth your queries, dilemmas and confusion and resolve them.
	 It also offers a stage to showcase your knowledge and help others with your skills.<br>

     Inquisitive minds mission is to empower organizations by connecting them with the information they need to make better-informed decisions.
     Whether you need to know the answer to a burning question, or you're bursting with knowledgeable answers and experiences you can't wait to share,
	 Inquisitive minds will provide you with the answers you are looking for.
	 You might be looking for a factual answer or you might be looking for other people's experiences to help you - we aim to provide both.<br><br>
     <b>One Great Collective Updatable Answer - The Opinions Of Many - All in One Place</b>
</p>

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
