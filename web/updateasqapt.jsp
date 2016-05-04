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
String auditname=request.getParameter("auditname");
float pt=Float.parseFloat(request.getParameter("perftime"));

Connection con=DBConnect.startConnection();
PreparedStatement pstm=null;
try{
  Statement st=con.createStatement();
  st.executeUpdate("UPDATE asqaauditspt SET asqaauditspt="+pt+" where qaauditsname LIKE '"+auditname +"' ");
}
catch(Exception e){
  e.printStackTrace();
}
response.sendRedirect("asqaauditsupdate.jsp");
%>
  