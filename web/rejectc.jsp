<%-- 
    Document   : rejectc
    Created on : Feb 15, 2023, 9:12:46 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%
    try
    {
        int cid=Integer.parseInt(request.getParameter("id"));
        out.println(cid);
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1", "root","");
        Statement st=con.createStatement();
        String query="delete from customer where cid="+cid+"";
        out.println(query);
        st.executeUpdate(query);
        st.close();
        con.close();
        response.sendRedirect("arcustomer.jsp");
    }
    catch(Exception e)
    {
        
    }
%>

