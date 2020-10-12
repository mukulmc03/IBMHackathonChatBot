 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
 <%@include file="Header.jsp" %>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body background=images/bg.png onload="noBack();">

<%
HttpSession hs=request.getSession();
String qid=request.getParameter("qid");
String unrganw=request.getParameter("unques");
String uname=hs.getAttribute("uname").toString();
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_bot", "root", "root");
Statement st=conn.createStatement();
ResultSet rs=st.executeQuery("Select * from unrecognize where qid="+qid);

while(rs.next()){
String var=rs.getString(2);

%>
<div class="panel-body">
<div class="container">
<br/><br/><br/><br/>
	<div class="row">
	<div class="col-sm-2"></div>
	
		<div class="col-sm-8">
		<div class="col-sm-3"></div>
		<div class="col-sm-2"></div>
		   
		<form method="post" action="">
			<p style="font-size:30px;font-family:times new roman;color:#ffffff;"> <b>QUESTION :<%out.println(rs.getString(2));%></b></p>
			<div class="form-group"> 
				<input class="form-control" name="unques" type="text" placeholder="Enter Answer of Unrecognised Question.">
			</div>
			<center><input type="submit" name="sub" value="UPDATE"/></center>
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
String getdate=java.time.LocalDate.now().toString();  
String gettime=java.time.LocalTime.now().toString();

String buttonclick=request.getParameter("sub");
if(buttonclick!=null){
	String un=hs.getAttribute("uq").toString();
String ques=request.getParameter("upques");




try
{
	 Class.forName("com.mysql.jdbc.Driver");
     Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_bot","root","root");
   	String urqa=request.getParameter("unques");
     PreparedStatement prst=conn.prepareStatement("insert into chat(user,bot,uid,date,time)values(?,?,?,?,?)");
     prst.setString(1,un);
     prst.setString(2,unrganw);
     prst.setString(3,uname);
     prst.setString(4,getdate);
     prst.setString(5,gettime);
     prst.executeUpdate();
    
     Statement st=conn.createStatement();
     int i=st.executeUpdate("DELETE FROM unrecognize WHERE qid="+qid);

/*     if(i>0)
{

response.sendRedirect("Unrecognized_Questions.jsp");	
}else{
response.sendRedirect("error.jsp");
}*/
}catch(Exception e){
	e.printStackTrace();
	
}
}
%>
</body>
<script>
</script>
</html>