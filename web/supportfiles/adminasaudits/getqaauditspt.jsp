<%-- 
    Document   : getqaaudits
    Created on : Jan 18, 2015, 4:27:09 PM
    Author     : RCT-456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="rva.dbaccess.DBConnect"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<%
ArrayList<String> lauditsname=new ArrayList<String>();
ArrayList<Float> lperformancetime=new ArrayList<Float>();
float pt=0.00f;
String auditname=request.getParameter("auditname");
try{
  Connection con=DBConnect.startConnection();
  Statement st=con.createStatement();
  ResultSet res=st.executeQuery("SELECT asqaauditspt from asqaauditspt where qaauditsname='"+auditname+"' ");
  while(res.next()){
  pt=res.getFloat("asqaauditspt");
  }%>
  <br>
  <label>Performance Time:</label>
  <input type="number" name="pt" id="perftime" value="<%=pt%>" autocomplete="off" readonly>
<%
}
catch(Exception e){
  e.printStackTrace();
}
%>
