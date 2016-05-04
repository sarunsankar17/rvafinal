<%-- 
    Document   : asqainsert
    Created on : Jan 19, 2015, 4:14:31 PM
    Author     : RCT-456
--%>
<%@page import="rva.dbaccess.DBConnect"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
String auditname=request.getParameter("auditname");
Connection con=DBConnect.startConnection();
try{
  Statement st=con.createStatement();
  ResultSet res=st.executeQuery("SELECT * from asqaauditspt where qaauditsname LIKE '"+auditname+"' ");
  if(res.next()){
    %>
    <p id="res">Value already available. Please Change the Audit Name.</p>
<%
  }
  else{
    %>
    <br>
    <label>Performance Time in Seconds:</label><input type="text" name="perftime" autocomplete="off" required> <br><br>
    <button id="saveaudit" type="submit" name="saveaudit">SAVE</button>
    <%
  }
}
catch(Exception e){
  e.printStackTrace();
}
%>


