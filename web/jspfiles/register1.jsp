<%-- 
    Document   : register
    Created on : Jun 5, 2014, 4:53:22 AM
    Author     : RCT-456
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.regex.*"%>
<%@page import="rva.dbaccess.DBConnect"%>
<%@page import="java.text.*"%>
<%@page import="rva.userlogin.*"%>
<%
try{
  Connection con=DBConnect.startConnection();
  Statement st=con.createStatement();
  ResultSet res=null;
  PreparedStatement pstm=null;
  String username=null;
  String result=null;
  /*String defval="KPR";
  DecimalFormat dc=new DecimalFormat("0000");
  //st.executeUpdate("DELETE from userprofilepersonal where fullname is NULL");
  res=st.executeQuery("SELECT username FROM `userprofilepersonal` order by profileid desc limit 1 ");
  while(res.next()){
    username=res.getString("username");
  }
  Pattern p=Pattern.compile("\\d+");
  Matcher m=p.matcher(username);
  while(m.find()){
   result=defval.concat(dc.format(Integer.parseInt(m.group())+1));
  }
  pstm=con.prepareStatement("Insert into userprofilepersonal(username) values(?)");
  pstm.setString(1, result);
  pstm.executeUpdate();
  session.setAttribute("curusername", result);*/
  %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link href="cssfiles/regcss.css" rel="stylesheet" type="text/css"/>
        <script src="jsfiles/jquedp.js"></script>
        <script src="jsfiles/jquedpui.js"></script>
        <link rel="stylesheet" href="cssfiles/stydp.css">
        
       <script>
           $(document).ready(function() {
             $(".datepicker").datepicker({
            dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,maxDate: new Date(),defaultDate:new Date(),minDate:new Date(1970,00,01)
            });        
            });
        </script>
        <script>
          function passw()
          {
            var newpass="";
            document.getElementById("conpass").value=newpass;
           
              document.getElementById("passerr").innerHTML="";
            //alert("asgklsf");
          }
          </script>
        <script>
          function passcheck()
          {
            var p=document.getElementById("pass").value;
            //alert(p);
            var cp=document.getElementById("conpass").value;
            if(p==cp)
            {
              var pa="Password correct".fontcolor("green");
              document.getElementById("passerr").innerHTML=pa;  
            }
            else
            { 
              var cpa="Password does not match".fontcolor("red");
              document.getElementById("passerr").innerHTML=cpa;
              document.getElementById("pass").value="";
              document.getElementById("conpass").value="";
            }
          }
        </script>
        <script>
          $(document).ready(function(){
            $("#doj").datepicker({
          dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true,maxDate: new Date(),defaultDate:new Date(),minDate:new Date(1995,00,01)
            });
          });
            </script>
        <script>
          function uncheck()
          {
           var xmlhttp;
           var uname=document.getElementById("namecheck").value;
           if(uname=="")
           {
             //document.getElementById("unres").innerHTML="";
             alert("Please Enter Employee Name!");
           }
           else
           {
            if(window.XMLHttpRequest)
            {
              xmlhttp=new XMLHttpRequest();
            }
            else
            {
              xmlhttp=new ActiveXObject(Microsoft.XMLHTTP);
            }
            xmlhttp.onreadystatechange=function() 
            {
              if(xmlhttp.readyState==4&&xmlhttp.status==200)
              {
                document.getElementById("unres").innerHTML=xmlhttp.responseText;
              }
            }
            xmlhttp.open("GET","supportfiles/uncheck/unchecking.jsp?username="+uname,true);
            xmlhttp.send();
          }
        }
          </script> 
        </head>
    <body>
      
      <%
  UserInfo uinfo=new UserInfo();
      ArrayList<String> lrvaprojects=uinfo.getrvaprojects();
      ArrayList<String> ldesignation=new ArrayList<String>();
      ldesignation=uinfo.getDesignation();
      //lrvaprojects=uinfo.getrvaprojects();
      %>
      <div class="regform">
      
      <h1 align="center">Create Account</h1>
      <form class="form1" id="registerform" action="Registration" method="POST">
     
        <p>Full Name:</p> 
        <div id="unres">
        <input type="text" name="fullname" required autocomplete="off" id="namecheck" onchange="uncheck()" placeholder="Fullname" autofocus/>
        </div>
        <!--<p> User ID: </p><input type="text" name="username" id="uid" value="" required  autocomplete="off" disabled placeholder="Username"/>-->
        
        <p> Password:</p><input type="password" id="pass" onchange="passw()" name="password" required autocomplete="off" placeholder="Password" />
        <p> Confirm Password:</p><input type="password" onchange="passcheck()" id="conpass" name="upassword" required autocomplete="off" placeholder="Confirm Password" />
        <p id="passerr"></p>
        <p>Father's Name:</p> 
        <input type="text" name="fathername" required autocomplete="off" placeholder="Father's Name" >
        <p> Date of Birth:</p><input type="text" name="dob" required class="datepicker" autocomplete="off" placeholder="MM/DD/YYYY" />
        <p>Address:</p> 
        <textarea rows="4" cols="33" name="address" required placeholder="Communication Address"></textarea>
        <p> Mail Address:</p><input type="email" name="umail" required autocomplete="off" placeholder="Mailid" >
        <p> Mobile Number:</p><input type="text" name="umobno" required autocomplete="off" placeholder="Mobile No" > 
        <p> Emergency Contact Number:</p><input type="text" name="uemobno" required autocomplete="off" placeholder="Emergency Contact No" > 
        <p> Blood Group</p><input type="text" name="bgroup" required autocomplete="off" placeholder="Blood Group" >
        <p> Gender:</p>
        <div class="inrad"><input id="radmal" type="radio" name="ugender" value="Male" required><label>Male</label>
          <input type="radio" id="radfmal" name="ugender" value="Female" required><label>Female</label><br></div>
        <p>Marital Status:</p>
        <select name="marstatus" required>
          <option value="">-select-</option>
          <option value="Married">Married</option>
          <option value="Unmarried">Unmarried</option>
        </select>
        <p>Date of Join:</p>
        <input type="text" class="datepicker" id="doj" name="doj" class="datepicker" required autocomplete="off" placeholder="MM/DD/YYYY">
        <p>Department:</p>
        <input type="text" name="department" value="KPO" required autocomplete="off" placeholder="Department" readonly>
        <p>Team:</p>
        <input type="text" name="team" value="RVA" required autocomplete="off" placeholder="Team">
        <p>Dedicated Project:</p>
        <select name="dedicatedproj" id="dedicatedproject">
          <option value="" selected>-select-</option>
          <%for(int i=0;i<lrvaprojects.size();i++){%>
            <option value="<%=lrvaprojects.get(i)%>"><%=lrvaprojects.get(i)%></option>
         <% }%>
        </select>
        <p>KPO Employee Id:</p>
        <input type="text" name="kpoid" autocomplete="off" placeholder="Employee Id">
        <p>Designation:</p>
        <select name="designation" required id="designation">
          <option value="" selected>-select-</option>
          <%for(int i=0;i<ldesignation.size();i++){%>
          <option value="<%=ldesignation.get(i)%>"><%=ldesignation.get(i)%></option>
          <%}%>
        </select>
        <p>User Access Level:</p>
        <select name="acclevel" required > 
        <option value="">-select-</option>
        <option value="Auditor">Auditor</option>
        <option value="QAAuditor">QA Auditor</option>
        <option value="Manager">Manager</option>
        </select>
        <input name="submit" id="submit" tabindex="5" value="Create Account" type="submit"> 
        </form>
      </div>
     </body>
</html>
<%}
catch(Exception e){
  e.printStackTrace();
}%>