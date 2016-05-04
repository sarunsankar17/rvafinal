<%-- 
    Document   : getenvypt
    Created on : Jan 20, 2015, 5:21:36 PM
    Author     : RCT-456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="rva.dbaccess.*"%>
<%@page import="java.sql.*"%>
<%
int perftime=0;
String taskname=request.getParameter("task");
try{
  Connection con=DBConnect.startConnection();
  Statement st=con.createStatement();
  ResultSet res=st.executeQuery("SELECT * from envysiontasks where envysiontaskname LIKE '"+taskname+"' ");
  while(res.next()){
    perftime=res.getInt("timetoperform");
  }
}
catch(Exception e){
  e.printStackTrace();
}
%>
Performance Time In Minutes:<input type="text" value="<%=perftime%>" name="envyperftime" id="perftime" readonly>