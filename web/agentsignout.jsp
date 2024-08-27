<%-- 
    Document   : agentsignout
    Created on : Apr 1, 2023, 11:48:56 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate();
    response.sendRedirect("agent_login.html");
%>
