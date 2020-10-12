 	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
 <%@include file="Header.jsp" %>
<html lang="en">
<head>
	<title>CHAT BOAT|ADD WORDS</title>
	  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body background=images/chatbg.jpg>
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
			<h1 style="font-family:Times New Roman;color:#ffffff;"><center>Add Word</center></h1>
		    <div class="form-group"> 
                <input type="text" class="form-control" name="word" placeholder="Enter Word" required> 
            </div> 

            <div class="form-group"> 
                <input type="text"class="form-control" name="answer" placeholder="Enter Answer" required> 
            </div> 
               <div class="form-group"> 
                <input type="text"class="form-control" name="synonym" placeholder="Enter Synonym" required> 
            </div>  
                     <br/>
                <center><input type="submit" name="sub" value="Submit"> </center>
            </form>            
		</div>
		<div class="col-sm-2"></div>  
	</div>
</div>
</div>
<%
String buttonclick=request.getParameter("sub");
if(buttonclick!=null){
String word=request.getParameter("word").toLowerCase();
String answer=request.getParameter("answer").toLowerCase();
String syn=request.getParameter("synonym").toLowerCase();

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_bot", "root","root");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into words(word,answer,synonym)values('"+word+"','"+answer+"','"+syn+"')");
%>
<script>
alert("Data Added Successfully");

</script>
<%

}
catch(Exception e)
{
out.print(e);
out.print(""+e);
e.printStackTrace();
}
}
%>
</body>
</html>