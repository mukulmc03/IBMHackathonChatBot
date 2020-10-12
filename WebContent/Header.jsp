<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>CHAT BOT|DASHBOARD</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="Login.jsp">CHAT BOT</a>
    </div>
    <ul class="nav navbar-nav">
    
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">WORDS<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="Add_Words.jsp">ADD WORDS</a></li>
          <li><a href="Words_Update.jsp">UPDATE WORDS</a></li>
          <li><a href="Delete_words.jsp">DELETE WORDS</a></li>
          <li><a href="View_Words.jsp">VIEW ADDED</a></li>
        </ul>
      </li>

      <li class="active"><a href="Unrecognize_Update.jsp">UNRECOGNIZED QUESTIONS</a></li>
      <li class="active"><a href="Users.jsp">USERS</a></li>
      <li class="active"><a href="Chat_History.jsp">CHAT HISTORY</a></li>
    </ul>
  </div>
</nav>

</body>
</html>