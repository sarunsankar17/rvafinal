<%-- 
    Document   : saveasqadetails
    Created on : Jan 19, 2015, 5:01:55 PM
    Author     : RCT-456
--%>
<%@page import="rva.dbaccess.DBConnect"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String clientname=request.getParameter("clientname");

Connection con=DBConnect.startConnection();
PreparedStatement pstm=null;
try{
  pstm=con.prepareStatement("INSERT INTO asqaclients(asqaclientsname)value(?)" );
  pstm.setString(1,clientname);
  pstm.executeUpdate();
}
catch(Exception e){
  e.printStackTrace();
}
response.sendRedirect("asqaauditsupdate.jsp");
%>
  