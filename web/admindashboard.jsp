<%-- 
    Document   : admindashboard
    Created on : Feb 13, 2023, 10:27:09 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String p=(String)session.getAttribute("adminname");
    out.println("<h2 align=center>Admin Dashboard</h2>");
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
    <td><a href="arcustomer.jsp">Approve/Reject Customer</a></td>
</tr>
<tr>
    <td><a href="aragent.jsp">Approve/Reject Agent</a></td>
</tr>
<tr>
    <td><a href="contactus.jsp">ContactUS View</a></td>
</tr>
<tr>
    <td><a href="viewcustomer.jsp">View Customer</a></td>
</tr>
<tr>
    <td><a href="viewagent.jsp">View Agent</a></td>
</tr>
<tr>
    <td><a href="allotcustagent.jsp">Alot Agent->Customer</a></td>
</tr>
<tr>
    <td><a href="custwiseorder.jsp">Customer wise Pending/Delivered Order Report</a></td>
</tr>
<tr>
    <td><a href="agentorderdetails.jsp">Pay To Agent</a></td>
</tr>
<tr>
    <td><a href="agentwiseorders.jsp">Agent-wise Order's Report</a></td>
</tr>
<tr>
    <td><a href="arbyagentreport.jsp">Approve By Agent Report</a></td>
</tr>
<tr>
    <td><a href="rejectbyagentreport.jsp">Reject By Agent Report</a></td>
</tr>
<tr>
    <td><a href="viewtiffin.jsp">View All Tiffin's</a></td>
</tr>
<tr>
    <td><a href="tiffincustreport.jsp">Tiffin Wise Customer Report</a></td>
</tr>
<tr>
    <td><a href="tiffinagentreport.jsp">Tiffin Wise Agent Report</a></td>
</tr>
<tr>
    <td><a href="adminsignout.jsp">Sign Out</a></td>
</tr>
</table>
</body>
</html>