<%-- 
    Document   : ordertiffin
    Created on : Mar 3, 2023, 7:58:07 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<title>Heavenly Tiffin Service</title>
	<!--<script type="text/javascript">
		function validate()
		{
			var transaction=document.forms[0].elements[14].value;
			if (transaction==null || transaction=="")
		    {
		    	document.getElementById("a").innerHTML="<font color=red>Enter Valid Transaction Id</font>";
		    	return false;
			}
			if (isNaN(transaction)) 
			{
				document.getElementById("a").innerHTML="<font color=red>Fill Numeric value for Transaction Id</font>";
		    	return false;
			}
			return true;
		}
	</script>-->
        <script type="text/javascript">
            function Calc(v)
            {
                var price =document.getElementById("price").value;
               
                var qty =document.getElementById("quantity").value;
                var total= qty * price;
                
                document.getElementById("totpricetxt").value=total;
            }
        </script>
	<style type="text/css">
 @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins',sans-serif;
}
body{
  height: 120vh;
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
  padding: 15px 30px;
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
</style>
</head>
<body>
    <%!        
                String title;
                String descp;
                int price;
                String cat;
                int tiffid;
                int cid;
                String cname;
                String eid;
                String mno;
                String state;
                String city;
                String pincode;
                String locality;
                String bfno;
                
    %>
    <%
        String p="'"+(String)session.getAttribute("customername")+"'";
        //out.print(p);
        Class.forName("com.mysql.jdbc.Driver");
        Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1","root","");
        Statement st1=con1.createStatement();
        ResultSet rs1=st1.executeQuery("select * from customer where emailid="+p+" ");
        rs1.next();
        cid=rs1.getInt(1);
        //out.print(cid);
        cname=rs1.getString(2);
        eid=rs1.getString(3);
        mno=rs1.getString(5);
        state=rs1.getString(9);
        city=rs1.getString(10);
        pincode=rs1.getString(11);
        locality=rs1.getString(12);
        bfno=rs1.getString(13);
        rs1.close();
        st1.close();
        con1.close();
    %>
<%   
        tiffid=Integer.parseInt(request.getParameter("id"));
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1","root","");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from addtiffin where tiffinid="+tiffid);
        rs.next();
        title=rs.getString(2);
        descp=rs.getString(3);
        price=rs.getInt(4);
        cat=rs.getString(5); 
        rs.close();
        st.close();
        con.close();
%>
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
<div class="title">Customer Details</div>
<form action="insertordertiffin.jsp" method="post" onsubmit="return validate()">
	<br>
        <div class="row">
		<div class="col-lg-4">Date</div>
                <div class="col-lg-4"><input type="text" name="datetxt" class="form-control" value="<%=mydate%>"></div>
		<div class="col-lg-4"></div>
	</div>
                <br>
	<div class="row">
		<div class="col-lg-4">Customer Id</div>
		<div class="col-lg-4">Customer Name</div>
		<div class="col-lg-4">email-id</div>
                
	</div>
	<div class="row">
		<div class="col-lg-4">
                    <input type="text" name="custidtxt" class="form-control" value="<%=cid%>" readonly>
		</div>
		<div class="col-lg-4">
			<input type="text" name="nametxt" class="form-control" value="<%=cname%>" readonly>
		</div>
		<div class="col-lg-4">
			<input type="emil" name="emailtxt" class="form-control" value="<%=eid%>" required readonly>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-4">Mobile Number</div>
		<div class="col-lg-4">State</div>
		<div class="col-lg-4">City / Town / Village</div>
	</div>
	<div class="row">
		<div class="col-lg-4">
			<input type="text" name="mobnotxt" class="form-control" value="<%=mno%>" readonly>
		</div>
                <div class="col-lg-4">
			<input type="text" name="statetxt" class="form-control" value="<%=state%>" readonly>
		</div>
                <div class="col-lg-4">
			<input type="text" name="citytxt" class="form-control" value="<%=city%>" readonly>
		</div>
	</div>
        <div class="row">
		<div class="col-lg-4">PIN Code</div>
		<div class="col-lg-4">Locality / Sub Locality</div>
		<div class="col-lg-4">Building No. / Flat No.</div>
	</div>     
        <div class="row">
		<div class="col-lg-4">
			<input type="text" name="pincodetxt" class="form-control" value="<%=pincode%>" readonly>
		</div>
                <div class="col-lg-4">
			<input type="text" name="localitytxt" class="form-control" value="<%=locality%>" readonly>
		</div>
                <div class="col-lg-4">
			<input type="text" name="bfnotxt" class="form-control" value="<%=bfno%>" readonly>
		</div>
	</div>        
	<div class="title">Tiffin Details</div>
	<br>
	<div class="row">
		<div class="col-lg-4">Tiffin Id</div>
		<div class="col-lg-4">Tiffin Title</div>
		<div class="col-lg-4">Description</div>
	</div>
	<div class="row">
		<div class="col-lg-4">
                    <input type="text" name="tiffinidtxt" class="form-control" value="<%=tiffid%>" readonly>
		</div>
		<div class="col-lg-4">
                    <input type="text" name="titletxt" class="form-control" value="<%=title%>" readonly>
		</div>
		<div class="col-lg-4">
			<textarea rows="4" cols="4"name="descripttxt" class="form-control" readonly><%=descp%></textarea>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-4">Category</div>
		<div class="col-lg-4">Price</div>
                <div class="col-lg-4">Quantity</div>
		<!--<div class="col-lg-4">Tiffin Image</div>-->
	</div>
	<div class="row">
		<div class="col-lg-4">
                    <input type="text" name="categorytxt" class="form-control" name="category" value="<%=cat%>" readonly>
		</div>
		<div class="col-lg-4">
                    <input type="number" name="pricetxt" class="form-control" id="price" onchange="Calc(this);" value="<%=price%>" readonly>
		</div>
                <div class="col-lg-4">
                    <input type="number" name="qtytxt" class="form-control" id="quantity" onchange="Calc(this);">
		</div>
		<!--<div class="col-lg-4">
		</div>-->
	</div>
	<div class="title">Payment Details</div>
	<br>
	<div class="row">
		<div class="col-lg-4">Payment Type<font color="#ff0000" size="4"><sup>*</sup></font></div>
		<div class="col-lg-4">Transaction Id<font color="#ff0000" size="4"><sup>*</sup></font></div>
		<div class="col-lg-4">Total Price</div>
	</div>
	<div class="row">
		<div class="col-lg-4">
			<select class="form-control" name="payment">
				<option>GPay</option>
				<option>PhonePe</option>
				<option>Paytm</option>
				<option>Amazon Pay</option>
			</select>
		</div>
		<div class="col-lg-4">
			<input type="text" name="transtxt" placeholder="Enter Transaction Id" class="form-control">
			<!--<font size="2"><p id="a"></p></font>-->
		</div>
		<div class="col-lg-4">
			<input type="number" id="totpricetxt" name="totpricetxt" class="form-control" readonly>
		</div>
	</div>
	<span><font size="3" color="#e91e63">&copy;All Kinds of payment accepted on 8999213780</font></span>
	<div class="row">
		<div class="col-lg-6">
			<div class="button">
			<input type="submit" name="submit" value="Submit">
			</div>
		</div>
		<div class="col-lg-6">
			<div class="button">
				<input type="button" onclick="document.location='customerdashboard.jsp'" name="dashboard" value="Dashboard">
			</div>
		</div>
</form>
</div>
</div>
</body>
</html>
