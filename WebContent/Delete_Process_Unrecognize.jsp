 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<html>
<body>
<%
String qid=request.getParameter("qid");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_bot", "root", "root");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM unrecognize WHERE qid="+qid);
response.sendRedirect("Unrecognize_Update.jsp");
}
catch(Exception e)
{
out.print(e);
e.printStackTrace();
}
%> 
</body>
<script>
alert("Question Deleted Sucessfully")
window.location="Unrecognize_Update.jsp"
</script>
</html>