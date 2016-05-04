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
String clientname=request.getParameter("clientname");
Connection con=DBConnect.startConnection();
try{
  Statement st=con.createStatement();
  ResultSet res=st.executeQuery("SELECT * from asqaclients where asqaclientsname LIKE '"+clientname+"' ");
  if(res.next()){
    %>
    <p id="res">Value already available. Please Change the Client Name.</p>
<%
  }
  else{
    %>
    <button id="saveclient" type="submit" name="saveclient" >SAVE</button>
    <%
  }
}
catch(Exception e){
  e.printStackTrace();
}
%>

