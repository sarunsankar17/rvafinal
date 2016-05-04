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
String auditname=request.getParameter("auditname");
float pt=Float.parseFloat(request.getParameter("perftime"));
int clientid=0;
Connection con=DBConnect.startConnection();
PreparedStatement pstm=null;
try{
  Statement st=con.createStatement();
  ResultSet res=st.executeQuery("Select * from asqaclients where asqaclientsname LIKE '"+clientname+"' ");
  while(res.next()){
    clientid=res.getInt("asqaclientsid");
  }
  pstm=con.prepareStatement("INSERT INTO asqaauditspt(qaauditsname,clientsid,asqaauditspt)value(?,?,?)" );
  pstm.setString(1,auditname);
  pstm.setInt(2,clientid);
  pstm.setFloat(3,pt);
  pstm.executeUpdate();
}
catch(Exception e){
  e.printStackTrace();
}
response.sendRedirect("asqaauditsupdate.jsp");
%>
  