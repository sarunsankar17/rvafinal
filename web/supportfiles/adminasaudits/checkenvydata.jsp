<%-- 
    Document   : checkenvydata
    Created on : Jan 20, 2015, 7:12:07 PM
    Author     : RCT-456
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="rva.dbaccess.*"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<%
  try{
    String name=null;
String process=request.getParameter("process");
Connection con=DBConnect.startConnection();
Statement st=con.createStatement();
ResultSet res=null;
if(process.equalsIgnoreCase("cafenameins")){
  name=request.getParameter("name");
  res=st.executeQuery("select * from envysioncafes where envysioncafesname like '"+name+"' ");
  if(res.next())
  {
  %>
  <p id="res">Value already available. Please Change the Cafe Name.</p>
<%}
  else{
    %>
    <button type="submit">SAVE</button>
  <%
  }
}
else if(process.equalsIgnoreCase("cafenameupd")){
  name=request.getParameter("name");
  res=st.executeQuery("select * from envysioncafes where envysioncafesname like '"+name+"' ");
  if(res.next())
  {
  %>
  <p id="res">Value already available. Please Change the Cafe Name.</p>
<%}
  else{
    %>
    <button type="submit">SAVE</button>
  <%
  }
}
else if(process.equalsIgnoreCase("tasknameins")){
  name=request.getParameter("name");
  res=st.executeQuery("select * from envysiontasks where envysiontaskname like '"+name+"' ");
  if(res.next())
  {
  %>
  <p id="res">Value already available. Please Change the Task Name.</p>
<%}
  else{
    %>
    <label>Time To Perform In Minutes:</label><input type="text" name="pt" placeholder="Time To Perform" autocomplete="off" required><br><br>
    <button type="submit">SAVE</button>
  <%
  }
}
else if(process.equalsIgnoreCase("tasknameupd")){
  name=request.getParameter("name");
  res=st.executeQuery("select * from envysiontasks where envysiontaskname like '"+name+"' ");
  if(res.next())
  {
  %>
  <p id="res">Value already available. Please Change the Task Name.</p>
<%}
  else{
    %>
    <label>Time To Perform In Minutes:</label><input type="text" name="pt" placeholder="Time To Perform" autocomplete="off" required><br><br>
    <button type="submit">SAVE</button>
  <%
  }
}}
  catch(Exception e){
    e.printStackTrace();
  }
%>
