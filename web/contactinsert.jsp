<%-- 
    Document   : contactinsert
    Created on : Feb 18, 2023, 4:17:29 PM
    Author     : admin
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
    String fname="'"+request.getParameter("fnametxt")+"'";
    String lname="'"+request.getParameter("lnametxt")+"'";
    String email="'"+request.getParameter("emailtxt")+"'";
    String mno="'"+request.getParameter("mnotxt")+"'";
    String message="'"+request.getParameter("msgtxt")+"'";
    try
    {
        //specify Driver
        Class.forName("com.mysql.jdbc.Driver");
        //Establish connection
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1", "root","");
        //create statement
        Statement st=con.createStatement();
        String q="insert into contactus(fname,lname,emailid,mno,msg)values("+fname+","+lname+","+email+","+mno+","+message+")";
        st.executeUpdate(q);
        st.close();
        con.close();
    }
    catch(Exception e)
    {
        out.println(e);
    }
    /*out.println("Welcome"+fname);
    out.println("Welcome"+lname);
    out.println("Welcome"+email);
    out.println("Welcome"+mno);
    out.println("Welcome"+message);*/
%>
