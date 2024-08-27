<%-- 
    Document   : customerlogin
    Created on : Feb 13, 2023, 9:07:32 PM
    Author     : admin
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
    try
    {
        String u=request.getParameter("usertxt");
        String p=request.getParameter("passwordtxt");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1", "root","");
        Statement st=con.createStatement();
        int f=0;
        ResultSet rs=st.executeQuery("select emailid,password,cflag from customer");
        while(rs.next())
        {
            String uu=rs.getString(1);
            String pp=rs.getString(2);
            int flag=rs.getInt(3);
            if(u.equals(uu)&& p.equals(pp)&& flag!=0)
            {
                f=1;
                break;
            }
        }
        if(f==1)
        {
            out.println("Match");
            session.setAttribute("customername", u);
            response.sendRedirect("customerdashboard.jsp");
        }
        else
        {
            out.println("Mismatch");
            response.sendRedirect("customer_login.html");
        }
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>
