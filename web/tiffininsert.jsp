<%-- 
    Document   : tiffininsert
    Created on : Feb 22, 2023, 9:35:49 PM
    Author     : admin
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
//    String tiffintitle=request.getParameter("titletxt");
//    String description=request.getParameter("descriptiontxt");
//    int price=Integer.parseInt(request.getParameter("pricetxt"));
//    String category=request.getParameter("category");
//    session.setAttribute("tiffintitle",tiffintitle);
//    session.setAttribute("description",description);
//    session.setAttribute("price",price);
//    session.setAttribute("category",category);
    
    
%>
<!--<html>
    <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Heavenly Tiffin Service</title>
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style type="text/css">
/*  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins',sans-serif;
}
body{
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 10px;
  background: linear-gradient(225deg,#e91e63,#03a9f4);
  background-image: url(custreg.jpg);
  background-size: 100% 100%;
}
.container{
  max-width: 400px;
  width: 100%;
  background-color: #fff ;
  padding: 15px 30px;
  border-radius: 20px;
  box-shadow: 0 5px 10px rgba(0,0,0,0.15);
}
.container .title{
  font-size: 25px;
  font-weight: 500;
  position: relative;
}
.container .title::before{
  content: "";
  position: absolute;
  left: 0;
  bottom: 0;
  height: 3px;
  width: 30px;
  border-radius: 5px;
  background: linear-gradient(225deg,#e91e63,#03a9f4);
}
form .button{
   height: 45px;
   margin: 5px 0;
 }
 form .button input{
   height: 100%;
   width: 100%;
   border-radius: 5px;
   border: none;
   color: #fff;
   font-size: 18px;
   font-weight: 500;
   letter-spacing: 1px;
   cursor: pointer;
   transition: all 0.1s ease;
   background: linear-gradient(225deg,#e91e63,#03a9f4);
 }
 form .button input:hover{
  background: linear-gradient(-225deg,#e91e63,#03a9f4);
  }
 @media(max-width: 584px){
 .container{
  max-width: 100%;
}*/
  
 </style>
<!--</head>
    <body>
        <div class="container">
       <div class="title">Select Tiffin Image</div>
       <br>
       <form action="uploadimg.jsp" method="post" enctype="multipart/form-data">
        <div class="row">
        <div class="col-lg-12">Upload Tiffin Image<font color="#ff0000" size="4"><sup>*</sup></font></div>
    </div>
    
    <div class="row">
        <div class="col-lg-12">
            <input type="file" id="selectfile" name="txtfile" class="form-control">
        </div>
    </div>
    <br>
   <div class="row">
	<div class="col-lg-4">
            <div class="button">
		<input type="submit" name="submit" value="Submit">
            </div>
	</div>
   </div>
 </form>
 </body>
</html>-->




<%!
    String name;
    int aid;
%>
<%
    String p="'"+session.getAttribute("agentname")+"'";
    try
    {
        //specify Driver
        Class.forName("com.mysql.jdbc.Driver");
        //Establish connection
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1", "root","");
        //create statement
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select aid,name from agent where emailid="+p+"");
        rs.next();
        aid=rs.getInt(1);    
        name=rs.getString(2);
        out.print(aid+""+ name);
        
        st.close();
        con.close();
    }
    catch(Exception e)
    {
        out.println(e);
    }

%>

<%
    
//    String tt="'"+session.getAttribute("tiffintitle")+"'";
//    //out.print(tt);
//    String des="'"+session.getAttribute("description")+"'";
//    int pr=(int)session.getAttribute("price");
//    String cat="'"+session.getAttribute("category")+"'";
    name="'"+name+"'";
    String tt="'"+request.getParameter("titletxt")+"'";
    String des="'"+request.getParameter("descriptiontxt")+"'";
    int pr=Integer.parseInt(request.getParameter("pricetxt"));
    String cat="'"+request.getParameter("category")+"'";
    try
    {
        //specify Driver
        Class.forName("com.mysql.jdbc.Driver");
        //Establish connection
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1", "root","");
        //create statement
        Statement st=con.createStatement();
        String q="insert into addtiffin(title,description,price,category,aid,aname)values("+tt+","+des+","+pr+","+cat+","+aid+","+name+")";
        st.executeUpdate(q);
        response.sendRedirect("agentdashboard.jsp");
        st.close();
        con.close();
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>
