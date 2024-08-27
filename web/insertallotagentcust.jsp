<%-- 
    Document   : insertallotagentcust
    Created on : Mar 14, 2023, 8:25:18 AM
    Author     : admin
--%>
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
     try
     {
    int customerid=Integer.parseInt(request.getParameter("custidtxt"));
    String name="'"+request.getParameter("nametxt")+"'";
    String emailid="'"+request.getParameter("emailtxt")+"'";
    String pno="'"+request.getParameter("phonetxt")+"'";
    String state="'"+request.getParameter("statetxt")+"'";
    String ctv="'"+request.getParameter("ctvtxt")+"'";
    String pincode="'"+request.getParameter("pincodetxt")+"'";
    String lsl="'"+request.getParameter("lsltxt")+"'";
    String bfno="'"+request.getParameter("bfnotxt")+"'";
    int agentid=Integer.parseInt(request.getParameter("agentidtxt"));
    String fname="'"+request.getParameter("fullnametxt")+"'";
    String email="'"+request.getParameter("emailidtxt1")+"'";
    String mno="'"+request.getParameter("mobnotxt1")+"'";
    String stat="'"+request.getParameter("stattxt1")+"'";
    String city="'"+request.getParameter("citytxt1")+"'";
    String pcode="'"+request.getParameter("pinctxt1")+"'";
    String locality="'"+request.getParameter("localitytxt1")+"'";
    String flatno="'"+request.getParameter("flatnotxt1")+"'";
     
   
   
        //specify Driver
        Class.forName("com.mysql.jdbc.Driver");
        //Establish connection
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1", "root","");
        //create statement
        Statement st=con.createStatement();
        String q="insert into allotment(cid,cname,emailid,mobno,state,city,pincode,locality,flatno,aid,aname,aemailid,amobno,astate,ctv,apincode,lsl,bfno,allotflag)values("+customerid+","+name+","+emailid+","+pno+","+state+","+ctv+","+pincode+","+lsl+","+bfno+","+agentid+","+fname+","+email+","+mno+","+stat+","+city+","+pcode+","+locality+","+flatno+",1)";
      //out.println(q);
        st.executeUpdate(q);
        response.sendRedirect("admindashboard.jsp");
        st.close();
        con.close();
    }
    catch(Exception e)
    {
        out.println(e);
    }
    
%>
   

