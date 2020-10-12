<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<html>
<head>
	<title>Chat Bot|Log In</title>
	  	  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body background=images/chatbg.jpg onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload="">
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
	
			<form action="Login.jsp" method="post">

			<h1 style="font-family:Times New Roman;color:#ffffff;"><center>Log In Here</center></h1>
		    <div class="form-group"> 
                <input type="text" class="form-control" id="nm" name="email" required placeholder="Enter Your Email"> 
            </div> 

            <div class="form-group"> 
                <input type="password" id="myInput" class="form-control" name="pass" required placeholder="Enter Your Password"> 
				<br/>
				<div style="color:#ffffff;"><input type="checkbox" onclick="myFunction()">&nbsp; <b>Show Password</b></div>
            <script>
				function myFunction() {
					  var x = document.getElementById("myInput");
					  if (x.type === "password") {
					    x.type = "text";
					  } else {
					    x.type = "password";
					  }
					}
            </script>
            </div> 
            <div align="right">
            <a href="Forget_Password.jsp" style="color:#ffffff;"><b><u>Forget Password</u></b></a>
            </div>
			               <center> <input type="submit" name="login" value="Log In"/> </center>
			<div class="form-group"> 
               <center> <a style="color:#ffffff;" href="Register.jsp"><b><u>Not Registered ? Register Here</u></b></a> </center>
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
                 
                 
                 HttpSession hs=request.getSession();
                 
                 boolean status=false;
                 boolean isfound=false;
                 
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_bot", "root","root");
                  Statement stm=conn.createStatement();
                 ResultSet rs=stm.executeQuery("Select * from register");
                
                 while(rs.next())
                 {
                     if(usname.contentEquals(rs.getString("email"))&&pwd.contentEquals(rs.getString("password")))
                     {
                    	 hs.setAttribute("uname",rs.getString(1));
						hs.setAttribute("welcome",rs.getString("Name"));
                            
                     isfound=true;   
                     }else{
                                          }
                 %>
          		<%
                 }
                 
                 if(isfound){
                    
                 %>
                 <script>
                     window.location="Chat_Boat.jsp";
                 </script>
                 
                 <%
                     
                 }else{

               
                 }
             }

             catch(Exception ex){
			out.print(ex);             }
				}           
             %>

</body>
</html>