<%-- 
    Document   : tiffinagentreport
    Created on : Apr 1, 2023, 1:09:29 PM
    Author     : admin
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style type="text/css">
      @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&display=swap');
      body
      {
	padding: 0;
	margin: 0;
	font-family: 'Poppins',sans-serif;
      }
      table
      {
	position: absolute;
	left: 50%;
	top: 60%;
	transform: translate(-50%, -50%);
	border-collapse: collapse;
	width: 1425px;
	height: 200px;
	border: 1px solid #bdc3c7;
	box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.2), -1px -1px 8px rgba(0, 0, 0, 0.2);
       }
       tr
       {
	transition: all 0.2s ease-in;
	cursor: pointer;
       }
       th,td
       {
        padding: 12px;
	text-align: left;
	border-bottom: 1px solid #ddd;
       }
       .header
       {
	background: linear-gradient(225deg,#e91e63,#03a9f4);/*#16a085*/
	color: #fff;
       }
       h1
       {
	font-weight: 600;
	text-align: center;
	background: linear-gradient(225deg,#e91e63,#03a9f4);/*#16a085*/
	color: #fff;
	padding: 10px 0px;
       }
       .trrow:hover
       {
	background-color: #f5f5f5;
	transform: scale(1.02);
	box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.2), -1px -1px 8px rgba(0, 0, 0, 0.2);
       }
  </style>
 </head>
 <body>
 <form action="tiffinagentreport.jsp" method="post">
<h1>Tiffin wise Agent Report</h1>
<hr>
<br>
    <div class="row">
        <div class="col-lg-5"></div>
        <div class="col-lg-2" align="center"><h4>Tiffin title</h4></div>
        <div class="col-lg-5"></div>
    </div>
<br>
    <div class="row">
        <div class="col-lg-3"></div>
        <div class="col-lg-2" align="center"></div>
	<div class="col-lg-2">
              <%
    
    try{
         Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1","root","");
        Statement st=con.createStatement();
       // int f=0;
        ResultSet rs=st.executeQuery("select distinct(title) from addtiffin");
                        out.println("<select name=tifftitle class=form-control> ");
                        while(rs.next())
                        {
                            out.println("<option >"+rs.getString(1)+"</option>");
                            
                        }
                        out.println("</select>");
        rs.close();
        st.close();
        con.close();
    }                  
    catch(Exception e)
    {
        out.print(e);
    }
               
%> 
<%!
    String aname;
%>
<%
    String tiff="'"+request.getParameter("tifftitle")+"'";
try
    {
       Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1","root","");
        Statement st=con.createStatement();
       // int f=0;
        ResultSet rs=st.executeQuery("select aname from addtiffin where title="+tiff+" ");
        rs.next();
        aname=rs.getString(1);
        rs.close();
        st.close();
        con.close();
    }                  
    catch(Exception e)
    {
        out.print(e);
    }
    %>
<br>
<div class="col-lg-5"></div>
<br>
<div class="row">
    <div class="col-lg-3"></div>
    <div class="col-lg-2">
        <div class="button">	
            <input type="submit" name="submit" value="Search" class="btn btn-success">
        </div>
    </div>
    <div class="col-lg-2"></div>
    <div class="col-lg-2"><a href="admindashboard.jsp" class="btn btn-primary">Dashboard</a></div>
    <div class="col-lg-3"></div>
</div>
</form>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<table>
    <tr class="header">
    <th>Agent Id</th>
    <th>Agent Name</th>
    <th>Email-Id</th>
    <th>Mobile Number</th>
    <th>Aadhar Number</th>
    <th>State</th>
    <th>City / Town / Village</th>
    <th>Pin code</th>
    <th>Locality / sub Locality</th>
    <th>Flat No. / Building No.</th>
    </tr>
<%
   aname="'"+aname+"'";
  // out.print(aname);
try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1", "root","");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select aid,name,emailid,mobno,aadharno,state,city,pincode,locality,flatno from agent where name="+aname+"");
        while(rs.next())
        {
            int p=rs.getInt(1);
            out.println("<tr class=trrow>");
            out.println("<td>"+p);
            out.println("<td>"+rs.getString(2));
            out.println("<td>"+rs.getString(3));
            out.println("<td>"+rs.getString(4));
            out.println("<td>"+rs.getString(5));
            out.println("<td>"+rs.getString(6));
            out.println("<td>"+rs.getString(7));
            out.println("<td>"+rs.getString(8));
            out.println("<td>"+rs.getString(9));
            out.println("<td>"+rs.getString(10));
        }
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>
</table>
<!--    <p align="center"> <a href="admindashboard.jsp" class="btn btn-primary">Dashboard</a>
    </p>-->
 </body>
</html>




