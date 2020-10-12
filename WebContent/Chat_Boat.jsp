 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import= "java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>   

<html>
<head>
	<title>Chat Bot</title>
	  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
    border: 1px solid #ddd;
}
.welcome{
color:#ffffff;
		font-family:Times New Roman;
		font-size:30px;
		width: 70%;
}
.scroll
		{
			min-height: 50.5%;
			width: 70%;
			height:400px;
			overflow: scroll;
		}
		p{
		border: 1px solid #ddd;
		color:#ffffff;
		font-family:Times New Roman;
		font-size:30px;
		width: 70%;
		}
th, td {
    text-align: left;
    padding: 16px;
}

tr:nth-child(even) {
    background-color: #f2f2f2
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
		
        
        
             
         <%
     	HttpSession hs=request.getSession();
         
    
        boolean isfound=false;
			String uname=hs.getAttribute("uname").toString();
			String welcome=hs.getAttribute("welcome").toString();
			//String admin=hs.getAttribute("setadmin").toString();
         String qst=request.getParameter("ques");
        
         try{
             String getdate=java.time.LocalDate.now().toString();  
             String gettime=java.time.LocalTime.now().toString();
             
             hs.setAttribute("hsdate",getdate);
             hs.setAttribute("hstime",gettime);
             
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_bot", "root","root");
        
         Statement stm=conn.createStatement();
         ResultSet rs=stm.executeQuery("select * from words");
         while(rs.next())
         {
        		isfound=false; 
        		 String str="how many there are";
        		 String st=qst.toLowerCase();
        		if(rs.getString(2).toLowerCase().trim().contains(qst.toLowerCase()))
        		{

        		isfound=true;   
        		}
        		if(isfound){
        			 PreparedStatement prst=conn.prepareStatement("insert into chat(user,bot,uid,date,time)values(?,?,?,?,?)");
                     prst.setString(1,""+qst);
                     prst.setString(2,rs.getString(3));
                     prst.setString(3,uname);
                     prst.setString(4,getdate);
                     prst.setString(5,gettime);
                     prst.executeUpdate();
                	 hs.setAttribute("uid",rs.getString(4));
        		}else{
        			{
        	        	  PreparedStatement prst=conn.prepareStatement("insert into unrecognize(question,userid,date,time)values(?,?,?,?)");
        	             prst.setString(1,""+qst);
        	             prst.setString(2,""+uname);
        	             prst.setString(3,getdate);
        	             prst.setString(4,gettime);
        	             prst.executeUpdate();
        	            
        	        	 
        	         }
        		}
        		
                
         }
         
         }catch(Exception e){
            // out.println(""+e);
         }
         
       %>
         
      
         <center>
       
             </script>
             <a style="font-size:20px;text-decoration: none;color:#ffffff;background-color:red;" href="Login.jsp"><b>LOG OUT</b></a>
		
         <div class="welcome"><% out.println("Hello "+welcome+" You are Welcome !"); %></div>
         <p><b>CHAT BOT</b></p>
         <div class="scroll">
                  <table  border="1">
             
         <%

         try{
 			String getuid=hs.getAttribute("uname").toString();
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_bot", "root","root");
        
         Statement stm=conn.createStatement();
         ResultSet rs=stm.executeQuery("select * from chat where uid="+getuid);
         while(rs.next())
         {
        
            %>
            <tr>
                <td>
                    <b> <span style="color:#ffff00;">USER : </span>
                    
                    <span style="color:#ffffff;"><%out.println(rs.getString(1));%></span>
                    </b>
                    </td>
             </tr>

                    <tr><td>
                    <i style="color:#00ccff">BOT :  <%out.println(rs.getString(2));%> </i>
                </td>
            </tr>
                        <%
}
         }catch(Exception e){
             out.println(""+e);
         }
         
       %>
         
         </table>
         </div>
      
        
<form method="post" action="#">
			<div class="form-inline">
			<div class="form-group">
				<center><input style="width:468px;height:40px;"  type="text" class="form-control" name="ques" placeholder="ASK QUESTION ?" required>
				<input style="width:60px; height:40px; background-color:#ffffff;" type="submit" name="ask" value="ASK">
				               
				</center>
			</div>
			</div>
         </form><br/>

       &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
       &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
        <div class="col-sm-2"></div>  
	</div>
</div>
</div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="script.js"></script>

        <!-- Only used for the demos ads. Please ignore and remove. --> 
        <script src="https://cdn.tutorialzine.com/misc/enhance/v3.js" async></script>
</body>
</html>