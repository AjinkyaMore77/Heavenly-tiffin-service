<%-- 
    Document   : customerdashboard
    Created on : Feb 13, 2023, 10:48:12 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String p=(String)session.getAttribute("customername");
    out.println("<h2 align=center>Customer Dashboard</h2>");
    out.println("<p align=center><font color=red>Welcome &nbsp; "+p+"</font></p>"); 
%>
<!DOCTYPE html>
<html>
<head>
	<title>Heavenly Tiffin Service</title>
	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  </head>
<body>
<table class="table table-striped">
<tr>
    <td><a href="tiffingallery.jsp">Tiffin Gallery</a></td>
</tr>
<tr>
    <td><a href="viewcustorder.jsp">My Delivered Orders</a></td>
</tr>
<tr>
    <td><a href="pendingcustorder.jsp">My Pending Orders</a></td>
</tr>
<tr>
    <td><a href="datecustorder.jsp">Date Wise Customer Order Report</a></td>
</tr>
<tr>
    <td><a href="customersignout.jsp">Sign Out</a></td>
</tr>
</table>
</body>
</html>
