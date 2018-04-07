<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<!--%@ page import="javax.servlet.ServletException"%-->
<!--%@ page import="javax.servlet.annotation.MultipartConfig"%-->
<!--%@ page import="javax.servlet.annotation.WebServlet"%-->
<!--%@ page import="javax.servlet.http.*"%-->
<!--%@ page import="javax.servlet.http.MultipartConfig"%-->
<!--%@ page import="javax.servlet.http.httpRequest"%-->
<!--%@ page import="javax.servlet.http.httpResponse"%-->
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<%@ include file="getcon.jsp"%> <!-- to connect a database-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
    out.println("hii");
    String Email=(String)session.getAttribute("mail"); 
     out.println(Email);
try
{
String ImageFile="";
String itemName = "";
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if (!isMultipart)
{
}
else
{
FileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);
List items = null;
try
{
items = upload.parseRequest(request);
System.out.println("items are "+items);
}
catch (FileUploadException e)
{
e.getMessage();
}
 
Iterator itr = items.iterator();
while (itr.hasNext())
{
FileItem item = (FileItem) itr.next();
if (item.isFormField())
{
String name = item.getFieldName();
String value = item.getString();
System.out.println("hello there!!!!"+name+"\t"+value);

if(name.equals("pic"))
{
ImageFile=value;
System.out.println(ImageFile+"::");
}
 
}
else
{
try
{
itemName = item.getName();
System.out.println("here is"+itemName);
File savedFile = new File
("F:"+File.separator+"Chatting"+File.separator+"public"+File.separator+"imagess"+File.separator+itemName);
//File savedFile = new File("D:"+File.separator+"imgs"+File.separator+itemName);
System.out.println("here we go "+savedFile);
item.write(savedFile);

}
catch (Exception e)
{
out.println("Error"+e.getMessage());
}
}
}
try
{
	
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inq","root","maaa"); 
	Statement st=con.createStatement();
	st.executeUpdate("update user_det set P_path='"+itemName+"'  where Email="+Email+""); 
	con.close(); 
}
catch(Exception el)
{
out.println("Inserting error"+el.getMessage());
}
}
}
catch (Exception e){
out.println(e.getMessage());
}
%>
    </body>
</html>
