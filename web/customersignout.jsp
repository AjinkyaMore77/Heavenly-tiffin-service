<%-- 
    Document   : customersignout
    Created on : Apr 1, 2023, 11:50:34 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate();
    response.sendRedirect("customer_login.html");
%>