<%-- 
    Document   : approvec
    Created on : Feb 15, 2023, 9:06:13 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%
 try
    {
        int allid=Integer.parseInt(request.getParameter("id"));
        out.println(allid);
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1", "root","");
        Statement st=con.createStatement();
        String query="update allotment set allotflag=2 where allotmentid="+allid+"";
        out.println(query);
        st.executeUpdate(query);
        st.close();
        con.close();
        response.sendRedirect("varcustomer.jsp");
    }
    catch(Exception e)
    {
        
    }

%>
<%
 try
    {
        int cd=(Integer)session.getAttribute("cid");
        out.println(cd);
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1", "root","");
        Statement st=con.createStatement();
        String query="update ordertiffin set status=1 where cid="+cd+"";
        out.println(query);
        st.executeUpdate(query);
        st.close();
        con.close();
        response.sendRedirect("varcustomer.jsp");
    }
    catch(Exception e)
    {
        
    }

%>


