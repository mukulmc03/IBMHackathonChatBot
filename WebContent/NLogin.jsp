
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>CHAT BOT</title>
	  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
@import url('https://fonts.googleapis.com/css?family=Raleway:300,400,700');

*{
  margin: 0;
  padding: 0;
  outline: none;
  box-sizing: border-box;
  font-family: 'Raleway', sans-serif;
}

body{ 
  background: linear-gradient(to right, #71db9b, #56c6eb) }

.cont{
  position: relative;
  width: 28%;
  height: 550px;
  margin: 10px auto;
}

.main-box{ 
  width: 100%;
  height: 100%;
  text-align: center;
  background: #fff;
}

.log {
  position: relative;
  top: 20%;
  width: 100%;
  height: 75%;
  padding: 18px 15px;
}

.tear {
  position: relative;
  left: 40%;
  top: -40px;
  width: 60px;
  height: 60px;
  border: none;
  transform: rotateZ(-45deg) scale(1.2,1.2);
  background: linear-gradient(to bottom,#70d996,#59c7e8);
  border-radius:120% 0 70% 50% / 70% 0 120% 50%;
}

h2{ 
  display: block;
  text-align: center;
  color: #4fdac3;
  font-weight: 100;
  font-size: 30px;
  letter-spacing: 3px;
  margin-bottom: 50px;
}

.user, .pass{
  position: relative;
  display: block;
  width: 70%;
  height: 45px;
  border: none;
  color: #607d8b;
  margin: auto;
  text-align: center;
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 25px;
  border-bottom: 2px solid #6cd7a8;
}

input::placeholder{
  color: #607d8b;
  font-size: 20px;
  font-weight: lighter;
}

i.fa.fa-check {
  position: relative;
  top: 30px;
  right: -30%;
  z-index: 1;
  color: green;
}
.fa-user, .fa-pass{ font-size: 0; }

.login{
  color: #fff;
  cursor: pointer;
  font-size: 22px;
  font-weight: 500;
  display: block;
  margin: 10px auto;
  padding: 15px 110px;
  position: relative;
  border-radius: 30px;
  border: 2px solid #fff;
  transition: all 0.5s ease;
  background: linear-gradient(to right, #71db9b, #56c6eb);
  overflow:hidden
}

.login:hover {
  color: #71db9b;
  z-index: 2;
  border-color: #2ecc71;
}

.login:after {
  position: absolute;
  content: "";
  background: #fff;
  top: 0;
  width: 0;
  height: 100%;
  left: -19.5%;
  z-index:-1;
  transform: skew(50deg);
  transform-origin: top left;
  transition: all 0.5s ease;
}

.login:hover:after { width: 115%; }

.error   { 
  border-bottom-color: red;
  animation: error 0.5s linear 2;
}
@keyframes error{
  0%   {left: 0;}
  40%  {left: 50px;}
  80%  {left: -50px;}
  100% {left: 0;}
}
.succses { border-bottom-color: green; }

@media only screen and (min-width : 280px) {
  .cont{ width: 90% }
}

@media only screen and (min-width : 480px) {
  .cont{ width: 60% }
}

@media only screen and (min-width : 768px) {
  .cont{ width: 40% }
}

@media only screen and (min-width : 992px) {
  .cont{ width: 30% }
}
</style>
</head>
<body>
<div class="cont">
  
  <div class="main-box">
    
    <div class="log">
      
      <form action="">
        
        <div class="tear"></div>
        
        <h2>CHAT BOT USER LOGIN</h2>
        <i class="fa fa-check fa-user"></i>
        <input type="text"
               class="user"
               name="username"
               placeholder="Username"
               required />

        <i class="fa fa-check fa-pass"></i>
        <input type="password" 
               class="pass"
               name="password"
               placeholder="Password"
               required />

        <input type="submit" name="login" class="login" value="LOGIN">
      </form>
    </div>
  </div> 
</div>
<%
String str1="";String str2="";
			
				String isclick=request.getParameter("login");
				if(isclick!=null){

             try{
                 String usname=request.getParameter("username");
                 String pwd=request.getParameter("password");
                 
                 
                 HttpSession hs=request.getSession();
                 
                 boolean status=false;
                 boolean isfound=false;
                 
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_bot", "root","root");
                  Statement stm=conn.createStatement();
                 ResultSet rs=stm.executeQuery("Select * from register");
                
                 while(rs.next())
                	 
                 {
                	 str1=rs.getString("email");
                	 str2=rs.getString("password");
                     if(usname.contentEquals(str1)&&pwd.contentEquals(str2))
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
                     
                 }if(isfound=false){
                	if( usname!=str1){
                		%>
                		<script>
                		alert("Wrong Email");
                		</script>
                		<%
                	}else if(pwd!=str2){
                		
                		%>
                		<script>
                		alert("Wrong Password");
                		</script>
                		
                		<%
                	}else if(pwd!=str1&&usname!=str2){
                		%>
                		<script>
                		alert("Wrong Username and Password");
                		</script>
                		
                		<%
                	}
                 }
             }

             catch(Exception ex){
			out.print(ex);             }
				}           
             %>
<script>
$(document).ready(function () {
	  "use srict";

	  var userAttr = $(".user").attr("placeholder"),  
	      passAttr = $(".pass").attr("placeholder");

	  // Remove User Placeholder On Foucs
	  $(".user").on("focus", function () {
	    $(this).attr("placeholder"," ");
	    $(this).css({"text-align":"left"});
	  });
	  // Add User Placeholder On Blur
	  $(".user").on("blur", function () {
	    $(this).attr("placeholder",userAttr);
	    $(this).css({"text-align":"center"});
	  });

	  // Remove Pass Placeholder On Foucs
	  $(".pass").on("focus", function () {
	    $(this).attr("placeholder"," ");
	    $(this).css({"text-align":"left"});
	  });
	  
	  // Add Pass Placeholder On Blur
	  $(".pass").on("blur", function () {
	    $(this).attr("placeholder",passAttr);
	    $(this).css({"text-align":"center"});
	  });
	  
	  // Check If User Input Empty Or Not
	  $(".user").on("blur", function () {
	    var  userVal = $(".user").val();
	    
	    // If User Input Empty Add Class Error & Remove Class Succses
	    if (userVal === "") {
	      $(".fa-user").animate({
	        fontSize: '0' });
	      $(".user").removeClass("succses");
	      $(".user").addClass("error");
	    } else {
	      // If User Input Not Empty Add Class Succses & Remove Class Error
	      $(".fa-user").animate({
	        fontSize: '18px' });
	      $(".user").removeClass("error");
	      $(".user").addClass("succses");
	    }
	  });

	  $(".pass").on("blur", function () {
	    var  passVal = $(".pass").val();
	    // If User Input Empty Add Class Error & Remove Class Succses
	    if (passVal === "") {
	      $(".fa-user").animate({
	        fontSize: '0' });
	      $(".pass").removeClass("succses");
	      $(".pass").addClass("error");
	    } else {
	      // If User Input Not Empty Add Class Succses & Remove Class Error
	      $(".fa-pass").animate({
	        fontSize: '18px' });
	      $(".pass").removeClass("error");
	      $(".pass").addClass("succses");
	    }
	  });
	});
</script>
</body>
</html>