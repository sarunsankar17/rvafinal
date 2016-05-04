<%-- 
    Document   : unchecking
    Created on : Sep 8, 2014, 11:12:10 PM
    Author     : RCT-456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="rva.dbaccess.DBConnect"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Username checking</title>
  </head>
  <body>
    <%
      String userName=(String) request.getParameter("username");
      Connection con=DBConnect.startConnection();
      try
      {
        Statement st=con.createStatement();
        ResultSet res=st.executeQuery("SELECT * FROM userprofilepersonal WHERE fullname = '"+userName+"'");
        if(res.next())
        {%>
        
        <input type="text" name="fullname" required autocomplete="off" id="namecheck" onchange="uncheck()" placeholder="Fullname" autofocus/>
        <font color="red"/>
        <p>Name Already Exist. Please Change Name!</p></font>
        </font>
       <% }
        else
        {%>
         <input type="text" name="fullname" required autocomplete="off" value="<%=userName%>" id="namecheck" onchange="uncheck()" placeholder="Fullname" autofocus/>
        <font color="green"/>
        <p>Name Available</p>
       </font>
       <% }
      }
      catch(Exception e)
      {
        System.out.println(e);
      }
      %>
  </body>
</html>
