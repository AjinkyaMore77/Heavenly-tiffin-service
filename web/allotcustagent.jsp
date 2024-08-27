<%-- 
    Document   : allotcustagent
    Created on : Mar 13, 2023, 11:32:49 AM
    Author     : admin
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
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
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins',sans-serif;
}
body{
  height: 110vh;
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

<form action="allotcustagent.jsp" method="post">
	<br>
        <div class="row">
		<div class="col-lg-4">Date</div>
                <div class="col-lg-4"><input type="text" name="txtdate" class="form-control" value="<%=mydate%>"></div>
		<div class="col-lg-4"></div>
               
	</div>
        <br>
        
        <div class="row">
		<div class="col-lg-4">
              <%
    
    try{
         Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1","root","");
        Statement st=con.createStatement();
       // int f=0;
        ResultSet rs=st.executeQuery("select distinct(cid) from customer");
                        out.println("<select name=custid class=form-control> ");
                        while(rs.next())
                        {
                            out.println("<option >"+rs.getString(1)+"</option>");
                        }
                        out.println("</select>");
        rs.close();
        st.close();
        con.close();
    }                  
    catch(Exception e)
    {
        out.print(e);
    }
               
%> 
                </div>
                
		<div class="col-lg-4">
                    <%
    
    try{
         Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1","root","");
        Statement st=con.createStatement();
       // int f=0;
        ResultSet rs=st.executeQuery("select distinct(aid) from agent");
                        out.println("<select name=agentid class=form-control> ");
                        while(rs.next())
                        {
                            out.println("<option >"+rs.getString(1)+"</option>");
                        }
                        out.println("</select>");
        rs.close();
        st.close();
        con.close();
    }                  
    catch(Exception e)
    {
        out.print(e);
    }
               
%> 
                </div>
                <div class="button">	
                    <div class="col-lg-4"><input type="submit" name="submit" value="Search"></div>
                </div>
	</div>
</form>
<form action="insertallotagentcust.jsp" method="post">
        <br>   
<%!        ResultSet rs;
                int custid;
                String cname;
                String email;         
                String pno;
                String stat;
                String ctv;
                String pcode;
                String lsl;
                String fno;         
    %>                
<%
    String x="'"+request.getParameter("custid")+"'";
    //out.print(x);
    try{
         Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1","root","");
        Statement st=con.createStatement();
        int f=0;
        ResultSet rs=st.executeQuery("select cid,name,emailid,mobno,state,city,pincode,locality,flatno from customer where cid="+x+"");
         //out.print(q);              
        rs.next();
        custid=rs.getInt(1);
        cname=rs.getString(2);
        email=rs.getString(3);
        pno=rs.getString(4);
        stat=rs.getString(5);
        ctv=rs.getString(6);
        pcode=rs.getString(7);
        lsl=rs.getString(8);
        fno=rs.getString(9);
        rs.close();
        st.close();
        con.close();               
    }                  
    catch(Exception e)
    {
        out.print(e);
    }
%>
<%!        ResultSet rs1;
                int agentid;
                String aname;
                String aemail;         
                String apno;
                String astat;
                String actv;
                String apcode;
                String alsl;
                String afno;         
    %>                
<%
    String y="'"+request.getParameter("agentid")+"'";
    //out.print(y);
    try{
         Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hts1","root","");
        Statement st=con.createStatement();
        //int f=0;
        ResultSet rs1=st.executeQuery("select aid,name,emailid,mobno,state,city,pincode,locality,flatno from agent where aid="+y+"");             
        rs1.next();
        agentid=rs1.getInt(1);
        aname=rs1.getString(2);
        aemail=rs1.getString(3);
        apno=rs1.getString(4);
        astat=rs1.getString(5);
        actv=rs1.getString(6);
        apcode=rs1.getString(7);
        alsl=rs1.getString(8);
        afno=rs1.getString(9);
        rs1.close();
        st.close();
        con.close();               
    }                  
    catch(Exception e)
    {
        out.print(e);
    }
%>
	<div class="row">
		<div class="col-lg-4">Customer Id</div>
		<div class="col-lg-4">Customer Name</div>
		<div class="col-lg-4">email-id</div>
                
	</div>
        
	<div class="row">
		<div class="col-lg-4">
                    <input type="number" name="custidtxt" class="form-control" value="<%=custid%>" readonly>
		</div>
		<div class="col-lg-4">
			<input type="text" name="nametxt" class="form-control" value="<%=cname%>" readonly>
		</div>
		<div class="col-lg-4">
			<input type="email" name="emailtxt" class="form-control" value="<%=email%>" readonly>
		</div>
	</div>
        <div class="row">
		<div class="col-lg-4">Mobile Number</div>
		<div class="col-lg-4">State</div>
		<div class="col-lg-4">City / Town / Village</div>
	</div>
	<div class="row">
		<div class="col-lg-4">
                    <input type="text" name="phonetxt" class="form-control" value="<%=pno%>" readonly>
		</div>
		<div class="col-lg-4">
                    <input type="text" name="statetxt" class="form-control" value="<%=stat%>" readonly>
				
		</div>
		<div class="col-lg-4">
                    <input type="text" name="ctvtxt" class="form-control" value="<%=ctv%>" readonly>
		</div>	
        </div>
	<div class="row">
		<div class="col-lg-4">PIN Code</div>
		<div class="col-lg-4">Locality / Sub Locality</div>
                <div class="col-lg-4">Building No. / Flat No.</div>	
        </div>
	<div class="row">
		<div class="col-lg-4">
                    <input type="text" name="pincodetxt" class="form-control" value="<%=pcode%>" readonly>
		</div>
		<div class="col-lg-4">
                    <input type="text" name="lsltxt" class="form-control" value="<%=lsl%>" readonly>
		</div>
                <div class="col-lg-4">
                    <input type="text" name="bfnotxt" class="form-control" value="<%=fno%>" readonly>
		</div>
	</div>
        <br>
	<div class="title">Agent Details</div>
	<br>
	<div class="row">
		<div class="col-lg-4">Agent Id</div>
		<div class="col-lg-4">Agent Name</div>
		<div class="col-lg-4">email-id</div>
                
	</div>
	<div class="row">
		<div class="col-lg-4">
                    <input type="text" name="agentidtxt" class="form-control" value="<%=agentid%>" readonly>
		</div>
		<div class="col-lg-4">
			<input type="text" name="fullnametxt" class="form-control" value="<%=aname%>" readonly>
		</div>
		<div class="col-lg-4">
			<input type="emil" name="emailidtxt1" class="form-control" value="<%=aemail%>" readonly>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-4">Mobile Number</div>
		<div class="col-lg-4">State</div>
		<div class="col-lg-4">City / Town / Village</div>
	</div>
	<div class="row">
		<div class="col-lg-4">
                    <input type="text" name="mobnotxt1" class="form-control" value="<%=apno%>" readonly>
		</div>
		<div class="col-lg-4">
                    <input type="text" name="stattxt1" class="form-control" value="<%=astat%>" readonly>
				
		</div>
		<div class="col-lg-4">
                    <input type="text" name="citytxt1" class="form-control" value="<%=actv%>" readonly>
		</div>	
        </div>
	<div class="row">
		<div class="col-lg-4">PIN Code</div>
		<div class="col-lg-4">Locality / Sub Locality</div>
                <div class="col-lg-4">Building No. / Flat No.</div>	
        </div>
	<div class="row">
		<div class="col-lg-4">
                    <input type="text" name="pinctxt1" class="form-control" value="<%=apcode%>" readonly>
		</div>
		<div class="col-lg-4">
                    <input type="text" name="localitytxt1" class="form-control" value="<%=alsl%>" readonly>
		</div>
                <div class="col-lg-4">
                    <input type="text" name="flatnotxt1" class="form-control" value="<%=afno%>" readonly>
		</div>
	</div>
        <br>
	<div class="row">
		<div class="col-lg-4">
			<div class="button">
			<!--<input type="submit" name="submit" value="Allot">-->
                        <input type="submit"  name="dashboard" value="Allot">
			</div>
		</div>
                <div class="col-lg-4">
			<div class="button">
			<input type="reset" name="reset" value="Reset">
			</div>
		</div>
		<div class="col-lg-4">
			<div class="button">
				<input type="button" onclick="document.location='admindashboard.jsp'" name="dashboard" value="Dashboard">
			</div>
		</div>
</form>
</div>
</div>
</body>
</html>