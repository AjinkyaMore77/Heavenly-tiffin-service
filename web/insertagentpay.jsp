<%-- 
    Document   : insertagentpay
    Created on : Mar 26, 2023, 11:02:51 PM
    Author     : admin
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
    int custid=Integer.parseInt(request.getParameter("cidtxt"));
    String custname="'"+request.getParameter("cnametxt")+"'";
    String custemailid="'"+request.getParameter("cemailtxt")+"'";
    String custmno="'"+request.getParameter("cmobnotxt")+"'";
    String tifftitle="'"+request.getParameter("titletxt")+"'";
    int tiffqty=Integer.parseInt(request.getParameter("quantitytxt"));
    int tiffprice=Integer.parseInt(request.getParameter("pricetxt"));
    String paytype="'"+request.getParameter("paymenttxt")+"'";
    String ctransid="'"+request.getParameter("transidtxt")+"'";
    int totprice=Integer.parseInt(request.getParameter("totpricetxt"));
    int agentid=Integer.parseInt(request.getParameter("aidtxt"));
    String aname="'"+request.getParameter("anametxt")+"'";
    String aemailid="'"+request.getParameter("aemailidtxt")+"'";
    String amno="'"+request.getParameter("amobnotxt")+"'";
    int totpayment=Integer.parseInt(request.getParameter("totpaytxt"));
    String adpaytype="'"+request.getParameter("paytxt")+"'";
    String adtransid="'"+request.getParameter("tidtxt")+"'";
    
    try
    {
        //specify Driver
        Class.forName("com.mysql.jdbc.Driver");
        //Establish connection
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1", "root","");
        //create statement
        Statement st=con.createStatement();
        String q="insert into agentpayment(cid,cname,cemail,cmobno,tiffintitle,tiffinqty,tiffinprice,paytype,catransid,totalprice,aid,aname,aemail,amobno,totalpayment,apaytype,atransid)values("+custid+","+custname+","+custemailid+","+custmno+","+tifftitle+","+tiffqty+","+tiffprice+","+paytype+","+ctransid+","+totprice+","+agentid+","+aname+","+aemailid+","+amno+","+totpayment+","+adpaytype+","+adtransid+")";
        st.executeUpdate(q);
        response.sendRedirect("agentorderdetails.jsp");
        st.close();
        con.close();
    }
    catch(Exception e)
    {
        out.println(e);
    }
    /*out.println(custid);
    out.println(custname);
    out.println(custemailid);
    out.println(custmno);
    out.println(tifftitle);
    out.println(tiffqty);
    out.println(paytype);
    out.println(ctransid);
    out.println(totprice);
    out.println(agentid);
    out.println(aname);
    out.println(amno);
    out.println(totpayment);
    out.println(adpaytype);
    out.println(adtransid);*/
%>


