<%-- 
    Document   : agentpayment
    Created on : Mar 24, 2023, 10:43:46 AM
    Author     : admin
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Heavenly Tiffin Service</title>
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins',sans-serif;
}
body{
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 10px;
  background: linear-gradient(225deg,#e91e63,#03a9f4);
  /*background-image: url(custreg.jpg);
  background-size: 100% 100%;*/
}
.container{
  max-width: 800px;
  width: 100%;
  background-color: #fff ;
  padding: 15px 20px;
  border-radius: 20px;
  box-shadow: 0 5px 10px rgba(0,0,0,0.15);
}
.container .title{
  font-size: 25px;
  font-weight: 500;
  position: relative;
}
.container .title::before{
  content: "";
  position: absolute;
  left: 0;
  bottom: 0;
  height: 3px;
  width: 30px;
  border-radius: 5px;
  background: linear-gradient(225deg,#e91e63,#03a9f4);
}
form .button{
   height: 45px;
   margin: 5px 0;
 }
 form .button input{
   height: 100%;
   width: 100%;
   border-radius: 5px;
   border: none;
   color: #fff;
   font-size: 18px;
   font-weight: 500;
   letter-spacing: 1px;
   cursor: pointer;
   transition: all 0.1s ease;
   background: linear-gradient(225deg,#e91e63,#03a9f4);
 }
 form .button input:hover{
  background: linear-gradient(-225deg,#e91e63,#03a9f4);
  }
 @media(max-width: 584px){
 .container{
  max-width: 100%;
}
 }
</style>
</head>
<body>
<div class="container">
<%!
    String mydate;
%>
<%
    Date d=new Date();
    int dd=d.getDate();
    int mm=d.getMonth()+1;
    int yy=d.getYear()-100;
    String yyyy="20"+yy;
    String mydate=dd+"-"+mm+"-"+yyyy;
%>
 <%!        
                int orderid;
                int cid;
                String cname;
                String cemail;
                String cmobno;
                String tifftit;
                int qty;
                int price;
                String ptype;
                String transactionid;
                int totalprice;
                //String pincode;
               // String locality;
               // String bfno;
                
    %>
    <%
        String p=request.getParameter("id");
        //out.print(p);
        Class.forName("com.mysql.jdbc.Driver");
        Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1","root","");
        Statement st1=con1.createStatement();
        ResultSet rs1=st1.executeQuery("select * from ordertiffin where orderid="+p+"");
        rs1.next();
        orderid=rs1.getInt(1);
        cid=rs1.getInt(3);
        //out.print(cid);
        cname=rs1.getString(4);
        cemail=rs1.getString(5);
        cmobno=rs1.getString(6);
        tifftit=rs1.getString(13);
        price=rs1.getInt(16);
        qty=rs1.getInt(17);
        ptype=rs1.getString(18);
        transactionid=rs1.getString(19);
        totalprice=rs1.getInt(20);
        
        rs1.close();
        st1.close();
        con1.close();
%>
<%!
    int aid;
    String aname;
    String aeid;
    String amob;
%>
<%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1", "root","");
        Statement st=con.createStatement();
        int f=0;
        ResultSet rs=st.executeQuery("select aid,aname,aemailid,amobno from allotment where cid="+cid+"");
        rs.next();
        aid=rs.getInt(1);
        aname=rs.getString(2); 
        aeid=rs.getString(3);
        amob=rs.getString(4);
        //out.print(aname);
        rs.close();
    }
    catch(Exception e)
    {
        out.print(e);
    }
%>
<%
 try
    {
        int oid=Integer.parseInt(request.getParameter("id"));
        //out.println(oid);
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1", "root","");
        Statement st=con.createStatement();
        String query="update ordertiffin set status=2 where orderid="+oid+"";
       // out.println(query);
        st.executeUpdate(query);
        st.close();
        con.close();
        //response.sendRedirect("varcustomer.jsp");
    }
    catch(Exception e)
    {
        out.println(e);
    }

%>
<div class="title">Agent Payment</div>
<form action="insertagentpay.jsp" method="post">
    <br>
    <div class="row">
        <div class="col-lg-4">Date</div>
        <div class="col-lg-4"><input type="text" class="form-control" value="<%=mydate%>" readonly></div>
        <div class="col-lg-4"></div>
    </div>
    <div class="row">
        <div class="col-lg-4">Customer Id</div>
        <div class="col-lg-4">Customer Name</div>
        <div class="col-lg-4">Email-Id</div>
    </div>
    <div class="row">
        <div class="col-lg-4">
            <input type="text" name="cidtxt" class="form-control" value="<%=cid%>" readonly>
        </div>
        <div class="col-lg-4">
            <input type="text" name="cnametxt" class="form-control" value="<%=cname%>" readonly>
        </div>
        <div class="col-lg-4">
            <input type="text" name="cemailtxt" class="form-control" value="<%=cemail%>" readonly>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4">Mobile Number</div>
        <div class="col-lg-4">Tiffin Title</div>
        <div class="col-lg-4">Quantity</div>
    </div>
    <div class="row">
        <div class="col-lg-4">
            <input type="text" name="cmobnotxt" class="form-control" value="<%=cmobno%>" readonly>
        </div>
        <div class="col-lg-4">
            <input type="text" name="titletxt" class="form-control" value="<%=tifftit%>" readonly>
        </div>
        <div class="col-lg-4">
            <input type="text" name="quantitytxt" class="form-control" value="<%=qty%>" readonly>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4">Tiffin Price</div>
        <div class="col-lg-4">Payment Type</div>
        <div class="col-lg-4">Transaction Id</div>

    </div>
    <div class="row">
        <div class="col-lg-4">
            <input type="text" name="pricetxt" class="form-control" value="<%=price%>" readonly>
        </div>
        <div class="col-lg-4">
            <input type="text" name="paymenttxt" class="form-control" value="<%=ptype%>" readonly>
        </div>
        <div class="col-lg-4">
            <input type="text" name="transidtxt" class="form-control" value="<%=transactionid%>" readonly>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4">Total Price</div>
        <div class="col-lg-4">Agent Id</div>
        <div class="col-lg-4">Agent Name</div>
    </div>
    <div class="row">
        <div class="col-lg-4">
            <input type="text" name="totpricetxt" class="form-control" value="<%=totalprice%>" readonly>
        </div>
        <div class="col-lg-4">
            <input type="text" name="aidtxt" class="form-control" value="<%=aid%>" readonly>
        </div>
        <div class="col-lg-4">
            <input type="text" name="anametxt" class="form-control" value="<%=aname%>" readonly>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4">Agent Email-Id</div>
        <div class="col-lg-4">Mobile Number</div>
        <!--<div class="col-lg-4">Commision Cutoff</div>-->
        <div class="col-lg-4">Total Payment</div>
    </div>
    <div class="row">
        <div class="col-lg-4">
            <input type="text" name="aemailidtxt" class="form-control" value="<%=aeid%>" readonly>
        </div>
        <div class="col-lg-4">
            <input type="text" name="amobnotxt" class="form-control" value="<%=amob%>" readonly>
        </div>
        <!--<div class="col-lg-4">
            <input type="text" name="cummisioncutofftxt" class="form-control">
        </div>-->
        <div class="col-lg-4">
            <input type="text" name="totpaytxt" class="form-control">
        </div>
    </div>
    <div class="row">
        <!--<div class="col-lg-4">Total Payment</div>-->
        <div class="col-lg-4">Payment Type</div>
        <div class="col-lg-4">Transaction Id</div>
    </div>
    <div class="row">
    <!--<div class="col-lg-4">
            <input type="text" name="totpaytxt" class="form-control">
        </div>-->
        <div class="col-lg-4">
            <select class="form-control" name="paytxt">
		<option>GPay</option>
		<option>PhonePe</option>
		<option>Paytm</option>
		<option>Amazon Pay</option>
            </select>
        </div>
        <div class="col-lg-4">
            <input type="text" name="tidtxt" class="form-control">
        </div>
    </div>
    <br>
    <br>
    <div class="row">
        <div class="col-lg-6">
            <div class="button">
            <input type="submit" name="submit" value="Pay">
            </div>
        </div>
        <div class="col-lg-6">
            <div class="button">
                <input type="button" onclick="document.location='admindashboard.jsp'" name="dashboard" value="Dashboard">
            </div>
        </div>
    </div>
</form>
    </div>
</select>
</body>
</html>

 
