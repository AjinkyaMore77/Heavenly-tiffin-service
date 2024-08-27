<%-- 
    Document   : insertordertiffin
    Created on : Mar 6, 2023, 10:54:39 AM
    Author     : admin
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
    String cdate="'"+request.getParameter("datetxt")+"'";
    int customerid=Integer.parseInt(request.getParameter("custidtxt"));
    String name="'"+request.getParameter("nametxt")+"'";
    String emailid="'"+request.getParameter("emailtxt")+"'";
    String mno="'"+request.getParameter("mobnotxt")+"'";
    String state="'"+request.getParameter("statetxt")+"'";
    String city="'"+request.getParameter("citytxt")+"'";
    String pcode="'"+request.getParameter("pincodetxt")+"'";
    String locality="'"+request.getParameter("localitytxt")+"'";
    String flatno="'"+request.getParameter("bfnotxt")+"'";
    int tiffid=Integer.parseInt(request.getParameter("tiffinidtxt"));
    String title="'"+request.getParameter("titletxt")+"'";
    String description="'"+request.getParameter("descripttxt")+"'";
    String cat="'"+request.getParameter("categorytxt")+"'";
    int tiffinprice=Integer.parseInt(request.getParameter("pricetxt"));
    int tiffinquantity=Integer.parseInt(request.getParameter("qtytxt"));
    String payment="'"+request.getParameter("payment")+"'";
    String  transacid=request.getParameter("transtxt");
    int totprice=Integer.parseInt(request.getParameter("totpricetxt"));
    try
    {
        //specify Driver
        Class.forName("com.mysql.jdbc.Driver");
        //Establish connection
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1", "root","");
        //create statement
        Statement st=con.createStatement();
        String q="insert into ordertiffin(currentdate,cid,custname,emailid,mobno,custstate,ctv,pincode,lsl,bfno,tiffinid,tifftitle,tiffdesc,tiffcategory,tiffprice,quantity,paytype,transid,totprice)values("+cdate+","+customerid+","+name+","+emailid+","+mno+","+state+","+city+","+pcode+","+locality+","+flatno+","+tiffid+","+title+","+description+","+cat+","+tiffinprice+","+tiffinquantity+","+payment+","+transacid+","+totprice+")";
      // out.println(q);
        st.executeUpdate(q);
        response.sendRedirect("tiffingallery.jsp");
        st.close();
        con.close();
    }
    catch(Exception e)
    {
        out.println(e);
    }
    out.println("Welcome"+cdate);
    out.println("Welcome"+customerid);
    out.println("Welcome"+name);
    out.println("Welcome"+emailid);
    out.println("Welcome"+mno);
    out.println("Welcome"+state);
    out.println("Welcome"+city);
    out.println("Welcome"+pcode);
    out.println("Welcome"+locality);
    out.println("Welcome"+flatno);
    out.println("Welcome"+tiffid);
    out.println("Welcome"+title);
    out.println("Welcome"+description);
    out.println("Welcome"+cat);
    out.println("Welcome"+tiffinprice);
    out.println("Welcome"+tiffinquantity);
    out.println("Welcome"+payment);
    out.println("Welcome"+transacid);
    out.println("Welcome"+totprice);
%>

