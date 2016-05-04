<%-- 
    Document   : savedttupdatedtask
    Created on : Apr 17, 2015, 5:40:51 PM
    Author     : RCT-456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="rva.administrator.*"%>
<%@page import="rva.dbaccess.DBConnect"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<%
int rowno=Integer.parseInt(request.getParameter("rowno"));
ChangeDateFormat cdf=new ChangeDateFormat();
out.println(rowno);
String logmeinname=request.getParameter("logmeinname");
String taskname=request.getParameter("taskname");
String performdate=cdf.toDbDate(request.getParameter("performdate"));
String auditorname=request.getParameter("auditorname");
String taskstage=request.getParameter("processstage");
out.println(logmeinname);
out.println(taskname);
out.println(performdate);
out.println(auditorname);
out.println(taskstage);
try{
  Connection con=DBConnect.startConnection();
  Statement st=con.createStatement();
  st.executeUpdate("UPDATE dttmissedvalues SET `logmeinname`='"+logmeinname+"',`taskname`='"+taskname+"',`auditorname`='"+auditorname+"',`performeddate`='"+performdate+"',`processstage`='"+taskstage+"' where dttmissedvaluesid ="+rowno+" ");
}
catch(Exception e){
  e.printStackTrace();
}
response.sendRedirect("dttmissedtasks.jsp");
%>
