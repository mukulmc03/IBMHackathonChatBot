<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log Out</title>
    </head>
    <body onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload=""> 
<%
HttpSession hs=request.getSession();
hs.invalidate();
session.invalidate();

response.sendRedirect("Login.jsp");
%>
    </body>
</html>
