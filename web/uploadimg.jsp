<%-- 
    Document   : uploadimg
    Created on : Mar 4, 2023, 11:26:51 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%!
    String name;
%>
<%
    String p=(String)session.getAttribute("agentname");
    try
    {
        //specify Driver
        Class.forName("com.mysql.jdbc.Driver");
        //Establish connection
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1", "root","");
        //create statement
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select name from agent where emailid="+p+"");
        rs.next();
        name=rs.getString(1);    
        st.close();
        con.close();
    }
    catch(Exception e)
    {
        out.println(e);
    }

%>
<%!
    String fname;
%>
<%
    MultipartRequest m=new MultipartRequest(request,"E:/HeavenlyTiffinService/web/images");
   out.println("Upload successful");
   fname=m.getOriginalFileName("txtfile");
  fname="/images/"+fname;
   out.println(fname);
  
%>
<%
    fname="'"+fname+"'";
    String tt="'"+session.getAttribute("tiffintitle")+"'";
    //out.print(tt);
    String des="'"+session.getAttribute("description")+"'";
    int pr=(int)session.getAttribute("price");
    String cat="'"+session.getAttribute("category")+"'";

    try
    {
        //specify Driver
        Class.forName("com.mysql.jdbc.Driver");
        //Establish connection
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1", "root","");
        //create statement
        Statement st=con.createStatement();
        String q="insert into addtiffin(title,description,price,category,img,aid)values("+tt+","+des+","+pr+","+cat+","+fname+","+aid+")";
        st.executeUpdate(q);
        st.close();
        con.close();
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>

