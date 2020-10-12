<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<html>
<head>
	<title>Chat Bot|Admin Log In</title>
	  	  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body background=images/chatbg.jpg onload="noBack();">
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

			<h1 style="font-family:Times New Roman;color:#ffffff;"><center>Admin Log In Here</center></h1>
		    <div class="form-group"> 
                <input type="text" class="form-control" id="nm" name="email" required placeholder="Admin ID"> 
            </div> 

            <div class="form-group"> 
                <input type="password"class="form-control" id="ps" name="pass" required placeholder="Admin Password"> 
            </div> 
           
			               <center> <input type="submit" name="login" value="Log In"/> </center>
			<div class="form-group"> 

            </div> 

          
                       </form>
		</div>
		
		<div class="col-sm-2"></div>  
	</div>
</div>
</div>
<%
			
				String isclick=request.getParameter("login");
				if(isclick!=null){

             try{
                 String usname=request.getParameter("email");
                 String pwd=request.getParameter("pass");
                 
                     if(usname.contentEquals("admin")&&pwd.contentEquals("admin"))
                     {
                    	 
                   %>
                     <script>
                     window.location="AdminDashboard.jsp"
                 </script>
                     <% 

                     }else{
                                          }
                 %>
                <%  
             }
			catch(Exception ex){
            // out.println(""+ex.getMessage());
             ex.printStackTrace();
             }
				}           
             %>

</body>
</html>