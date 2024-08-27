<%-- 
    Document   : rejecta
    Created on : Feb 20, 2023, 4:32:16 PM
    Author     : admin
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
    try
    {
        int aid=Integer.parseInt(request.getParameter("id"));
        out.println(aid);
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1", "root","");
        Statement st=con.createStatement();
        String query="delete from agent where aid="+aid+"";
        out.println(query);
        st.executeUpdate(query);
        st.close();
        con.close();
        response.sendRedirect("aragent.jsp");
    }
    catch(Exception e)
    {
        
    }
%>
