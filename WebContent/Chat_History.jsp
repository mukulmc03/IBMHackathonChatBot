 	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
 <%@include file="Header.jsp" %>

<html lang="en">
<head>
	<title>Chat Bot|Chat History</title>
	  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.welcome{
		color:#6666ff;
		background-color:#ffffff;
		font-family:Times New Roman;
		font-size:30px;
		border-width: 10;
		width: 280;
		
		border-style:ridge double groove solid;
}
thead,td{
color:#6666ff;
background-color:#ffffff;
font-family:Times New Roman;
font-size:20px;
border-width: 10;
width: 280;
border-style:ridge double groove solid;
}
</style>
</head>
<body background=images/chatbg.jpg>
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

			<script>
			
			</script>
			<h1 style="font-family:Times New Roman;color:#ffffff;"><center>Chat History</center></h1>
		    <div class="form-group">
		    <input class="form-control "type="text"  name="getId" placeholder="Enter ID of User">
		    </div>
		    <center><input type="submit" name="btnId" value="See History"></center>
		    </form>
		    <br/>
		    <center>
		     <table class="table table-bordered">
		     <thead style="border-width: 10; width: 250; border-color: red green blue yellow;  border-style: ridge">

            <tr>
                 
                 <th>USER QUESTION</th>
                 <th>BOT ANSWER</th>
                 <th>DATE</th>
                 <th>TIME</th>
             </tr>
             
             </thead>
             <tbody>
         <tr>
         <%


    try{
    	String strGetId=request.getParameter("getId");
    	String btnGetId=request.getParameter("btnId");
    	    	if(btnGetId!=null){
    	
    	 Class.forName("com.mysql.jdbc.Driver");
         Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_bot","root","root");

        Statement stm=conn.createStatement();
        String joinQuery="select register.uid,register.name,register.contact,register.email,chat.user,chat.bot,chat.date,chat.time from register INNER JOIN chat ON register.uid=chat.uid where register.uid="+strGetId;
        ResultSet rs=stm.executeQuery(joinQuery);
        rs.next();
       String strname=rs.getString("name");
       String strcon=rs.getString("contact");
       String stremail=rs.getString("email");
       
       %>
       
       <div class="welcome" align="left">
      
       NAME : <%out.print(strname); %><br/><hr/>
       CONTACT : <%out.print(strcon);%><br/><hr/>
       EMAIL : <%out.print(stremail); %>
      
       </div><br/>
       <%
       
        while(rs.next())
        {
      
        
        %>

      <tr>
      
    	<td><%=rs.getString("user")%></td>
    	<td><%=rs.getString("bot")%></td>
    	<td><%=rs.getString("date")%></td>
    	<td><%=rs.getString("time")%></td>
	</tr>
        <%
        
        }
    }
    }
    catch(Exception ex){
    out.println(""+ex.getMessage());
    ex.printStackTrace();
    }

    %>
    </tbody>
         </table> 
		<input type="button" value="Clear" onClick="rref();">
				<script>
						function rref(){
                     window.location="Chat_History.jsp"
						}
                 </script>
         </center>         
            
            
		</div>
		<div class="col-sm-2"></div>  
	</div>
</div>
</div>



</body>
</html>