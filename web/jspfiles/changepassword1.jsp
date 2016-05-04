<%-- 
    Document   : changepassword1
    Created on : Mar 12, 2015, 8:38:11 PM
    Author     : RCT-456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <style>
      a{
        text-decoration: none;
      }
      .cptab
      {
        margin:0 auto;
        margin-top: 10px;
        //alignment-adjust: middle;
        //width:350px;
        height:auto;
        //background-color:#E0E0E0;
      }
    </style>
    <script>
           $(document).ready(function() {
                $(".datepicker").datepicker({dateFormat: "mm/dd/yy", changeMonth:true,changeYear:true});        
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
              var pa="Password Correct!".fontcolor("green");
              document.getElementById("passerr").innerHTML=pa;  
            }
            else
            { 
              var cpa="Password Does Not Match!".fontcolor("red");
              document.getElementById("passerr").innerHTML=cpa;
              document.getElementById("pass").value="";
              document.getElementById("conpass").value="";
            }
          }
        </script>
  </head>
  <%
  String uid=request.getParameter("empid");
  %>
  <body>
    
    <form name="passchange" action="ChangePassword" method="POST">
    <div class="cptab">
    <table><tr><td> <lable> User ID: </lable></td><td><input type="text" name="username" value="<%=uid%>" readonly required autocomplete="off" placeholder="Username"/></td></tr>

      <tr><td> <lable>New Password:</lable></td><td><input type="password" id="pass" onchange="passw()" name="password"required autocomplete="off" placeholder="New password" /></td></tr>
      <tr><td>  <lable> Confirm New Password:</lable></td><td><input type="password" onchange="passcheck()" id="conpass" name="upassword"required autocomplete="off" placeholder="Confirm new password" /></td></tr>
<tr><td colspan="2" align="center" <lable id="passerr"></lable></td></tr>
<tr><td colspan="2" align="center" ><input type="submit" value="SUBMIT"/></td></tr></table>
    </div>
  </form>
  </body>
</html>
