<%-- 
    Document   : agentrecievepay
    Created on : Mar 27, 2023, 10:49:05 AM
    Author     : admin
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
	top: 50%;
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
 <h1>My Payment</h1>
<hr>
<table>
    <tr class="header">
    <th>Agent Name</th>
    <th>Customer Id</th>
    <th>Customer Name</th>
    <th>Email-Id</th>
    <th>Mobile Number</th>
    <th>Tiffin Title</th>
    <th>Quantity</th>
    <th>Tiffin Price</th>
    <th>Customer Payment type</th>
    <th>Customer Transaction Id</th>
    <th>My Payment</th>
    <th>Payment Type</th>
    <th>Transaction Id</th>
    </tr>
<%! 
    String an;
%>
<%
    String p=(String)session.getAttribute("agentname");
    p="'"+p+"'";
    //out.print(p);
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1", "root","");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select name from agent where emailid="+p+" ");
        rs.next();
         an=rs.getString(1);
    }
    catch(Exception e)
    {
        out.print(e);
    }
   //out.print(an);
%>
<%
    an="'"+an+"'";
try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1", "root","");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select paymentid,aname,cid,cname,cemail,cmobno,tiffintitle,tiffinqty,tiffinprice,paytype,catransid,totalpayment,apaytype,atransid from agentpayment where aname="+an+"");
        while(rs.next())
        {
            int p1=rs.getInt(1);
            out.println("<tr class=trrow>");
            out.println("<td>"+rs.getString(2));
            out.println("<td>"+rs.getInt(3));
            out.println("<td>"+rs.getString(4));
            out.println("<td>"+rs.getString(5));
            out.println("<td>"+rs.getString(6));
            out.println("<td>"+rs.getString(7));
            out.println("<td>"+rs.getInt(8));
            out.println("<td>"+rs.getInt(9));
            out.println("<td>"+rs.getString(10));
            out.println("<td>"+rs.getString(11));
            out.println("<td>"+rs.getInt(12));
            out.println("<td>"+rs.getString(13));
            out.println("<td>"+rs.getString(14));
        }
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>
</table>
    <p align="center"> <a href="agentdashboard.jsp" class="btn btn-primary">Dashboard</a>
    </p>
 </body>
</html>


