<%-- 
    Document   : edittiffindemo
    Created on : Feb 24, 2023, 3:57:50 PM
    Author     : admin
--%>

<%@page session="true" contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
    <%
      //int tiffid=Integer.parseInt(request.getParameter("id"));
      int tiffid=(int)session.getAttribute("tiffid");
      String b=request.getParameter("titletxt");
      String c=request.getParameter("descriptiontxt");
      int d=Integer.parseInt(request.getParameter("pricetxt"));
      String e=request.getParameter("category");
      try 
      {        
          Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1","root","");
          PreparedStatement ps=con.prepareStatement("update addtiffin set title=?,description=?,price=?,category=?where tiffinid=?");
          ps.setString(1, b);
          ps.setString(2, c);
          ps.setInt(3,d);
          ps.setString(4, e);
          
          ps.setInt(5,tiffid);
          ps.executeUpdate();
          response.sendRedirect("vedtiffin.jsp");
        }
        catch (Exception e1) 
        {
            out.println(e1);
        }
    %>
    </body>
</html>
