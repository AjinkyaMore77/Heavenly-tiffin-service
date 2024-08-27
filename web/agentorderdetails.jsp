<%-- 
    Document   : agentorderdetails
    Created on : Mar 24, 2023, 11:00:39 AM
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
<h1>Agent Order List</h1>
<hr>
<br>
<table>
    <tr class="header">
    <th>Order Id</th>
    <th>Customer Id</th>
    <th>Customer Name</th>
    <th>Email-Id</th>
    <th>Mobile Number</th>
    <th>Tiffin Title</th>
    <th>Quantity</th>
    <th>Tiffin Price</th>
    <th>Payment type</th>
    <th>Transaction id</th>
    <th>Total Price</th>
    <th>Pay To Agent</th>
    </tr>
<%
try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1", "root","");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select orderid,cid,custname,emailid,mobno,tifftitle,quantity,tiffprice,paytype,transid,totprice,status from ordertiffin where status=1");
        while(rs.next())
        {
            int p=rs.getInt(1);
            out.println("<tr class=trrow>");
            out.println("<td>"+p);
            out.println("<td>"+rs.getInt(2));
            out.println("<td>"+rs.getString(3));
            out.println("<td>"+rs.getString(4));
            out.println("<td>"+rs.getString(5));
            out.println("<td>"+rs.getString(6));
            out.println("<td>"+rs.getInt(7));
            out.println("<td>"+rs.getInt(8));
            out.println("<td>"+rs.getString(9));
            out.println("<td>"+rs.getString(10));
            out.println("<td>"+rs.getInt(11));
            out.println("<td><a href=agentpayment.jsp?id="+p+">Pay Now</a>");
        }
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>
</table>
    <p align="center"> <a href="admindashboard.jsp" class="btn btn-primary">Dashboard</a>
    </p>
 </body>
</html>

