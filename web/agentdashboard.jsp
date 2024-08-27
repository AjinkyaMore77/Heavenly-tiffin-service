<%-- 
    Document   : agentdashboard
    Created on : Feb 13, 2023, 10:45:05 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String p=(String)session.getAttribute("agentname");
    out.println("<h2 align=center>Agent Dashboard</h2>");
    out.println("<p align=center><font color=red>Welcome &nbsp; "+p+"</font></p>");
%>
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
    <td><a href="addtiffin.html">Add Tiffin</a></td>
</tr>
<tr>
    <td><a href="vedtiffin.jsp">View / Edit / Delete Tiffin</a></td>
</tr>
<tr>
    <td><a href="varcustomer.jsp">Approve/Reject Customer</a></td>
</tr>
<tr>
    <td><a href="viewapprovecust.jsp">Approved Customers</a></td>
</tr>
<tr>
    <td><a href="viewrejectcust.jsp">Rejected Customers</a></td>
</tr>
<tr>
    <td><a href="agentrecievepay.jsp">My payment</a></td>
</tr>
<tr>
    <td><a href="agentsignout.jsp">Sign Out</a></td>
</tr>
</table>
</body>
</html>
