<%-- 
    Document   : agentinsert
    Created on : Feb 13, 2023, 8:29:38 PM
    Author     : admin
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
    String fname="'"+request.getParameter("fullnametxt")+"'";
    String email="'"+request.getParameter("emailtxt")+"'";
    String pass="'"+request.getParameter("passwordtxt")+"'";
    String mno="'"+request.getParameter("phonetxt")+"'";
    String ano="'"+request.getParameter("anotxt")+"'";
    String dob="'"+request.getParameter("dobtxt")+"'";
    String gender="'"+request.getParameter("gendertxt")+"'";
    String state="'"+request.getParameter("statetxt")+"'";
    //String district="'"+request.getParameter("districttxt")+"'";
    String ctv="'"+request.getParameter("ctvtxt")+"'";
    String pincode="'"+request.getParameter("pincodetxt")+"'";
    String locality="'"+request.getParameter("lsltxt")+"'";
    //String road="'"+request.getParameter("rstxt")+"'";
    //String pbname="'"+request.getParameter("pbtxt")+"'";
    String bfno="'"+request.getParameter("bfnotxt")+"'";
    String ptype="'"+request.getParameter("payment")+"'";
    String transacid="'"+request.getParameter("transtxt")+"'";
    int regcharge=Integer.parseInt(request.getParameter("Regischargetxt"));
    try
    {
        //specify Driver
        Class.forName("com.mysql.jdbc.Driver");
        //Establish connection
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1", "root","");
        //create statement
        Statement st=con.createStatement();
        String q="insert into agent(name,emailid,password,mobno,aadharno,dob,gender,state,city,pincode,locality,flatno,paytype,transid,regcharges)values("+fname+","+email+","+pass+","+mno+","+ano+","+dob+","+gender+","+state+","+ctv+","+pincode+","+locality+","+bfno+","+ptype+","+transacid+","+regcharge+")";
        st.executeUpdate(q);
        response.sendRedirect("agent_login.html");
        st.close();
        con.close();
    }
    catch(Exception e)
    {
        out.println(e);
    }
    /*out.println("Welcome"+fname);
    out.println("Welcome"+email);
    out.println("Welcome"+pass);
    out.println("Welcome"+mno);
    out.println("Welcome"+ano);
    out.println("Welcome"+dob);
    out.println("Welcome"+gender);
    out.println("Welcome"+state);
    //out.println("Welcome"+district);
    out.println("Welcome"+ctv);
    out.println("Welcome"+pincode);
    out.println("Welcome"+locality);
    //out.println("Welcome"+road);
    //out.println("Welcome"+pbname);
    out.println("Welcome"+bfno);
    out.println("Welcome"+ptype);
    out.println("Welcome"+transacid);
    out.println("<br>Your Fees is "+regcharge);*/
%>

