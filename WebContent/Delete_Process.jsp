 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<html>
<body>
<%
String uid=request.getParameter("uid");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_bot", "root", "root");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM words WHERE uid="+uid);
response.sendRedirect("Delete_words.jsp");
}
catch(Exception e)
{
out.print(e);
e.printStackTrace();
}
%> 
</body>
<script>
alert("Data Deleted Sucessfully")
window.location="Delete_words.jsp"
</script>
</html>