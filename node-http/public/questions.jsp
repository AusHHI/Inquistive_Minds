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
		<link href="css/que-style.css" rel="stylesheet">
	</head>
	<body background-image="/images/que.jpg">
	<div class="topnav" id="myTopnav">
			    <a href="index.html" class="active">INQUISITIVE MINDS</a>
                <a href="questions.jsp">Home</a>
				<a href="history.jsp">ActivityLog</a>
                <a href="profile.jsp">Profile</a>
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
					out.write("under div3");
				}
				%>
				
				</a>
				
				<a href="logout.jsp" style="float:right">Logout</a>
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
	<div class="container clearfix" style="color:Black">
		<div class="row">
				<div class="col-xs-12">
					 <h3>Curious? Just ask!</h3>
					 <hr>
				</div>
		</div>
				
				<div class="chat">
						<form action="proclient.jsp" method="post" id="sendMessage" class="chat-message clearfix">
							<div class="col-xs-12" style="padding: 40px 40px 40px 40px;">
								<div class="col-xs-9">
								<textarea class="que-text"  name="message-to-send" id="message-to-send" placeholder="Write your question here" required></textarea></div>
								<div class="col-xs-3">
								<input type="submit" value="Send"></input></div><br></br></div></form>
								<% rs=st.executeQuery("select question,date from query where Email<>'"+Email+"'");
								
							%>
									<%while(rs.next()){%>
								<form name="f1" action="proans.jsp" method= "post">
								
								
							
								
										<% if(rs.getString(1)!=null){
                %>
								<div class="que row col-xs-12" style= "color:black; margin: 20px 20px 20px 20px;">
								
								<ul class="list">
								
								<!--Include the question session here-->
								<li><%=rs.getDate(2)%>:<%=rs.getString(1)%></li>
								<textarea rows="1" cols="20" name="ans" id="<%=rs.getString(1)%>" placeholder="Write your answer" required></textarea>
								<button type="submit" value="<%=rs.getString(1)%>" name="answ" id="<%=rs.getString(1)%>" class="btn btn-info">Post</button>

								</ul>
								</div>
								
								<% }// if closes %>
								
						</form>
						<%} //while loop ends %>
								
								
								<!--<input onclick="document.getElementById('answer').style.display='block'"class="btn btn-warning text-right" name="answ" id="answ" type="button" value="AnswerIt"></input>-->
								
								
								
								<!--<div id="answer" class="modal">
								<div class="modal-content">
									<div class="container">
										<span onclick="document.getElementById('answer').style.display='none'" class="close text-right">&times;</span>
											<div class="modal-body">
											<!--%out.write(Q_id);%-->
											
						
											<!--div class="col-xs-12">
												<div class="col-xs-10">
													<!---upload/share files-->
												<!--/div-->
										
												
											
												
											
											

				</div>
			</div>
				
						
						
						
						<!-- end chat-message -->
				</div>
				<!-- end chat -->
		</div>
		<!-- end container -->
		
		


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
