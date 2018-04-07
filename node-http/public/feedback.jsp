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

<html lang="en" ng-app="quoraApp">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		 <meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Inquistive_Minds: Contact Us</title>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/bootstrap-theme.min.css" rel="stylesheet">
		<link href="css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<link href="css/bootstrap-social.css" rel="stylesheet">
		<link href="css/app.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
		<script src="js/angular.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</head>
<body>
	<div class="topnav" id="myTopnav">
			    <a href="index.html">INQUISITIVE MINDS</a>
                <a href="questions.jsp">Home</a>
				<a href="history.jsp">ActivityLog</a>
                <a href="profile.jsp">Profile</a>
				<a href="feedback.jsp" class="active">Contact Us</a>
				<a href="myprofile.jsp" style="float:right;margin-right:2px">
				
				
				<% rs=st.executeQuery("select U_name from user_det where Email='"+Email+"'");
				if(rs.next())
				{
				%>
				<strong>WELCOME :<%=rs.getString(1)%></strong>
				<%
				}
				else
				{
					out.write("under div3");
				}
				%>
				
				</a>
				<a href="logout.jsp" style="float:right;margin-left:2px;">Logout</a>
				<a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
				
				
				<!--% rs=st.executeQuery("select U_name from user_det where Email='"+Email+"'");
				if(rs.next())
				{
				%-->
				<strong>WELCOME :<!--%=rs.getString(1)%--></strong>
				<!--%
				}
				else
				{
					out.write("under div3");
				}
				%-->
				
				
				
				
				
				
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

	<header class="jumbotron">
	<!-- Main component for a primary marketing message or call to action -->

        <div class="container" ng-controller="ContactController">
            <div class="row">
                <div class="col-xs-12 col-sm-8">
                    <h1 style="padding-top:20px;">INQUISTIVE_MINDS</h1>
                    <p style="padding:40px;"></p>
                    <p>Curiosity is the essence of Human Existence.</p>
                </div>
                <div class="col-xs-12 col-sm-4">
					<p style="padding:20px;"></p>
                    <img src="images/second.gif" class="img-responsive">
                </div>
            </div>
        </div>
    </header>
	<div class="container">
        <div class="row">
            <div class="col-xs-12">
               <ul class="breadcrumb">
                   <li><a href="questions.jsp">Home</a></li>
				           <li><a href="profile.jsp">Profile</a></li>
                   <li class="active"><a href="feedback.jsp">Contact Us</a></li>
               </ul>
            </div>
            <div class="col-xs-12">
               <h3>Contact Us</h3>
               <hr>
            </div>
        </div>

        <div class="row row-content">
           <div class="col-xs-12">
              <h3>Location Information</h3>
           </div>
            <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                   <h5>Our Address</h5>
                    <address style="font-size: 100%">
		              Banasthali University<br>
		              Jaipur,Rajasthan<br>
		              India<br>
		              <i class="fa fa-phone"></i>: +999 1234 5678<br>
		              <i class="fa fa-fax"></i>: +999 8765 4321<br>
		              <i class="fa fa-envelope"></i>:
                        <a href="#">inquisutive@gmail.com</a>
		           </address>
            </div>
            <div class="col-xs-12 col-sm-6 col-sm-offset-1">
                <h5>Map of our Location</h5>
				  <div class="media-center media-middle">
                         <a href="mappie.html">
                      <img class="media-object img-thumbnail img-logo"
                         src="images/map.png" alt="Map">
                        </a>
                    </div>

            </div>
            <div class="col-xs-12 col-sm-11 col-sm-offset-1">
                <div class="btn-group" role="group" aria-label="...">
                    <a type="button" class="btn btn-primary" href="tel:+85212345678"><i class="fa fa-phone"></i> Call</a>
                </div>
            </div>

        <div class="row row-content" style="margin-left:10px;margin-right:10px;">
           <div class="col-xs-12">
              <h3>Send us your Feedback</h3>
           </div>
            <div class="col-xs-12 col-sm-9" ng-controller="FeedbackController">
                <form action="feedret.jsp" class="form-horizontal" role="form" name="feedbackForm" novalidate>
                    <div class="form-group" ng-class="{'has-error':feedbackForm.username.$error.required && !feedbackForm.username.$pristine}">
                      
                    <div class="form-group">
                        <label for="feedback" class="col-sm-2 control-label">Your Feedback</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="feedback" name="feedback" rows="12" ng-model="feedback.comments" required></textarea>
							<span ng-show="feedbackForm.comments.$error.required && !feedbackForm.comments.$pristine" class="help-block">Feedback is required</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10" style="padding-top:20px">
                            <button type="submit" class="btn btn-primary" ng-disabled="feedbackForm.$invalid">Send Feedback</button>
                        </div>
                    </div>
                </form>
            </div>

            </div>
       </div>
	</div>
	</div>
	<footer class="row-footer">
        <div class="container">
            <div class="row">
                <div class="col-xs-5 col-xs-offset-1 col-sm-2 col-sm-offset-1">
                    <h5>Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="aboutus.jsp">AboutUs</a></li>
                        <li><a href="faqs.html">FAQS</a></li>
                        <li><a href="terms.html">Terms and Policy</a></li>
                    </ul>
                </div>
                <div class="col-xs-6 col-sm-5">
                    <h5>Our Address</h5>
                    <address>
		              Banasthali University<br>
		              Jaipur,Rajasthan<br>
		              India<br>
					  <i class="fa fa-phone"></i>: +999 1234 5678<br>
		              <i class="fa fa-fax"></i>: +999 8765 4321<br>
		              <i class="fa fa-envelope"></i>:
                      <a href="#">inquisutive@gmail.com</a>
		           </address>
                </div>
                <div class="col-xs-12 col-sm-4">
					    <div class="nav navbar-nav" style="padding: 40px 10px;">
                        <a class="btn btn-social-icon btn-google-plus" href="http://google.com/+"><i class="fa fa-google-plus"></i></a>
                        <a class="btn btn-social-icon btn-facebook" href="http://www.facebook.com/profile.php?id="><i class="fa fa-facebook"></i></a>
                        <a class="btn btn-social-icon btn-linkedin" href="http://www.linkedin.com/in/"><i class="fa fa-linkedin"></i></a>
                        <a class="btn btn-social-icon btn-twitter" href="http://twitter.com/"><i class="fa fa-twitter"></i></a>
                        <a class="btn btn-social-icon btn-youtube" href="http://youtube.com/"><i class="fa fa-youtube"></i></a>
                        <a class="btn btn-social-icon" href="mailto:"><i class="fa fa-envelope-o"></i></a>
                    </div>

                </div>
                <div class="col-xs-12">
                    <p style="padding:10px;"></p>
                    <p align=center>© Copyright</p>
                </div>
            </div>
        </div>
    </footer>
	
<script src="js/app.js"></script>

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
