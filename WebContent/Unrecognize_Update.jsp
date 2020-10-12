 	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
 <%@include file="Header.jsp" %>

<html lang="en">
<head>
	<title>Chat Bot|Unrecognized Questions</title>
	  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
th,td{
color:#ffffff;
font-family:Times New Roman;
font-size:20px;
}
</style>
</head>
<body background=images/chatbg.jpg onload="noBack();">
<div class="panel-body">
<div class="container">
<br/><br/><br/><br/>
	<div class="row">
	<div class="col-sm-2"></div>
	
		<div class="col-sm-8">
		<div class="col-sm-3"></div>
		<div class="col-sm-2"></div>
	
			<form>
			<h1 style="font-family:Times New Roman;color:#ffffff;"><center>UNRECOGNIZED QUESTION</center></h1>
	
  <%
  HttpSession hs=request.getSession();
  
  
	String buttonclick=request.getParameter("sub");
try
{
%>
	<center>
    <table class="table table-bordered">
     <tr>
        
        <th>UN-RECOGNIZED QUESTION</th>
        <th>USER ID</th>
        <th>DATE</th>
        <th>TIME</th>
     	<th>ACTION</th>
     	<th>DELETE</th>
    </tr>
    
<%

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_bot", "root","root");
Statement st=conn.createStatement();

ResultSet rs=st.executeQuery("Select * from unrecognize");
int i=0;

while(rs.next()){

%>
<tr>
        
       <td height="50"><%=rs.getString("question")%></td>
    <td><%=rs.getString("userid")%></td>
    <td><%=rs.getString("date")%></td>
    <td><%=rs.getString("time")%></td>
<td><a href="Unrecognize_Update_Process.jsp?qid=<%=rs.getString("qid")%>">
<button style="background-color:#00ff00;color:#ffffff;" type="button">Give Answer</button></a></td>

<td><a href="Delete_Process_Unrecognize.jsp?qid=<%=rs.getString("qid")%>">
<button style="background-color:#ff0000;color:#ffffff;" type="button" class="delete">Delete</button></a></td>
</tr>
                    	 
<%
hs.setAttribute("uq",rs.getString("question"));
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