<%-- 
    Document   : savedetails
    Created on : Dec 23, 2014, 3:21:58 PM
    Author     : RCT-456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="rva.dbaccess.*"%>

<%
String auditorsname=null;
int auditorsnamerowid=0;
String asauditorsid=null;
try{
  asauditorsid=request.getParameter("insasid");
  auditorsname=request.getParameter("auditorsname");
  Connection con=DBConnect.startConnection();
  Statement st=con.createStatement();
  PreparedStatement pstm=null;
  ResultSet res=st.executeQuery("SELECT * from auditors where auditorsname LIKE '"+auditorsname+"' ");
  while(res.next()){
    auditorsnamerowid=res.getInt("auditorsid");
  }
  pstm=con.prepareStatement("INSERT INTO asauditorslogin(auditorsloginname,auditorsid) VALUES(?,?)");
  pstm.setString(1, asauditorsid);
  pstm.setInt(2, auditorsnamerowid);
  pstm.executeUpdate();
  response.sendRedirect("asauditorsloginiddetails.jsp");
}

catch(Exception e){
  System.out.println(e);
}

%>
