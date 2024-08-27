<%-- 
    Document   : deletetiffin
    Created on : Feb 22, 2023, 11:19:48 PM
    Author     : admin
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    try
    {
        int tiffinid=Integer.parseInt(request.getParameter("id")) ; 
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1","root","");
        String q="delete from addtiffin where tiffinid="+tiffinid+"";
        Statement st=con.createStatement();
        st.executeUpdate(q);
        st.close();
        con.close();
        out.println(q);
        response.sendRedirect("vedtiffin.jsp");
    }
    catch(Exception e)
      {
          out.println(e);
      }
%>
