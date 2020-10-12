<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.io.File"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
File file =new File("C:/Users/Hp/Desktop/SQL/Practice-1/Practice-1.docx");
if(file.exists()){
	
	double bytes = file.length();
	double kilobytes = (bytes / 1024);
	double megabytes = (kilobytes / 1024);
	double gigabytes = (megabytes / 1024);
	double terabytes = (gigabytes / 1024);
	double petabytes = (terabytes / 1024);
	double exabytes = (petabytes / 1024);
	double zettabytes = (exabytes / 1024);
	double yottabytes = (zettabytes / 1024);
	
	out.println("bytes : " + bytes);
	out.println("kilobytes : " + kilobytes);
	out.println("megabytes : " + megabytes);
	out.println("gigabytes : " + gigabytes);
	out.println("terabytes : " + terabytes);
	
}else{
	 System.out.println("File does not exists!");
}
	
%>
</body>
</html>