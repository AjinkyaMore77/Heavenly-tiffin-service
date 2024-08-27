<%-- 
    Document   : adminsignout
    Created on : Apr 1, 2023, 11:46:36 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate();
    response.sendRedirect("admin_login.html");
%>