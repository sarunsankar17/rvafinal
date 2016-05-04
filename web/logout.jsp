<%-- 
    Document   : logout
    Created on : Jan 9, 2015, 1:20:36 PM
    Author     : RCT-456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Log Out</title>
  </head>
  <body>
    <%
      session.invalidate();
   %>
   Click here to<a href="index.html">login</a>
  </body>
</html>
