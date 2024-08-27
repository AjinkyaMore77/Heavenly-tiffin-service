<%-- 
    Document   : edittiffin
    Created on : Feb 22, 2023, 11:30:46 PM
    Author     : admin
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
  <script type="text/javascript">
        function validate(){
            var n=document.forms[0].elements[0].value;
            if (n==null || n=="")
            {
                document.getElementById("a").innerHTML="<font color=red>Enter Valid Tiffin Title</font>";
                return false;
            }
            if (!isNaN(n)) 
            {
                document.getElementById("a").innerHTML="<font color=red>Fill Text value for Tiffin Title</font>";
                return false;
            }
            var o=document.forms[0].elements[1].value;
            if (o==null || o=="")
            {
                document.getElementById("b").innerHTML="<font color=red>Enter Valid Tiffin Description</font>";
                return false;
            }
            if (!isNaN(o)) 
            {
                document.getElementById("b").innerHTML="<font color=red>Fill Text value for Tiffin Description</font>";
                return false;
            }
            var p=document.forms[0].elements[2].value;
            if (p==null || p=="")
            {
                document.getElementById("c").innerHTML="<font color=red>Enter Valid Price</font>";
                return false;
            }
            if (isNaN(p)) 
            {
                document.getElementById("c").innerHTML="<font color=red>Fill Numeric value for Price</font>";
                return false;
            }
            return true;
        }
    </script>
<style type="text/css">
  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
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
  /*background-image: url(custreg.jpg);
  background-size: 100% 100%;*/
}
.container{
  max-width: 550px;
  width: 100%;
  background-color: #fff ;
  padding: 15px 20px;
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
}
 }
</style>
</head>
<body>
    <%!        ResultSet rs;
                String title;
                String descp;
                int price;
                String cat;
                
    %>
<%   
    int tiffid=Integer.parseInt(request.getParameter("id"));
    session.setAttribute("tiffid",tiffid);
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1","root","");
        Statement st=con.createStatement();
        rs=st.executeQuery("select * from addtiffin where tiffinid="+tiffid);
        rs.next();
        title=rs.getString(2);
        descp=rs.getString(3);
        price=rs.getInt(4);
        cat=rs.getString(5); 
%>
    
    <div class="container">
<div class="title">Add Tiffin</div>
<form action="edittiffindemo.jsp" method="post" onsubmit="return validate()">
    <br>
    <div class="row">
        <div class="col-lg-12">Tiffin Title<font color="#ff0000" size="4"><sup>*</sup></font></div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <input type="text" name="titletxt" placeholder="Enter Tiffin Title" class="form-control" value="<%=title%>">
            <font size="2"><p id="a"></p></font>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">Tiffin Discription<font color="#ff0000" size="4"><sup>*</sup></font></div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <textarea rows="6" cols="6" placeholder="Enter Tiffin Description"  name="descriptiontxt" class="form-control"><%=descp%></textarea>
            <font size="2"><p id="b"></p></font>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">Price<font color="#ff0000" size="4"><sup>*</sup></font></div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <input type="text" name="pricetxt" placeholder="Enter Price" value="<%=price%>" class="form-control">
            <font size="2"><p id="c"></p></font>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">Category<font color="#ff0000" size="4"><sup>*</sup></font></div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <select class="form-control" name="category" >  
                <%
                   
                    if((cat).equals("Veg"))
                    {
                        out.print("<option selected>Veg</option>");
                        out.print("<option>Non-Veg</option>");
                    }
                    else
                    {
                        out.print("<option selected>Non-Veg</option>");
                        out.print("<option>Veg</option>");
                    }
                %>
            </select>
        </div>
    </div>
    <br>
    <!--<div class="row">
        <div class="col-lg-12">Select Tiffin Image<font color="#ff0000" size="4"><sup>*</sup></font></div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <input type="file" name="uploadimg">
        </div>
    </div>-->
    <br>
    <div class="row">
        <div class="col-lg-6">
            <div class="button">
            <input type="submit" name="submit" value="Add Tiffin">
            </div>
        </div>
        <div class="col-lg-6">
            <div class="button">
                <input type="button" onclick="document.location='agentdashboard.jsp'" name="dashboard" value="Dashboard">
            </div>
        </div>
    </div>
</form>
    </div>
</select>
</body>
</html>
