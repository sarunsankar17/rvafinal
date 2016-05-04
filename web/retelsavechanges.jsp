<%-- 
    Document   : retelsavechanges
    Created on : Jan 21, 2015, 8:55:23 PM
    Author     : RCT-456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="rva.dbaccess.*"%>
<%
String process=(String) session.getAttribute("process");
String taskname=request.getParameter("taskname");
try{
  Connection con=DBConnect.startConnection();
  Statement st=con.createStatement();
  PreparedStatement pstm=null;
  if(process.equalsIgnoreCase("insert")){
    pstm=con.prepareStatement("INSERT INTO reteltaskname(taskname) values(?)");
    pstm.setString(1,taskname);
    pstm.executeUpdate();
  }
  else if(process.equalsIgnoreCase("update")){
    String tasknameold=(String)session.getAttribute("oldtaskname");
    st.executeUpdate("UPDATE reteltaskname set taskname = '"+taskname+"' where taskname LIKE '"+tasknameold+"' ");
  }
  
}
catch(Exception e){
  e.printStackTrace();
}
%>
<%response.sendRedirect("retelnewtaskinsert.jsp");%>