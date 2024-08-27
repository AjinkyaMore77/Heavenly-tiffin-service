<%-- 
    Document   : viewapprovecust
    Created on : Mar 31, 2023, 1:36:38 PM
    Author     : admin
--%>

<%-- 
    Document   : custwiseorder
    Created on : Mar 31, 2023, 11:30:59 AM
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
 <form action="viewapprovedcust.jsp" method="post">
<h1>Order Delivered Details</h1>
<hr>
<br>
 </form>
<table>
    <tr class="header">
    <th>Customer Id</th>
    <th>Customer Name</th>
    <th>Email</th>
    <th>Mobile Number</th>
    <th>State</th>
    <th>City</th>
    <th>Pin code</th>
    <th>Locality/ Sub Locality</th>
    <th>Building/ Flat No.</th>
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
        //out.print(cn);
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
        ResultSet rs=st.executeQuery("select allotmentid,cid,cname,emailid,mobno,state,city,pincode,locality,flatno from allotment where aname="+an+" and allotflag=2");
        while(rs.next())
        {
            int p1=rs.getInt(1);
            out.println("<tr class=trrow>");
            out.println("<td>"+rs.getInt(2));
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
    <p align="center"> <a href="agentdashboard.jsp" class="btn btn-primary">Dashboard</a>
    </p>
 </body>
</html>



