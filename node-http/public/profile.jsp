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
<html>
    <head>
        <title>REGISTRATION PAGE</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/bootstrap-social.css" rel="stylesheet">
		<link href="css/bootstrap-theme.min.css" rel="stylesheet">
		<link href="css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<link href="css/app.css" rel="stylesheet">
		<link href="css/que-style.css" rel="stylesheet">
      </head>
      <body>
	 			<div class="topnav" id="myTopnav">
			    <a href="index.html" >INQUISITIVE MINDS</a>
                <a href="questions.jsp">Home</a>
				<a href="history.jsp">ActivityLog</a>
                <a href="profile.jsp" class="active">Profile</a>
				<a href="feedback.jsp">Contact Us</a>
				
				
				
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
					out.write("none");
				}
				%>
				
				</a>
				
				
				
				<a href="index.html" style="float:right">Logout</a>
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
	  
     <!-- <div class="row">
          <div class="col-xs-12">
             <ul class="breadcrumb">
                 <li><a href="questions.html">Home</a></li>
                 <li  class="active"><a href="profile.html">Profile</a></li>
                 <li><a href="feedback.html">Contact Us</a></li>
             </ul>
          </div>
      </div>-->
	  <div class="container text-center" style="padding-top:20px;margin-top:20px">
				
               
				<legend><p>Your General Details</p></legend>
				<label for="image">Profile Picture:</label>
				<div align="center" style="padding-bottom:20px">
					<input type="file" onchange="previewFile()"><br>
					<img height="200px" alt="Image preview..."/></input>
				</div>
				
							
									
									<!--% rs=st.executeQuery("select P_path from user_det where Email='"+Email+"'");
								
							%-->
									<!--%while(rs.next()){%-->
								
										<!--% if(rs.getString(1)!=null){
                %-->
								<!--Include the image here-->
								<!--%=rs.getString(1)%-->
						
						<!--% }
						// if closes 
						else{
							out.write("U haven't uploaded a profile photo yet");
						}
						%-->
						<!--%} //while loop ends %-->

				
				
				<form action="proret.jsp"  name="profileUpdate" method="get">
				<fieldset>
                <p><label for="name">Name:</label>
					<input type="text" id="name" name="name" placeholder="Your full name" required></input></p><br>
                <p><label for="gen">Gender:</label>
					<input type="radio" id="gen" name="Gender" value="M" required>Male</input>
					<input type ="radio" id="gen" name="Gender" value="F" required>Female</input></p><br>
                <p><label for="birth">Date of Birth:</label>
					<input type="date" name="DOB" id="birth" min="1970-12-31" max="2002-12-31"></input></p><br>
      </fieldset>
        <fieldset>
              <legend>Your Contact Information</legend>
              <br>
              <p>
                    <label for="tel">Mobile:</label>
                    <input type="tel" id="Phone" name="Phone" pattern="^\d{10}$" required></input>
              </p>
              <br>
          </fieldset>
                    <input type="submit" class="btn btn-info" value="Update">
					<!---Update Password-->
					<button onclick="document.getElementById('password').style.display='block'"class="btn btn-warning text-right" type="button">Update Password</button>
				<!--modal-->
				</form>
				<form action="Passup.jsp" name="updatePass" method="get">
				<div id="password" class="modal">
								<div class="modal-content">
									<div class="container">
										<span onclick="document.getElementById('password').style.display='none'" class="close text-right">&times;</span>
											<div class="modal-body">
											<p><label for="oldPaa">Old Password:</label>
					<input type="password" id="oldPaa" name="oldPaa" placeholder="Old Password" required></input></p><br>
					<p><label for="newPaa">New Password:</label>
					<input type="password" id="newPaa" name="newPaa" placeholder="New Password" required></input></p><br>
					<input type="submit" class="btn btn-success" value="Change_Password">
											</div>
									</div>
					
								</div>
							</div>
          
		 </div>
		 
		 <footer class="footerFormat">
				<div class="row">
					<div class="col-sm-12 col-xs-12">
						<div class="col-xs-12 col-sm-2 col-sm-offset-1">
							<h5>Links</h5>
							<ol class="list-unstyled listFormat">
										<li><a href="aboutus.jsp">About us</a></li>
										<li><a href="FAQs.html">FAQs</a></li>
										<li><a href="terms.html">Terms&Conditions </a></li>
							</ol>
						</div>
						<!--div class="col-xs-3 col-sm-5">
							<ol class="list-unstyled ">
								<li><a href="FAQs.html"></a></li>
								<li><a href="aboutus.html"></a></li>
								<li><a href="terms.html"></a></li>
					</ol>
						</div-->
						<div class="col-xs-12 col-sm-4" >
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-social-icon btn-facebook" href="http://www.facebook.com/"><i class="fa fa-facebook fa-2x"></i></a>
								<a class="btn btn-social-icon btn-twitter" href="http://twitter.com/"><i class="fa fa-twitter fa-2x"></i></a>
								<a class="btn btn-social-icon btn-whatsapp" href="http://whatsapp.com/"><i class="fa fa-whatsapp fa-2x"></i></a>
								<a class="btn btn-social-icon btn-youtube" href="http://youtube.com/"><i class="fa fa-youtube fa-2x"></i></a>
						</div></p>

					</div>
				</div>
                <div class="col-xs-12">
                   </br> <p align=center>© Copyright</p>
                </div>

    </footer>
		 
		 <script>
			function previewFile(){
				var preview = document.querySelector('img');
				var file = document.querySelector('input[type=file]').files[0];
				var reader = new FileReader();

				reader.addEventListener("load",function(){
					preview.src = reader.result;
				},false);

				if(file){
					reader.readAsDataURL(file);
				}
			}
			
		 </script>
		 
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
