 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%
String uid=request.getParameter("uid");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_bot", "root", "root");
Statement st=conn.createStatement();
ResultSet rs=st.executeQuery("Select * from questions where uid="+uid);
while(rs.next()){
%>
<div class="panel-body">
<div class="container">
<br/><br/><br/><br/>
	<div class="row">
	<div class="col-sm-2"></div>
	
		<div class="col-sm-8">
		<div class="col-sm-3"></div>
		<div class="col-sm-2"></div>
		   
			<form method="post">
			<div class="form-group"> 
<input class="form-control" name="uid" type="text" value="<%out.println(rs.getString(1));%>">
</div>
<div class="form-group">
<input class="form-control" name="word" type="text" value="<%out.println(rs.getString(2));%>">
</div>
<div class="form-group"> 
<input class="form-control" name="answer" type="text" value="<%out.println(rs.getString(3));%>">
</div>
<div class="form-group"> 
<input class="form-control" name="synonym" type="text" value="<%out.println(rs.getString(4));%>">
</div>
		<input type="submit" name="sub" value="UPDATE">
    </form>
            
		</div>
		<div class="col-sm-2"></div>  
	</div>
</div>
</div>
<% 
}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%> 
<%
String buttonclick=request.getParameter("sub");
if(buttonclick!=null){
String word=request.getParameter("word");
String answer=request.getParameter("answer");
String synonym=request.getParameter("synonym");

try
{
	 Class.forName("com.mysql.jdbc.Driver");
     Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_bot","root","root");
 
     PreparedStatement ps=(PreparedStatement) conn.prepareStatement
   ("update questions set question=?,answer=?where uid="+uid);
     ps.setString(1,word);
     ps.setString(2,answer);
   
   
int i =ps.executeUpdate();
if(i>0)
{

response.sendRedirect("");	
}else{
response.sendRedirect("error.jsp");
}
}catch(Exception e){
	e.printStackTrace();
	
}
}
%>
</body>
<script>

</script>
</html>