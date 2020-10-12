<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<html lang="en">
<head>
	<title>CHAT BOT|Registration</title>
	  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body background=images/chatbg.jpg onload="noBack();">
<script>
    $(document).ready(function(){
       $(".dropdown-toggle").dropdown();
    });
</script>
<div class="panel-body">
<div class="container">
<br/><br/><br/><br/>
	<div class="row">
	<div class="col-sm-2"></div>
	
		<div class="col-sm-8">
		<div class="col-sm-3"></div>
		<div class="col-sm-2"></div>
	
			<form method="post">
			<h1 style="font-family:Times New Roman;color:#ffffff;"><center>Register Here</center></h1>
		   

            <div class="form-group"> 
                <input type="text"class="form-control" name="name" placeholder="Enter Your Name" required> 
            </div>
            
            <div class="form-group"> 
                <input type="text" class="form-control"name="contact" placeholder="Enter Your Contact" required> 
            </div> 

            <div class="form-group"> 
                <input type="email" class="form-control" name="email" placeholder="Enter your Email" required> 
            </div> 
            
             <div class="form-group"> 
                <input type="password" class="form-control" name="password" pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$" name="password" placeholder="Enter your Password" title="1 Uppercase ,1 Lower Case,1 Digit,1 Special Character,Minimum 8 Characters" placeholder="Enter your Password" required> 
            </div> 
           
                <center><input type="submit"  name="sub" value="Register"/> </center>
            
             <div class="form-group"> 
                <a style="color:#ffffff;" href="Login.jsp"><b><center>Already a Member ? Login Here</center></b></a> 
            </div> 

            </form>
            
		</div>
		<div class="col-sm-2"></div>  
	</div>
</div>
</div>

<%
String buttonclick=request.getParameter("sub");
if(buttonclick!=null){
String name=request.getParameter("name");
String contact=request.getParameter("contact");
String email=request.getParameter("email");
String password=request.getParameter("password");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_bot", "root","root");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into register(name,contact,email,password)values('"+name+"','"+contact+"','"+email+"','"+password+"')");
%>
<script>
alert("Registered Successfully");
<% response.sendRedirect("Login.jsp"); %>
</script>
<%

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
}
%>


</body>
</html>