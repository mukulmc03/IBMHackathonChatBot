=<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
String strp="";
%>
<html>
<head>
	<title>Chat Bot</title>
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
	
			<form  method="post">

			<h1 style="font-family:Times New Roman;color:#ffffff;"><center>Recover Password</center></h1>
		    <div class="form-group"> 
                <input type="text" class="form-control"  name="email" required placeholder="Enter Your Email"> 
            </div> 
			               <center> <input type="submit" name="rec" value="Show Password"/>
			            
			                </center>
		

      
          
                       </form>
		</div>
		<a href="Login.jsp"> <input type="submit" value="Go Back"/></a>
		<div class="col-sm-2"></div>  
	</div>
</div>
</div>
<%
			
				String isclick=request.getParameter("rec");
				if(isclick!=null){

             try{
                 String usname=request.getParameter("email");
                 
                 
                 boolean status=false;
                 boolean isfound=false;
                 
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_bot", "root","root");
                  Statement stm=conn.createStatement();
                 ResultSet rs=stm.executeQuery("Select * from register");
                
                 while(rs.next())
                 {
                     if(usname.contentEquals(rs.getString("email")))
                     {
                         strp=rs.getString(5);  
                     isfound=true;   
                     }
                 %>
          		<%
                 }
                 
                 if(isfound){
					out.print(""+strp);
                 %>
                 <script>
                 var val="<%=strp%>";
                     alert(val);
                 </script>
                 
                 <%
                     
                 }else{

                	 %>
                     <script>
					alert("Wrong Email ID. Try Again...");
                     </script>
                     
                     <%
                     
                 }
             }

             catch(Exception ex){
			out.print(ex);             }
				}           
             %>



</body>
</html>