<%@page import="rva.dbaccess.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="rva.userlogin.LogBean"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<html>
	<head>
	<title>Profile Personal</title>  
        <link href="cssfiles/default.css" rel="stylesheet" type="text/css">
        
        <script src="jsfiles/jquedp.js"></script>
        <script src="jsfiles/jquedpui.js"></script>
        <link rel="stylesheet" href="cssfiles/stydp.css">
        <style>
          tr{
            border:2px solid #aaa;
             background-color: aliceblue;
          }
          th:first-child{
           text-align: left;
          }
        
          
        </style>
       <script>
           $(document).ready(function() {
                $(".datepicker").datepicker({dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true});        
            });
        </script>
        </head>
<body>
	<strong>Profile Personal</strong>
       <%
       LogBean lb=(LogBean) session.getAttribute("currloginsession");
       
       try{
       String userId=null;
       String fullName=null;
       String password=null;
       String fatherName=null;
       String mailId=null;
       String address=null;
       String appDate=null;
       String dbDate=null;
       long mobNo=0;
       long ememobNo=0;
       Date dobdb=null;
       String gender=null;
       String bloodgroup=null;
       userId=lb.getUserid();
         Connection con=DBConnect.startConnection();
         Statement st=con.createStatement();
         ResultSet res=st.executeQuery("SELECT * from userprofilepersonal where username LIKE '"+userId+"' ");
         if(res.next()){
           fullName=res.getString("fullname");
           fatherName=res.getString("fathername");
           mailId=res.getString("mailid");
           address=res.getString("address");
           mobNo=res.getLong("mobno");
           ememobNo =res.getLong("emergencymobno");
           dbDate=res.getString("dob");
           gender=res.getString("gender");
           bloodgroup=res.getString("bloodgroup");
           SimpleDateFormat sdfdb=new SimpleDateFormat("yyyy-MM-dd");
           SimpleDateFormat sdfapp=new SimpleDateFormat("MM/dd/yyyy");
           dobdb=sdfdb.parse(dbDate);
           appDate=sdfapp.format(dobdb);
         }
         %>
       <table>
         <tr>
           <th>Full Name:</th><td><%=fullName%></td>
         </tr>
         <tr>
           <th>User Id:</th><td><%=userId%></td>
         </tr>
         <tr>
           <th>Father Name:</th><td><%=fatherName%></td>
         </tr>
         <tr>
           <th>Address:</th><td><textarea cols="50" rows="5" id="addedit" style="border:0;background-color: aliceblue " name="address" readOnly required autocomplete="off" placeholder="Communication Address"/><%=address%></textarea></td>
         </tr>
         <tr>
           <th>Date of Birth:</th><td><input type="text" style="border:0; background-color: aliceblue "  name="dob" required class="datepicker" disabled autocomplete="off" value='<%=appDate%>' placeholder="MM/DD/YYYY" /> </td>
         </tr>
         <tr>
           <th>Email Id:</th><td><input type="email" style="border:0; background-color: aliceblue" name="email" readonly required autocomplete="off" value='<%=mailId%>' placeholder="Email Id"></td>
          </tr>
         <tr>
           <th>Mobile Number:</th><td><input type="text" style="border:0; background-color: aliceblue" name="mobno" readonly required autocomplete="off" value='<%=mobNo%>' placeholder="Mobile Number"></td>
          </tr>
          <tr>
            <th>Emergency Contact Number:</th><td><input type="text" style="border:0; background-color: aliceblue" name="emercontnumber" readonly autocomplete="off" value='<%=ememobNo%>' placeholder="Emergency Contact Number"></td>
          </tr>
          <tr>
            <th>Blood Group:</th><td><input type="text" name="blgroup" style="border:0; background-color: aliceblue" readonly autocomplete="off" value='<%=bloodgroup%>' placeholder="Blood Group">
          </tr>
          <tr>
            <th>Gender:</th><td>
             <input name='<%=gender%>' id='<%=gender%>' style="border:0;background-color: aliceblue" required readonly value='<%=gender%>'>
              
            </td>
          </tr>
       </table>
       
       <%
       }
       catch(Exception e){
         
       }
       %>
       
       
</body>	
</html>