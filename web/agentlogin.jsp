<%-- 
    Document   : agentlogin
    Created on : Feb 13, 2023, 9:45:52 PM
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
        ResultSet rs=st.executeQuery("select emailid,password from agent");
        while(rs.next())
        {
            String uu=rs.getString(1);
            String pp=rs.getString(2);
            if(u.equals(uu)&& p.equals(pp))
            {
                f=1;
                break;
            }
        }
        if(f==1)
        {
            out.println("Match");
            session.setAttribute("agentname", u);
            response.sendRedirect("agentdashboard.jsp");
        }
        else
        {
            out.println("Mismatch");
            response.sendRedirect("agent_login.html");
        }
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>
