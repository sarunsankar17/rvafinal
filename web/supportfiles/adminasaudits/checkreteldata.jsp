<%-- 
    Document   : checkreteldata
    Created on : Jan 21, 2015, 8:40:44 PM
    Author     : RCT-456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="rva.dbaccess.*"%>
<!DOCTYPE html>
<%
String taskname=request.getParameter("name");
try{
  Connection con=DBConnect.startConnection();
  Statement st=con.createStatement();
  ResultSet res=st.executeQuery("SELECT * from reteltaskname where taskname LIKE '"+taskname+"' ");
  if(res.next()){
    %>
    
    <p>Task Name Already Available. Please Change Task Name.</p>
<%
  }
  else{
    %>
    <button type="submit">SAVE</button>
    <%
  }
}
catch(Exception e){
  e.printStackTrace();
}
%>
