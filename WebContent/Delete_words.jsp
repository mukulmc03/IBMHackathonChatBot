 	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
 <%@include file="Header.jsp" %>

<html lang="en">
<head>
	<title>CHATBOT|DELETE WORDS</title>
	  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>

thead,td{
color:#6666ff;
background-color:#ffffff;
font-family:Times New Roman;
font-size:20px;
}
</style>
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
		
	
			<form>
			<h1 style="font-family:Times New Roman;color:#ffffff;"><center>Delete Word</center></h1>
	
  <%
String tit=request.getParameter("title");
String buttonclick=request.getParameter("sub");


try
{
%>
	<center>
    <table class="table table-bordered">
    <thead style="border-width: 10; width: 250; border-color: red green blue yellow;  border-style: ridge">
   <tr>
        <th>Words</th>
        <th>Answers</th>
        <th>Synonym</th>
        <th>Action</th> 
    </tr>
    </thead>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_bot", "root","root");
Statement st=conn.createStatement();

ResultSet rs=st.executeQuery("Select * from words");
int i=0;
while(rs.next()){
%>
<tr>
        <td height="50"><%=rs.getString("word")%></td>
       <td><%=rs.getString("answer")%></td>
    <td><%=rs.getString("synonym")%></td>
  
<td><a href="Delete_Process.jsp?uid=<%=rs.getString("uid")%>">
<button type="button" class="delete">Delete</button></a></td>
</tr>

<%
}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
           </form>
            
		</div>
		<div class="col-sm-2"></div>  
	</div>
</div>
</div>

</body>
</html>